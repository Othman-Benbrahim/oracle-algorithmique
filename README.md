Jeu de cartes sous forme d'oracle. 

Le Système Fractales du Destin (FdD) est une application web interactive qui fonctionne comme un oracle algorithmique à usage décisionnel et psychologique. Inspirée de la méthode Prunckun — framework d'analyse du renseignement —, l'application combine un jeu de cartes symbolique avec de l'intelligence artificielle générative pour produire des analyses situationnelles personnalisées.

L'utilisateur décrit une situation, sélectionne un mode d'analyse, et l'oracle tire une carte depuis un deck de 59 cartes structurées. Une IA sélectionne la carte la plus pertinente parmi le deck complet, puis génère un diagnostic, des scénarios probabilistes et une recommandation tactique adaptée.

1.1 Fiche d'identité
Nom du projet	Système Fractales du Destin (Oracle FdD)
Type d'application	Application web PHP — Oracle IA interactif
Méthode de référence	Méthode Prunckun (renseignement & analyse situationnelle)
BDD - MYSQL
IA Gateway	OpenRouter API (openrouter.ai)
Modèles IA utilisés	GPT-4o Mini / Claude 3 Haiku / Gemini 1.5 Flash
Langage back-end	PHP (avec PDO/MySQL)
Langage front-end	HTML5, CSS3, JavaScript (Vanilla)
Format de données	JSON (échanges IA), MySQL (persistance deck)

2. Architecture technique
2.1 Structure des fichiers
Fichier	Description
index.php	Interface utilisateur principale. Gère l'affichage, les modes, l'animation des cartes, l'historique local et les appels AJAX vers oracle.php.
oracle.php	Moteur back-end. Reçoit la requête POST, interroge la BDD, construit le prompt IA, appelle OpenRouter, parse la réponse et retourne le JSON final.
db.php	Fichier de configuration de la connexion à la base de données MySQL via PDO (non utilisé directement par oracle.php qui embarque sa propre connexion).
if0_40842600_jeu_cartes.sql	Dump SQL complet du deck de 59 cartes. Contient la structure de la table fdd_deck et toutes les données d'initialisation.

2.2 Flux de traitement
Voici le cycle complet d'une requête utilisateur :
•	L'utilisateur saisit sa situation dans le textarea et choisit un mode (Psyché, Tactique ou Glitch).
•	index.php envoie une requête POST à oracle.php avec les paramètres user_input et mode.
•	oracle.php se connecte à la base MySQL et récupère l'ensemble des 59 cartes (code, nom, resume_prompt).
•	Le deck est encodé en JSON compact et injecté dans un System Prompt construit dynamiquement selon le mode sélectionné.
•	L'appel est envoyé à l'API OpenRouter avec une liste de modèles en fallback (GPT-4o Mini > Claude 3 Haiku > Gemini 1.5 Flash).
•	L'IA retourne un JSON structuré avec : selected_card_code, diagnostic, interpretation, conseil.
•	oracle.php récupère les données complètes de la carte sélectionnée depuis la BDD, puis retourne le JSON final à index.php.
•	Le front-end anime l'affichage de la carte et affiche l'analyse en mode typewriter.

3. Base de données
3.1 Structure de la table fdd_deck
Colonne	Type	Rôle
id	INT (PK, AI)	Identifiant unique auto-incrémenté
code	VARCHAR(10)	Code unique de la carte (ex : M-01, A-12, I-07)
nom	VARCHAR(100)	Nom de la carte (ex : SIGNAL FAIBLE)
type	VARCHAR(20)	Catégorie de la carte (MANIFESTATION, ARCHÉTYPE, INTERVENTION, SPÉCIALE, RELIQUE)
fonction	VARCHAR(100)	Fonction principale de la carte (ex : Détection, Rupture, Blocage)
resume_prompt	TEXT	Texte condensé transmis à l'IA pour contextualiser la carte (mots-clés, ambiance, sens)
image_url	VARCHAR(255)	Chemin relatif vers l'image de la carte (ex : images/cards/M-01.webp)

3.2 Composition du deck (59 cartes)
Type	Nb cartes	Codes	Rôle
MANIFESTATION	19	M-01 à M-19	Représente des phénomènes observables, des événements ou des dynamiques du réel (ex : Cygne Noir, Bruit Blanc, Zone Morte).
ARCHÉTYPE	20	A-01 à A-20	Figures symboliques incarnant des postures ou des énergies (ex : Le Tisseur, Le Hacker, La Pythie 2.0).
INTERVENTION	16	I-01 à I-16	Actions ou stratégies à mettre en œuvre (ex : Fragmenter, Glitch, Fork, Encryption).
SPÉCIALE	2	S-01 à S-02	Cartes à fort impact symbolique : victoire totale (L'Œil d'Iris) ou reset complet (Crash Sémiotique).
RELIQUE	2	R-01 à R-02	Objets de pouvoir symboliques guidant l'orientation (Le Codex, Boussole Sémiotique).

4. Intégration de l'Intelligence Artificielle
4.1 Stratégie de prompt
Le System Prompt transmis à l'IA est construit dynamiquement à chaque requête et contient trois éléments fondamentaux :
•	L'identité de l'oracle : « Tu es l'Oracle du Système Fractales du Destin (Méthode Prunckun). »
•	Le rôle de l'analyste, adapté au mode choisi par l'utilisateur.
•	Le deck complet encodé en JSON (code, nom, resume_prompt pour chaque carte), afin que l'IA puisse choisir la carte la plus pertinente de manière autonome.

4.2 Les trois modes d'analyse
❤️ PSYCHÉ (défaut)	Profileur comportemental — focus sur les motivations profondes de la situation.
⚔️ TACTIQUE	Officier de renseignement militaire — focus Capacité vs Intention.
🔮 GLITCH	Analyste de données quantique — focus sur les anomalies et glitchs de réalité.

4.3 Format de réponse attendu
L'IA doit retourner un objet JSON strict avec quatre champs :
•	selected_card_code : le code de la carte choisie dans le deck (ex : A-12).
•	diagnostic : analyse courte de la situation actuelle de l'utilisateur.
•	interpretation : explication du lien entre la carte choisie et le problème, avec scénario critique vs optimisé.
•	conseil : action impérative à suivre — recommandation tactique concrète.

4.4 Système de fallback multi-modèles
En cas d'échec d'un modèle (timeout, erreur de parsing, réponse invalide), oracle.php tente automatiquement le modèle suivant dans la liste :
•	1er essai : openai/gpt-4o-mini
•	2e essai : anthropic/claude-3-haiku
•	3e essai : google/gemini-1.5-flash

5. Interface utilisateur
5.1 Esthétique et ambiance
L'interface adopte une esthétique cyberpunk/terminal : fond quasi-noir (#050505), typographie monospace (Courier New), couleurs néon (bleu électrique #00f3ff et violet #bc13fe), effet de scanlines CSS couvrant l'ensemble de la page. L'ensemble évoque un terminal de renseignement ou un écran d'opérations.

5.2 Composants de l'interface
•	Affichage de la carte : image 300×500px avec animation de retournement (effet edge-on en CSS + scaleX) et tremblement pendant le chargement.
•	Sélecteur de mode : trois boutons avec état actif (classe CSS .active) permettant de basculer entre les modes Psyché, Tactique et Glitch.
•	Zone de saisie : textarea stylisée en vert néon pour la saisie de la situation à analyser.
•	Terminal de sortie : div #terminal-output avec bordure violette, affichant les résultats de l'analyse en mode typewriter (caractère par caractère).
•	Historique local : les 5 dernières analyses sont sauvegardées dans le localStorage du navigateur et affichées sous le terminal.
•	Effets sonores : deux fichiers audio (click.mp3, reveal.mp3) déclenchés aux moments clés de l'interaction.

6 Glossaire

Méthode Prunckun	Framework d'analyse du renseignement développé par Hank Prunckun, utilisé ici comme référence conceptuelle pour structurer l'oracle.
Deck	L'ensemble des 59 cartes stockées en base de données, organisées en 5 types : Manifestation, Archétype, Intervention, Spéciale, Relique.
System Prompt	Instruction de contexte transmise à l'IA avant le message utilisateur, définissant son rôle, ses données et le format de sa réponse.
OpenRouter	Passerelle API permettant d'accéder à plusieurs modèles IA (OpenAI, Anthropic, Google) via une interface unifiée.
Fallback	Mécanisme de substitution automatique : si un modèle IA échoue, le suivant de la liste est essayé.
Typewriter	Effet d'affichage progressif du texte, caractère par caractère, simulant une saisie en temps réel sur un terminal.
resume_prompt	Champ de la table fdd_deck contenant les mots-clés, l'ambiance et le sens de chaque carte, transmis à l'IA pour la sélection.
Edge-on	Animation CSS de retournement de la carte utilisant scaleX(0) pour simuler une rotation sur l'axe vertical.

