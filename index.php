<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MOTEUR SÉMIOTIQUE FdD</title>
    <style>
        :root {
            --neon-blue: #00f3ff;
            --neon-purple: #bc13fe;
            --dark-bg: #050505;
            --term-green: #0f0;
        }
        body {
            background-color: var(--dark-bg);
            color: #eee;
            font-family: 'Courier New', monospace;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            overflow-x: hidden;
        }
        /* Effet Scanline */
        body::before {
            content: " ";
            display: block;
            position: absolute;
            top: 0; left: 0; bottom: 0; right: 0;
            background: linear-gradient(rgba(18, 16, 16, 0) 50%, rgba(0, 0, 0, 0.25) 50%), linear-gradient(90deg, rgba(255, 0, 0, 0.06), rgba(0, 255, 0, 0.02), rgba(0, 0, 255, 0.06));
            z-index: 2;
            background-size: 100% 2px, 3px 100%;
            pointer-events: none;
        }

        h1 {
            color: var(--neon-blue);
            text-shadow: 0 0 10px var(--neon-blue);
            margin-top: 20px;
            letter-spacing: 2px;
            text-align: center;
            z-index: 10;
            font-size: 1.4em;
        }

        /* --- CARTE (Système Optique) --- */
        .card-container {
            width: 300px;
            height: 500px;
            max-width: 90%; /* Sécurité Mobile */
            margin: 20px auto;
            position: relative;
            z-index: 5;
            perspective: 1000px;
        }
        
        #mainCard {
            width: 100%;
            height: 100%;
            border-radius: 15px;
            border: 2px solid var(--neon-purple);
            box-shadow: 0 0 20px rgba(188, 19, 254, 0.3);
            object-fit: cover;
            background: #000;
            transition: transform 0.6s ease-in-out, filter 0.3s; 
            transform: scaleX(1); 
        }

        .edge-on {
            transform: scaleX(0) !important;
            filter: brightness(2); /* Flash */
        }

        /* --- INTERFACE --- */
        .interface {
            width: 90%;
            max-width: 600px;
            z-index: 10;
            text-align: center;
            margin-bottom: 50px;
        }

        /* BOUTONS DE PROTOCOLE */
        .mode-selector {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 15px;
            flex-wrap: wrap; /* Sécurité Mobile */
        }
        .mode-btn {
            background: rgba(0,0,0,0.5);
            border: 1px solid #555;
            color: #777;
            padding: 8px 12px;
            font-size: 0.8em;
            cursor: pointer;
            text-transform: uppercase;
            transition: all 0.3s;
            font-family: inherit;
            clip-path: polygon(10% 0, 100% 0, 100% 80%, 90% 100%, 0 100%, 0 20%);
        }
        .mode-btn.active {
            border-color: var(--neon-blue);
            color: var(--neon-blue);
            box-shadow: 0 0 10px rgba(0, 243, 255, 0.2);
            background: rgba(0, 243, 255, 0.1);
        }
        .mode-btn:hover { border-color: #fff; color: #fff; }

        textarea {
            width: 100%;
            background: rgba(17, 17, 17, 0.9);
            border: 1px solid var(--neon-blue);
            color: var(--neon-blue);
            padding: 10px;
            font-family: inherit;
            margin-bottom: 10px;
            resize: none;
            box-sizing: border-box;
            outline: none;
            box-shadow: 0 0 5px var(--neon-blue);
        }
        button#btnAction {
            background: var(--neon-blue);
            color: #000;
            border: none;
            padding: 12px 30px;
            font-weight: bold;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 2px;
            transition: all 0.3s;
            clip-path: polygon(10% 0, 100% 0, 100% 80%, 90% 100%, 0 100%, 0 20%);
        }
        button#btnAction:hover { 
            background: #fff; 
            box-shadow: 0 0 20px var(--neon-blue); 
        }
        button#btnAction:disabled { 
            background: #333; 
            color: #555; 
            cursor: not-allowed; 
            box-shadow: none;
        }

        /* --- TERMINAL DE SORTIE --- */
        #terminal-output {
            margin-top: 20px;
            background: rgba(5, 5, 5, 0.95);
            border: 1px solid var(--neon-purple);
            border-left: 4px solid var(--neon-purple);
            padding: 20px;
            text-align: left;
            display: none;
            font-size: 0.95em;
            line-height: 1.6em;
            box-shadow: 0 0 15px rgba(188, 19, 254, 0.1);
            min-height: 100px;
        }

        .label { color: var(--neon-purple); font-weight: bold; text-transform: uppercase; }
        
        /* La boite conseil qui s'affiche proprement */
        .conseil-box { 
            border: 1px solid var(--neon-blue); 
            padding: 15px; 
            color: #fff; 
            background: rgba(0, 243, 255, 0.05);
            margin-top: 15px;
        }

        /* Styles Historique */
        #history-container {
            width: 100%;
            margin-top: 30px;
            border-top: 1px solid #333;
            padding-top: 20px;
            display: none;
        }
        .history-item {
            border-bottom: 1px dotted #333;
            padding: 10px 0;
            text-align: left;
            font-size: 0.85em;
            color: #888;
        }
        .history-item strong { color: var(--neon-blue); }

        /* Curseur Clignotant */
        .cursor::after {
            content: "▋";
            color: var(--neon-blue);
            animation: blink 1s infinite;
            margin-left: 2px;
        }
        @keyframes blink { 0%, 100% { opacity: 1; } 50% { opacity: 0; } }

        .status-log { 
            color: var(--term-green); 
            font-size: 0.8em; 
            margin-bottom: 5px; 
            height: 20px; 
            text-shadow: 0 0 5px var(--term-green); 
        }
        .debug-link { 
            font-size: 0.7em; color: #555; display: block; margin-top: 5px; text-decoration: none; text-align: right; 
        }
    </style>
</head>
<body>

    <audio id="sfx-click" src="sounds/click.mp3"></audio>
    <audio id="sfx-reveal" src="sounds/reveal.mp3"></audio>

    <h1>SYSTÈME FRACTALES DU DESTIN</h1>
    <div class="status-log" id="statusLog">:: SYSTÈME EN LIGNE ::</div>

    <div class="card-container">
        <img src="images/back.webp" alt="Carte" id="mainCard">
    </div>

    <div class="interface">
        
        <div class="mode-selector">
            <button class="mode-btn active" onclick="setMode('psyche', this)">❤️ PSYCHÉ</button>
            <button class="mode-btn" onclick="setMode('tactique', this)">⚔️ TACTIQUE</button>
            <button class="mode-btn" onclick="setMode('glitch', this)">🔮 GLITCH</button>
        </div>

        <textarea id="userInput" rows="3" placeholder="DÉCRIVEZ LA SITUATION À ANALYSER..."></textarea>
        <br>
        <button onclick="lancerMoteur()" id="btnAction">LANCER L'ANALYSE</button>

        <div id="terminal-output" class="cursor"></div>

        <div id="history-container">
            <h3 style="color:#555; font-size:0.8em; text-transform:uppercase; margin-bottom:10px;">:: ARCHIVES LOCALES ::</h3>
            <div id="history-list"></div>
            <button onclick="clearHistory()" style="background:none; border:1px solid #333; color:#555; font-size:0.7em; margin-top:10px; padding:5px; cursor:pointer;">EFFACER LOGS</button>
        </div>
    </div>

    <script>
        let currentMode = 'psyche'; // Mode par défaut

        // Chargement de l'historique au démarrage
        window.onload = function() {
            loadHistory();
        };

        function playSound(id) {
            const sound = document.getElementById(id);
            if (sound) {
                sound.volume = 0.5; 
                sound.play().catch(e => console.log("Audio non dispo"));
            }
        }

        function setMode(mode, btnElement) {
            currentMode = mode;
            document.querySelectorAll('.mode-btn').forEach(b => b.classList.remove('active'));
            btnElement.classList.add('active');
            playSound('sfx-click');
        }

        // --- GESTION HISTORIQUE ---
        function saveToHistory(question, cardName, conseil) {
            let history = JSON.parse(localStorage.getItem('fdd_history') || '[]');
            history.unshift({
                date: new Date().toLocaleTimeString(),
                q: question,
                c: cardName,
                r: conseil.substring(0, 120) + "..." // On tronque pour l'affichage
            });
            if(history.length > 5) history.pop(); // Garde les 5 derniers
            localStorage.setItem('fdd_history', JSON.stringify(history));
            loadHistory();
        }

        function loadHistory() {
            let history = JSON.parse(localStorage.getItem('fdd_history') || '[]');
            const container = document.getElementById('history-container');
            const list = document.getElementById('history-list');
            
            if(history.length === 0) {
                container.style.display = 'none';
                return;
            }
            
            container.style.display = 'block';
            list.innerHTML = history.map(h => `
                <div class="history-item">
                    <span style="color:var(--neon-blue)">[${h.date}]</span> 
                    <strong>${h.c}</strong><br>
                    <em style="color:#666">"${h.q}"</em><br>
                    <span style="color:#aaa">➔ ${h.r}</span>
                </div>
            `).join('');
        }

        function clearHistory() {
            localStorage.removeItem('fdd_history');
            loadHistory();
        }
        // -------------------------

        function typeWriter(element, html, speed = 15) {
            return new Promise(resolve => {
                let i = 0;
                function type() {
                    if (i >= html.length) {
                        resolve();
                        return;
                    }
                    if (html.charAt(i) === '<') {
                        let tag = "";
                        while (html.charAt(i) !== '>' && i < html.length) {
                            tag += html.charAt(i);
                            i++;
                        }
                        tag += '>';
                        i++;
                        element.innerHTML += tag;
                        setTimeout(type, 0); 
                    } else {
                        element.innerHTML += html.charAt(i);
                        i++;
                        setTimeout(type, speed);
                    }
                }
                type();
            });
        }

        async function lancerMoteur() {
            const input = document.getElementById('userInput').value;
            const btn = document.getElementById('btnAction');
            const log = document.getElementById('statusLog');
            const mainCard = document.getElementById('mainCard');
            const outputDiv = document.getElementById('terminal-output');

            if(!input) { alert("ERREUR : CHAMP VIDE"); return; }

            // 1. UI RESET
            playSound('sfx-click');
            btn.disabled = true;
            btn.innerText = "CONNEXION AU FLUX...";
            log.innerText = ":: INITIALISATION PROTOCOLE PRUNCKUN ::"; // Nouveau Log
            outputDiv.style.display = 'none';
            outputDiv.innerHTML = '';
            
            if (!mainCard.src.includes('back.webp')) {
                 mainCard.classList.add('edge-on');
                 setTimeout(() => {
                     mainCard.src = "images/back.webp";
                     mainCard.classList.remove('edge-on');
                 }, 400);
            }

            const container = document.querySelector('.card-container');
            let shakeInterval = setInterval(() => {
                const x = Math.random() * 4 - 2;
                const y = Math.random() * 4 - 2;
                container.style.transform = `translate(${x}px, ${y}px)`;
            }, 50);

            try {
                // 2. APPEL RESEAU
                const formData = new URLSearchParams();
                formData.append('user_input', input);
                formData.append('mode', currentMode);

                const response = await fetch('./oracle.php', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                    body: formData.toString()
                });

                const data = await response.json();
                
                clearInterval(shakeInterval);
                container.style.transform = 'translate(0,0)'; 

                if (data.success) {
                    
                    // 3. REVELATION
                    const cleanUrl = data.card.image_url; 
                    mainCard.classList.add('edge-on');
                    log.innerText = ":: ANALYSE TERMINÉE ::";

                    setTimeout(() => {
                        mainCard.src = cleanUrl;
                        mainCard.onload = () => {
                            playSound('sfx-reveal');
                            mainCard.classList.remove('edge-on');
                            log.innerText = ":: CIBLE : " + data.card.code + " ::";
                        };
                        mainCard.onerror = () => { mainCard.src = "images/back.webp"; mainCard.classList.remove('edge-on'); };

                    }, 600);

                    // 4. ECRITURE (Mise à jour des titres pour correspondre au PHP)
                    setTimeout(async () => {
                        outputDiv.style.display = 'block';
                        outputDiv.innerHTML = "";

                        // PARTIE 1 : PROFILAGE ET SCÉNARIOS
                        const part1 = `
                            <div class="label">💠 INTELLIGENCE : [${data.card.code}] ${data.card.nom}</div>
                            <a href="${cleanUrl}" target="_blank" class="debug-link">[Fichier Source]</a>
                            <br>
                            <span class="label">> PROFILAGE CIBLE (${currentMode.toUpperCase()}) :</span><br>
                            ${data.ai_analysis.diagnostic}
                            <br><br>
                            <span class="label">> SCÉNARIOS PROBABILISTES :</span><br>
                            ${data.ai_analysis.interpretation}
                            <br><br>
                        `;
                        await typeWriter(outputDiv, part1, 15);

                        // PARTIE 2 : ORDRE DE MISSION
                        const box = document.createElement('div');
                        box.className = 'conseil-box';
                        outputDiv.appendChild(box);

                        const part2 = `
                            <span class="label">⚡ RECOMMANDATION TACTIQUE :</span><br>
                            ${data.ai_analysis.conseil}
                        `;
                        await typeWriter(box, part2, 15);

                        // SAUVEGARDE HISTORIQUE
                        saveToHistory(input, data.card.nom, data.ai_analysis.conseil);

                        // FIN
                        btn.innerText = "NOUVEAU CYCLE";
                        btn.disabled = false;
                        btn.onclick = () => location.reload(); 

                    }, 1200);

                } else {
                    log.innerText = ":: ERREUR FATALE ::";
                    outputDiv.style.display = 'block';
                    outputDiv.innerHTML = "<span style='color:red'>ERREUR : " + data.error + "</span>";
                    btn.disabled = false;
                }

            } catch (error) {
                clearInterval(shakeInterval);
                console.error(error);
                alert("Erreur critique : " + error.message);
                btn.disabled = false;
            }
        }
    </script>
</body>
</html>