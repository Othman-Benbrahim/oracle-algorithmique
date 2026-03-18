-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : sql111.infinityfree.com
-- Généré le :  lun. 16 fév. 2026 à 23:19
-- Version du serveur :  11.4.10-MariaDB
-- Version de PHP :  7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `if0_40842600_jeu_cartes`
--

-- --------------------------------------------------------

--
-- Structure de la table `fdd_deck`
--

CREATE TABLE `fdd_deck` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `fonction` varchar(100) NOT NULL,
  `resume_prompt` text NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `fdd_deck`
--

INSERT INTO `fdd_deck` (`id`, `code`, `nom`, `type`, `fonction`, `resume_prompt`, `image_url`) VALUES
(1, 'M-01', 'SIGNAL FAIBLE', 'MANIFESTATION', 'Détection', 'Mots-clés : PATTERN, INTUITION, ANOMALIE. Ambiance : Un murmure dans un bruit blanc. Sens : Un détail insignifiant cache une vérité énorme. Ne pas ignorer ce qui cloche.', 'images/cards/M-01.webp'),
(2, 'M-02', 'CYGNE NOIR', 'MANIFESTATION', 'Rupture', 'Mots-clés : IMPOSSIBILITÉ STATISTIQUE, CHOC, ERREUR SYSTÈME. Ambiance : Une vitre qui explose en silence. Sens : L\'événement imprévisible qui change toutes les règles. Préparation impossible.', 'images/cards/M-02.webp'),
(3, 'M-03', 'STASE FORCÉE', 'MANIFESTATION', 'Blocage', 'Mots-clés : BUFFERING, GEL, PRISON ADMINISTRATIVE. Ambiance : Une salle d\'attente infinie sous néons froids. Sens : Interdiction de bouger. Le système vous a mis en pause. Patience ou mort lente.', 'images/cards/M-03.webp'),
(4, 'M-04', 'BRUIT BLANC', 'MANIFESTATION', 'Confusion', 'Mots-clés : SATURATION, FAKE NEWS, BROUILLAGE. Ambiance : Mille écrans allumés sur des chaînes différentes. Sens : La vérité est noyée sous le volume. Impossible de distinguer l\'ami de l\'ennemi.', 'images/cards/M-04.webp'),
(5, 'M-05', 'MASSE CRITIQUE', 'MANIFESTATION', 'Surcharge', 'Mots-clés : PRESSION HYDRAULIQUE, EFFET DE MEUTE, RUPTURE. Ambiance : Un barrage qui craque sous l\'eau. Sens : L\'opinion collective écrase l\'individu. Trop de poids, trop de regards.', 'images/cards/M-05.webp'),
(6, 'M-06', 'CORRECTION BRUTALE', 'MANIFESTATION', 'Pénurie', 'Mots-clés : KRACH, CHUTE DE TENSION, RÉALITÉ FROIDE. Ambiance : Coupure d\'électricité en plein hiver. Sens : Le marché ou la vie reprend ses droits. Perte sèche. Retour violent sur terre.', 'images/cards/M-06.webp'),
(7, 'M-07', 'SINGULARITÉ LOCALE', 'MANIFESTATION', 'Accélération', 'Mots-clés : OVERCLOCKING, VERTIGE, LOI DE MOORE. Ambiance : Un train qui va trop vite pour les rails. Sens : Les événements s\'enchaînent à une vitesse inhumaine. L\'adaptation est impossible, il faut surfer le chaos.', 'images/cards/M-07.webp'),
(8, 'M-08', 'ZONE AUTONOME', 'MANIFESTATION', 'Sanctuaire', 'Mots-clés : AIR GAP, BUNKER, DÉCONNEXION. Ambiance : Une cabane invisible sur les radars. Sens : Un espace de liberté temporaire hors du réseau. Sécurité absolue mais isolation totale.', 'images/cards/M-08.webp'),
(9, 'M-09', 'PÉNURIE ORGANISÉE', 'MANIFESTATION', 'Taxe', 'Mots-clés : VAMPIRISME, ABONNEMENT FORCÉ, RATIONNEMENT. Ambiance : Une goutte d\'eau vendue au prix de l\'or. Sens : On vous maintient artificiellement dans le besoin pour mieux vous contrôler.', 'images/cards/M-09.webp'),
(10, 'M-10', 'SOFT POWER', 'MANIFESTATION', 'Influence', 'Mots-clés : DIPLOMATIE TOXIQUE, SÉDUCTION, LOBBYING. Ambiance : Un sourire avec des dents en or. Sens : La menace ne vient pas d\'une arme, mais d\'une poignée de main. Manipulation consentie.', 'images/cards/M-10.webp'),
(11, 'M-11', 'ECHO CHAMBER', 'MANIFESTATION', 'Isolement', 'Mots-clés : FEEDBACK LOOP, NARCISSISME, ALGO DE RECOMMANDATION. Ambiance : Une galerie de miroirs déformants. Sens : Vous n\'entendez que ce que vous voulez entendre. Enfermement dans sa propre vérité.', 'images/cards/M-11.webp'),
(12, 'M-12', 'L\'EFFET PAPILLON', 'MANIFESTATION', 'Amplification', 'Mots-clés : CHAOS, RÉACTION EN CHAÎNE, DOMINO. Ambiance : Une étincelle dans une poudrière. Sens : Une micro-action va provoquer un ouragan. Disproportion totale entre la cause et l\'effet.', 'images/cards/M-12.webp'),
(13, 'M-13', 'LE LANCEUR D\'ALERTE', 'MANIFESTATION', 'Transparence', 'Mots-clés : LEAK, VÉRITÉ NUE, SCANDALE. Ambiance : Des documents classifiés jetés dans la rue. Sens : Fin du secret. La lumière crue blesse les yeux mais nettoie la plaie.', 'images/cards/M-13.webp'),
(14, 'M-14', 'FAUX DRAPEAU', 'MANIFESTATION', 'Leurre', 'Mots-clés : HONEYPOT, DIVERSION, THEÂTRE D\'OMBRES. Ambiance : Un mannequin en plastique habillé en soldat. Sens : Ce que vous attaquez n\'est pas la vraie cible. Vous êtes manipulé pour regarder ailleurs.', 'images/cards/M-14.webp'),
(15, 'M-15', 'OBSOLESCENCE PROGRAMMÉE', 'MANIFESTATION', 'Dégradation', 'Mots-clés : ENTROPIE, ROUILLE, FIN DE CYCLE. Ambiance : Une décharge électronique sous la pluie. Sens : Inutile de réparer, c\'est conçu pour mourir. Il faut accepter la fin et jeter.', 'images/cards/M-15.webp'),
(16, 'M-16', 'LA BULLE SPÉCULATIVE', 'MANIFESTATION', 'Risque', 'Mots-clés : HYPER-CROISSANCE, ILLUSION, FOMO. Ambiance : Un casino flottant dans le vide. Sens : Tout semble magnifique et riche, mais c\'est vide à l\'intérieur. Danger d\'éclatement imminent.', 'images/cards/M-16.webp'),
(17, 'M-17', 'ZONE MORTE', 'MANIFESTATION', 'Silence', 'Mots-clés : NO SIGNAL, VIDE SIDÉRAL, ABANDON. Ambiance : Un téléphone qui ne capte aucun réseau. Sens : Absence de réponse. Vous êtes seul face au silence. Personne ne viendra.', 'images/cards/M-17.webp'),
(18, 'M-18', 'LE VIRAL', 'MANIFESTATION', 'Propagation', 'Mots-clés : CONTAGION, MEME, ÉPIDÉMIE. Ambiance : Une bactérie sous microscope qui se divise. Sens : Une idée ou un problème qui se multiplie tout seul. Impossible à arrêter, il faut laisser passer la fièvre.', 'images/cards/M-18.webp'),
(19, 'M-19', 'LE PROTOCOLE FANTÔME', 'MANIFESTATION', 'Disparition', 'Mots-clés : STEALTH, VPN, EFFACEMENT DES LOGS. Ambiance : Une silhouette qui s\'évapore dans la brume. Sens : Agir sans laisser de trace. Devenir un fantôme pour survivre ou pour frapper.', 'images/cards/M-19.webp'),
(20, 'A-01', 'LE TISSEUR', 'ARCHÉTYPE', 'Connexion', 'Mots-clés : SYNERGIE, RÉSEAU NEURONAL, WEBMASTER. Ambiance : Une araignée tissant de la fibre optique. Sens : Relier des points distants. Intelligence collective. Créer du lien là où il y a du vide.', 'images/cards/A-01.webp'),
(21, 'A-02', 'L\'ERRANT', 'ARCHÉTYPE', 'Exploration', 'Mots-clés : ZÉRO KNOWLEDGE, VAGABOND, DÉBUTANT. Ambiance : Un sac à dos et un horizon infini. Sens : Sauter dans le vide sans parachute. L\'innocence comme seule protection. Liberté absolue.', 'images/cards/A-02.webp'),
(22, 'A-03', 'LE GARDIEN DU SEUIL', 'ARCHÉTYPE', 'Défense', 'Mots-clés : FIREWALL, VIGILE, CRYPTOGRAPHIE. Ambiance : Une porte blindée avec un scanner rétinien. Sens : Une épreuve de sécurité. Seuls ceux qui ont le mot de passe (ou la valeur) passent.', 'images/cards/A-03.webp'),
(23, 'A-04', 'L\'EFFONDRÉ', 'ARCHÉTYPE', 'Destruction', 'Mots-clés : BLUE SCREEN, CATACLYSME, RÉINITIALISATION. Ambiance : Une tour de verre qui s\'écroule au ralenti. Sens : Destruction nécessaire d\'une structure pourrie. Douleur salvatrice.', 'images/cards/A-04.webp'),
(24, 'A-05', 'LA PYTHIE 2.0', 'ARCHÉTYPE', 'Anticipation', 'Mots-clés : BIG DATA, PRECOGNITION, ORACLE. Ambiance : Des yeux fermés connectés à des câbles de données. Sens : Savoir avant que cela n\'arrive. Écouter les données invisibles.', 'images/cards/A-05.webp'),
(25, 'A-06', 'LE MIROIR', 'ARCHÉTYPE', 'Renvoi', 'Mots-clés : REFLEXION, KARMA, IDENTITÉ. Ambiance : Un écran noir qui reflète votre visage fatigué. Sens : Ce que vous subissez est ce que vous avez créé. Affronter sa propre image sans filtre.', 'images/cards/A-06.webp'),
(26, 'A-07', 'L\'ALGORITHME SOUVERAIN', 'ARCHÉTYPE', 'Contrôle', 'Mots-clés : LOI MARTIALE, CODE CIVIL, STRUCTURE RIGIDE. Ambiance : Un trône fait de cartes mères. Sens : L\'ordre règne. Pas de place pour l\'improvisation. Il faut obéir à la logique supérieure.', 'images/cards/A-07.webp'),
(27, 'A-08', 'L\'ADDICTION', 'ARCHÉTYPE', 'Lien Toxique', 'Mots-clés : DOPAMINE, SCROLL INFINI, CHAÎNES DORÉES. Ambiance : Une seringue connectée à un port USB. Sens : Plaisir immédiat, douleur future. Être esclave de ses propres désirs.', 'images/cards/A-08.webp'),
(28, 'A-09', 'LE SIMULACRE', 'ARCHÉTYPE', 'Illusion', 'Mots-clés : DEEPFAKE, RÉALITÉ VIRTUELLE, MENSONGE. Ambiance : Un décor de cinéma qui prend l\'eau. Sens : Rien n\'est vrai. Vous naviguez dans un rêve ou un cauchemar fabriqué par un autre.', 'images/cards/A-09.webp'),
(29, 'A-10', 'LA RÉSILIENCE', 'ARCHÉTYPE', 'Soin', 'Mots-clés : AUTO-RÉPARATION, BACKUP, ENDURANCE. Ambiance : Une fleur qui pousse dans le béton. Sens : Capacité à encaisser les chocs sans rompre. Guérison lente mais certaine.', 'images/cards/A-10.webp'),
(30, 'A-11', 'LE SACRIFICE', 'ARCHÉTYPE', 'Échange', 'Mots-clés : UPLOAD, LÂCHER-PRISE, SUSPENSION. Ambiance : Un corps cryogénisé en attente de réveil. Sens : Perdre maintenant pour gagner plus tard. Accepter d\'être bloqué pour changer de perspective.', 'images/cards/A-11.webp'),
(31, 'A-12', 'LE HACKER', 'ARCHÉTYPE', 'Création', 'Mots-clés : SYSTÈME D, BRICOLAGE, CODE CRÉATIF. Ambiance : Un atelier rempli de câbles et de pièces détachées. Sens : Faire beaucoup avec peu. Détourner les outils pour créer sa propre voie.', 'images/cards/A-12.webp'),
(32, 'A-13', 'LA MÈRE MACHINE', 'ARCHÉTYPE', 'Fertilité', 'Mots-clés : PRODUCTION MASSE, ABONDANCE, IMPRIMANTE 3D. Ambiance : Une usine automatisée qui crée la vie. Sens : Période de créativité intense. Les idées deviennent matière. Croissance exponentielle.', 'images/cards/A-13.webp'),
(33, 'A-14', 'LE VECTEUR', 'ARCHÉTYPE', 'Vitesse', 'Mots-clés : PROPULSION, OBJECTIF VERROUILLÉ, AMBITION. Ambiance : Un véhicule blindé lançant à pleine vitesse. Sens : Rien ne peut vous arrêter. Maîtrise des forces contraires.', 'images/cards/A-14.webp'),
(34, 'A-15', 'ROUE DE L\'ENTROPIE', 'ARCHÉTYPE', 'Hasard', 'Mots-clés : RNG, CASINO, CYCLE. Ambiance : Une roulette russe numérique. Sens : Le destin tourne sans logique. Hauts et bas imprévisibles. Accepter l\'incontrôlable.', 'images/cards/A-15.webp'),
(35, 'A-16', 'LA TRANSITION', 'ARCHÉTYPE', 'Métamorphose', 'Mots-clés : MISE A JOUR MAJEURE, DEUIL, NOUVELLE VERSION. Ambiance : Un serpent qui mue, laissant sa vieille peau sèche. Sens : La fin nécessaire. Ce n\'est pas la mort, c\'est un changement d\'état irréversible.', 'images/cards/A-16.webp'),
(36, 'A-17', 'L\'HYBRIDE', 'ARCHÉTYPE', 'Équilibre', 'Mots-clés : CYBORG, FUSION, HARMONIE. Ambiance : De l\'eau qui se mélange à de l\'huile synthétique. Sens : Réconcilier deux opposés. Trouver le calme au milieu de la tempête. Patience.', 'images/cards/A-17.webp'),
(37, 'A-18', 'LE SIGNAL PUR', 'ARCHÉTYPE', 'Espoir', 'Mots-clés : GUIDANCE, FOI, ÉTOILE POLAIRE. Ambiance : Un phare laser dans une nuit de brouillard. Sens : Une vérité simple et belle qui guide. Inspiration spirituelle. La voie est libre.', 'images/cards/A-18.webp'),
(38, 'A-19', 'LA FUSION', 'ARCHÉTYPE', 'Succès', 'Mots-clés : ÉNERGIE NUCLÉAIRE, JOIE, CLARTÉ TOTALE. Ambiance : Un soleil artificiel qui illumine tout. Sens : Réussite éclatante. Tout est connecté et fonctionne parfaitement. Bonheur brut.', 'images/cards/A-19.webp'),
(39, 'A-20', 'LE RÉSEAU GLOBAL', 'ARCHÉTYPE', 'Achèvement', 'Mots-clés : HOLISME, FIN DE MISSION, PLÉNITUDE. Ambiance : La Terre vue de l\'espace, connectée par des lumières. Sens : Le cycle est bouclé. Vous avez tout. Accomplissement suprême.', 'images/cards/A-20.webp'),
(40, 'I-01', 'FRAGMENTER', 'INTERVENTION', 'Attaque', 'Mots-clés : DIVISER POUR RÉGNER, ANALYSE, DÉCOUPAGE. Ambiance : Un laser qui découpe une porte. Sens : Ne pas attaquer le gros problème. Le briser en petits morceaux gérables.', 'images/cards/I-01.webp'),
(41, 'I-02', 'TRANSDUCTION', 'INTERVENTION', 'Conversion', 'Mots-clés : ALCHIMIE, RECYCLAGE ÉNERGÉTIQUE, ADAPTATION. Ambiance : Transformer le plomb en or via un réacteur. Sens : Utiliser l\'énergie de l\'attaque adverse pour la renvoyer. Changer le négatif en positif.', 'images/cards/I-02.webp'),
(42, 'I-03', 'RÉVÉLER', 'INTERVENTION', 'Information', 'Mots-clés : DECRYPTAGE, SCAN, LUMIÈRE NOIRE. Ambiance : Une lampe torche dans une cave sombre. Sens : Chercher la vérité cachée. Ne pas se contenter de la surface.', 'images/cards/I-03.webp'),
(43, 'I-04', 'POLYLOGUE', 'INTERVENTION', 'Copie', 'Mots-clés : MIMÉTISME, TRADUCTION, NÉGOCIATION. Ambiance : Un synthétiseur vocal qui imite toutes les langues. Sens : Parler le langage de l\'autre pour le comprendre ou le tromper.', 'images/cards/I-04.webp'),
(44, 'I-05', 'PARE-FEU COGNITIF', 'INTERVENTION', 'Contre-Sort', 'Mots-clés : BOUCLIER MENTAL, SCEPTICISME, REFUS. Ambiance : Un champ de force invisible qui repousse les ondes. Sens : Protéger son esprit des influences extérieures. Dire NON.', 'images/cards/I-05.webp'),
(45, 'I-06', 'INJECTION SQL', 'INTERVENTION', 'Vol', 'Mots-clés : PIRATAGE, BRÈCHE, AUDACE. Ambiance : Une seringue numérique plantée dans une base de données. Sens : Entrer par la porte de derrière. Utiliser les failles du système.', 'images/cards/I-06.webp'),
(46, 'I-07', 'MÉMOIRE EIDÉTIQUE', 'INTERVENTION', 'Recyclage', 'Mots-clés : ARCHIVES, HISTORIQUE, LEÇONS DU PASSÉ. Ambiance : Une bibliothèque poussiéreuse numérisée. Sens : La solution est dans ce que vous avez déjà vécu. Ne pas réinventer la roue.', 'images/cards/I-07.webp'),
(47, 'I-08', 'BOUCLE RÉTROACTION', 'INTERVENTION', 'Répétition', 'Mots-clés : LARSEN, AMPLIFICATION, PERSISTANCE. Ambiance : Un micro collé à un haut-parleur. Sens : Insister jusqu\'à ce que ça casse ou que ça passe. Répéter le message.', 'images/cards/I-08.webp'),
(48, 'I-09', 'GLITCH', 'INTERVENTION', 'Interrupt', 'Mots-clés : BUG, SABOTAGE, IMPRÉVU. Ambiance : Un écran qui grésille et se fige. Sens : Provoquer une erreur volontaire pour arrêter la machine. Casser le rythme.', 'images/cards/I-09.webp'),
(49, 'I-10', 'FORK', 'INTERVENTION', 'Choix', 'Mots-clés : BIFURCATION, SCHISME, DÉCISION. Ambiance : Un chemin de fer qui se sépare en deux. Sens : Il faut choisir maintenant. On ne peut pas suivre les deux chemins. Séparation nécessaire.', 'images/cards/I-10.webp'),
(50, 'I-11', 'PATCH 2.1', 'INTERVENTION', 'Upgrade', 'Mots-clés : SOIN, CORRECTION, OPTIMISATION. Ambiance : Un mécano qui soude une plaque de métal sur une plaie. Sens : Réparer ce qui est cassé. Améliorer l\'existant plutôt que de jeter.', 'images/cards/I-11.webp'),
(51, 'I-12', 'DDOS', 'INTERVENTION', 'Paralysie', 'Mots-clés : SATURATION, MASSE, FORCE BRUTE. Ambiance : Une armée de zombies numériques qui frappe à la porte. Sens : Submerger l\'adversaire sous le nombre. L\'étouffer.', 'images/cards/I-12.webp'),
(52, 'I-13', 'ENCRYPTION', 'INTERVENTION', 'Secret', 'Mots-clés : CRYPTAGE, SILENCE, DISCRÉTION. Ambiance : Un coffre-fort mathématique inviolable. Sens : Garder ses plans pour soi. Le silence est votre meilleure arme.', 'images/cards/I-13.webp'),
(53, 'I-14', 'PING', 'INTERVENTION', 'Sondage', 'Mots-clés : TEST, SONAR, CONTACT LÉGER. Ambiance : Un sous-marin envoyant une onde dans le noir. Sens : Envoyer un petit signal pour voir qui répond. Tester l\'eau avant de plonger.', 'images/cards/I-14.webp'),
(54, 'I-15', 'ROOT ACCESS', 'INTERVENTION', 'Commande', 'Mots-clés : POUVOIR ABSOLU, ADMIN, DICTATURE. Ambiance : La clé maître qui ouvre toutes les portes. Sens : Prendre le contrôle total de la situation. Imposer sa loi.', 'images/cards/I-15.webp'),
(55, 'I-16', 'FORMAT C:', 'INTERVENTION', 'Effacement', 'Mots-clés : PURGE, RESET TOTAL, OBLI. Ambiance : Un disque dur qui tourne à vide après effacement. Sens : Tout détruire pour reconstruire sur du propre. Radical et douloureux.', 'images/cards/I-16.webp'),
(56, 'S-01', 'L\'ŒIL D\'IRIS', 'SPÉCIALE', 'Victoire', 'Mots-clés : OMNISCIENCE, CLARTÉ DIVINE, VICTOIRE TOTALE. Ambiance : Un satellite qui voit tout sur Terre. Sens : Vous avez toutes les cartes en main. Vous voyez l\'avenir. Succès garanti.', 'images/cards/S-01.webp'),
(57, 'S-02', 'CRASH SÉMIOTIQUE', 'SPÉCIALE', 'Reset', 'Mots-clés : FATAL ERROR, FIN DE PARTIE, NÉANT. Ambiance : Le noir absolu après que l\'écran s\'éteigne. Sens : Échec total du système de pensée actuel. Il faut tout repenser depuis zéro.', 'images/cards/S-02.webp'),
(58, 'R-01', 'LE CODEX', 'RELIQUE', 'Savoir', 'Mots-clés : DOCUMENTATION, SAVOIR ANCESTRAL, MANUEL. Ambiance : Un vieux livre poussiéreux à côté d\'une tablette. Sens : La réponse est écrite quelque part. Il faut étudier et apprendre.', 'images/cards/R-01.webp'),
(59, 'R-02', 'BOUSSOLE SÉMIOTIQUE', 'RELIQUE', 'Orientation', 'Mots-clés : INTUITION, NORD MAGNÉTIQUE, DESTIN. Ambiance : Une aiguille qui tourne follement avant de se fixer. Sens : Faites confiance à votre instinct, pas à la logique. Vous connaissez le chemin.', 'images/cards/R-02.webp');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `fdd_deck`
--
ALTER TABLE `fdd_deck`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `fdd_deck`
--
ALTER TABLE `fdd_deck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
