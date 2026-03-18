<?php
// FICHIER : oracle.php
// Localisation : /www/oracle-algorithmique/oracle.php

ini_set('display_errors', 0);
error_reporting(E_ALL);
@set_time_limit(30);

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// --- CONFIGURATION ---
$apiKey = ''; 

// Identifiants (À VERIFIER DANS TON PANEL)
$dbHost = ''; 
$dbName = ''; // Le nom de ta base 
$dbUser = '';                  // Ton utilisateur 
$dbPass = '';        // Ton mot de passe 

$models = [
    "openai/gpt-4o-mini",       
    "anthropic/claude-3-haiku", 
    "google/gemini-1.5-flash"   
];

function connectDB($h, $n, $u, $p) {
    try {
        $pdo = new PDO("mysql:host=$h;dbname=$n;charset=utf8mb4", $u, $p);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $pdo;
    } catch (PDOException $e) {
        throw new Exception("Erreur BDD : " . $e->getMessage());
    }
}

function extractJSON($text) {
    $text = str_replace(['```json', '```'], '', $text);
    $start = strpos($text, '{');
    $end = strrpos($text, '}');
    if ($start !== false && $end !== false) return substr($text, $start, ($end - $start) + 1);
    return $text;
}

$userQuery = $_POST['user_input'] ?? '';
$mode = $_POST['mode'] ?? 'psyche';

if (empty($userQuery)) { echo json_encode(['success' => false, 'error' => 'Input vide.']); exit; }

try {
    $pdo = connectDB($dbHost, $dbName, $dbUser, $dbPass);
    
    // --- ÉTAPE 1 : RÉCUPÉRATION DE TOUT LE DECK ---
    // On ne prend que le nécessaire pour alléger le JSON
    $stmt = $pdo->query("SELECT code, nom, resume_prompt FROM fdd_deck");
    $allCards = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    // Encodage en JSON compact pour l'IA
    $jsonDeck = json_encode($allCards);

    // --- ÉTAPE 2 : DÉFINITION DE L'ANALYSTE ---
    switch ($mode) {
        case 'tactique':
            $analystType = "OFFICIER DE RENSEIGNEMENT MILITAIRE. Focus : Capacité vs Intention.";
            break;
        case 'glitch':
            $analystType = "ANALYSTE DE DONNÉES QUANTIQUE. Focus : Anomalies et Glitchs de réalité.";
            break;
        default:
            $analystType = "PROFILEUR COMPORTEMENTAL. Focus : Motivations profondes.";
            break;
    }

    // --- ÉTAPE 3 : SYSTEM PROMPT AVEC DECK COMPLET ---
    $systemPrompt = "IDENTITÉ : Tu es l'Oracle du Système Fractales du Destin (Méthode Prunckun).\n" .
                    "RÔLE : $analystType\n\n" .
                    "BASE DE DONNÉES DU DECK (JSON) :\n$jsonDeck\n\n" .
                    "MISSION :\n" .
                    "1. Analyse la requête de l'utilisateur : \"$userQuery\"\n" .
                    "2. Choisis dans le JSON la CARTE la plus pertinente pour répondre à cette situation.\n" .
                    "3. Produis une analyse en JSON STRICT avec ce format :\n" .
                    "{\n" .
                    "  \"selected_card_code\": \"CODE_DE_LA_CARTE\",\n" .
                    "  \"diagnostic\": \"Analyse courte de la situation actuelle.\",\n" .
                    "  \"interpretation\": \"Explication du lien entre la carte choisie et le problème (Scénario critique vs optimisé).\",\n" .
                    "  \"conseil\": \"Action impérative à suivre.\"\n" .
                    "}";

    // --- ÉTAPE 4 : APPEL API ---
    $aiData = null;
    $errorLog = []; 

    foreach ($models as $modelToUse) {
        try {
            $data = [
                "model" => $modelToUse,
                "messages" => [
                    ["role" => "system", "content" => $systemPrompt],
                    ["role" => "user", "content" => "Génère l'analyse pour ma situation."]
                ],
                "temperature" => 0.6,
                "max_tokens" => 1000
            ];

            $ch = curl_init("https://openrouter.ai/api/v1/chat/completions");
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_TIMEOUT, 25);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_HTTPHEADER, [
                "Authorization: Bearer $apiKey",
                "Content-Type: application/json",
                "X-Title: Oracle FdD"
            ]);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
            
            $response = curl_exec($ch);
            curl_close($ch);

            $result = json_decode($response, true);
            if (!isset($result['choices'][0]['message']['content'])) throw new Exception("Erreur de réponse.");

            $cleanContent = extractJSON($result['choices'][0]['message']['content']);
            $decoded = json_decode($cleanContent, true);

            if ($decoded && isset($decoded['selected_card_code'])) {
                $aiData = $decoded;
                break; 
            }
        } catch (Exception $e) {
            $errorLog[] = $e->getMessage();
            continue;
        }
    }

    if (!$aiData) throw new Exception("L'IA n'a pas pu sélectionner de carte.");

    // --- ÉTAPE 5 : RÉCUPÉRATION DES INFOS COMPLÈTES DE LA CARTE CHOISIE ---
    $stmtFinal = $pdo->prepare("SELECT * FROM fdd_deck WHERE code = ?");
    $stmtFinal->execute([$aiData['selected_card_code']]);
    $cardFinal = $stmtFinal->fetch(PDO::FETCH_ASSOC);

    if (!$cardFinal) {
        throw new Exception("L'IA a choisi un code inexistant : " . $aiData['selected_card_code']);
    }

    // --- RÉPONSE FINALE ---
    echo json_encode([
        'success' => true,
        'card' => $cardFinal,
        'ai_analysis' => $aiData
    ]);

} catch (Exception $e) {
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
}
?>