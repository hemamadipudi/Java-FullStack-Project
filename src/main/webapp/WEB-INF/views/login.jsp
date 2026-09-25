<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login — HomeCraft Modern Luxury</title>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,600;0,700;0,800;1,600&family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <style>
        /* =========================================================
           GLOBAL LUXURY RESET & THEME
           ========================================================= */
        * { box-sizing: border-box; margin: 0; padding: 0; }
        :root {
            --bg-dark: #0a0908;
            --gold-base: #d8a753;
            --gold-light: #f5d796;
            --gold-glow: rgba(216, 167, 83, 0.45);
            --terracotta: #c46843;
            --text-muted: #c8c0b6;
            --smooth-cubic: cubic-bezier(0.16, 1, 0.3, 1);
        }

        html, body {
            height: 100%;
            font-family: 'Plus Jakarta Sans', sans-serif;
            background: var(--bg-dark);
            color: #ffffff;
            overflow-x: hidden;
            cursor: none;
        }

        /* =========================================================
           CUSTOM GLOW CURSOR & SPARKLE TRAIL
           ========================================================= */
		   .hc-cursor-dot {
		       position: fixed;
		       top: 0;
		       left: 0;

		       width: 10px;
		       height: 10px;

		       margin: -5px 0 0 -5px;

		       border-radius: 50%;

		       background: #D9A441;

		       box-shadow:
		           0 0 8px rgba(217,164,65,.95),
		           0 0 18px rgba(217,164,65,.65),
		           0 0 32px rgba(217,164,65,.35);

		       pointer-events: none;

		       z-index: 999999;

		       transition: transform .15s ease;
		   }


		   /* Outer premium ring */

		   .hc-cursor-dot::before {
		       content: "";

		       position: absolute;

		       width: 32px;
		       height: 32px;

		       left: 50%;
		       top: 50%;

		       transform: translate(-50%, -50%);

		       border-radius: 50%;

		       border: 1px solid rgba(217,164,65,.65);

		       box-shadow:
		           0 0 15px rgba(217,164,65,.22);

		       pointer-events: none;
		   }


		   /* Small white center */

		   .hc-cursor-dot::after {
		       content: "";

		       position: absolute;

		       width: 3px;
		       height: 3px;

		       left: 50%;
		       top: 50%;

		       transform: translate(-50%, -50%);

		       border-radius: 50%;

		       background: #fff;

		       box-shadow:
		           0 0 7px #fff,
		           0 0 12px #D9A441;
		   }

        .hc-sparkle {
            position: fixed;
            width: 6px; height: 6px;
            border-radius: 50%;
            pointer-events: none;
            z-index: 99998;
            background: radial-gradient(circle, #ffffff 0%, var(--gold-light) 60%, transparent 100%);
            animation: hcSparkle 0.7s ease-out forwards;
        }

        @keyframes hcSparkle {
            0% { opacity: 1; transform: translate(0,0) scale(1); }
            100% { opacity: 0; transform: translate(var(--dx), var(--dy)) scale(0.1); }
        }

        /* =========================================================
           SPLIT SCREEN CONTAINER LAYOUT
           ========================================================= */
        .hc-split-wrapper {
            display: flex;
            min-height: 100vh;
            width: 100vw;
            position: relative;
            overflow: hidden;
        }

        /* ---------------------------------------------------------
           LEFT SIDE: DYNAMIC VISUAL SHOWCASE
           --------------------------------------------------------- */
        .hc-left-showcase {
            flex: 1.1;
            position: relative;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 50px 60px;
            background: 
                linear-gradient(135deg, rgba(10, 9, 8, 0.4) 0%, rgba(10, 9, 8, 0.85) 100%),
                url('https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?auto=format&fit=crop&w=1600&q=85') center/cover no-repeat;
            overflow: hidden;
            border-right: 1px solid rgba(255, 255, 255, 0.12);
        }

        /* Ambient Glow Blobs */
        .hc-glow-blob {
            position: absolute;
            border-radius: 50%;
            filter: blur(90px);
            pointer-events: none;
            opacity: 0.5;
            animation: floatGlow 12s ease-in-out infinite alternate;
        }
        .hc-glow-1 { width: 450px; height: 450px; top: -100px; left: -100px; background: var(--terracotta); }
        .hc-glow-2 { width: 400px; height: 400px; bottom: -100px; right: -50px; background: var(--gold-base); animation-delay: -6s; }

        @keyframes floatGlow {
            0% { transform: translate(0, 0) scale(1) rotate(0deg); }
            100% { transform: translate(50px, 40px) scale(1.15) rotate(180deg); }
        }

        /* Brand Logo Header */
        .hc-brand {
            display: flex;
            align-items: center;
            gap: 12px;
            color: #ffffff;
            z-index: 3;
        }
        .hc-brand span.hc-icon { font-size: 1.8rem; }
        .hc-brand span.hc-name { font-family: 'Playfair Display', serif; font-size: 1.8rem; font-weight: 700; letter-spacing: 1px; color: var(--gold-light); }

        /* Left Dynamic Middle Content */
        .hc-showcase-content {
            position: relative;
            z-index: 3;
            max-width: 520px;
            margin-top: 40px;
        }

        .hc-showcase-tag {
            display: inline-block;
            padding: 8px 20px;
            border-radius: 50px;
            border: 1px solid rgba(216, 167, 83, 0.5);
            background: rgba(10, 9, 8, 0.6);
            backdrop-filter: blur(10px);
            color: var(--gold-light);
            font-size: 0.78rem;
            font-weight: 700;
            letter-spacing: 2px;
            text-transform: uppercase;
            margin-bottom: 22px;
        }

        .hc-showcase-content h1 {
            font-family: 'Playfair Display', serif;
            font-size: clamp(2.5rem, 4vw, 3.8rem);
            font-weight: 800;
            line-height: 1.1;
            margin-bottom: 20px;
            text-shadow: 0 10px 30px rgba(0,0,0,0.8);
        }

        .hc-accent-text {
            background: linear-gradient(120deg, #ffffff, var(--gold-light), var(--gold-base));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }

        .hc-showcase-content p {
            font-size: 1.1rem;
            color: #e0d8ce;
            line-height: 1.6;
            font-weight: 400;
        }

        /* Left Floating Product Cards */
        .hc-float-card {
            position: absolute;
            width: 180px;
            padding: 10px;
            background: rgba(10, 9, 8, 0.45);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 18px;
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.6);
            z-index: 4;
            pointer-events: none;
            animation: hcFloatAnim 6s ease-in-out infinite alternate;
        }

        .hc-float-card img {
            width: 100%;
            height: 120px;
            object-fit: cover;
            border-radius: 12px;
            margin-bottom: 8px;
        }

        .hc-float-card span {
            display: block;
            text-align: center;
            font-size: 0.78rem;
            font-weight: 700;
            color: var(--gold-light);
        }

        .fp-left-top { top: 12%; right: 8%; animation-delay: 0s; }
        .fp-left-bottom { bottom: 12%; right: 12%; animation-delay: -2.5s; }

        @keyframes hcFloatAnim {
            0% { transform: translateY(0px) rotate(0deg); }
            100% { transform: translateY(-22px) rotate(4deg); }
        }

        /* Showcase Bottom Stats */
        .hc-showcase-stats {
            display: flex;
            gap: 40px;
            z-index: 3;
            margin-top: 30px;
        }
        .hc-stat-item h3 { font-family: 'Playfair Display', serif; font-size: 2rem; color: var(--gold-light); margin: 0; }
        .hc-stat-item p { font-size: 0.8rem; color: var(--text-muted); text-transform: uppercase; letter-spacing: 1px; margin: 0; }

        /* ---------------------------------------------------------
           RIGHT SIDE: LUXURY LOGIN FORM
           --------------------------------------------------------- */
        .hc-right-form {
            flex: 0.9;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 24px;
            background: radial-gradient(circle at center, rgba(30, 26, 22, 1) 0%, rgba(10, 9, 8, 1) 100%);
        }

        /* Tilt Wrapper & Animated Glass Card */
        .hc-tilt-wrap {
            perspective: 1200px;
            width: 100%;
            max-width: 440px;
            z-index: 3;
        }

        .hc-glass-card {
            position: relative;
            width: 100%;
            padding: 3px;
            border-radius: 26px;
            background: linear-gradient(135deg, var(--gold-base), var(--terracotta), rgba(255,255,255,0.2), var(--gold-light));
            background-size: 300% 300%;
            animation: hcBorderShift 7s ease infinite, hcPop 0.6s var(--smooth-cubic) both;
            box-shadow: 0 30px 70px rgba(0,0,0,0.8);
            transform-style: preserve-3d;
            transition: transform 0.12s ease-out;
        }

        @keyframes hcBorderShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        @keyframes hcPop {
            from { opacity: 0; transform: translateY(30px) scale(0.95); }
            to { opacity: 1; transform: translateY(0) scale(1); }
        }

        .hc-glass-inner {
            background: rgba(18, 15, 13, 0.85);
            border-radius: 23px;
            padding: 48px 40px 40px;
            backdrop-filter: blur(24px);
            -webkit-backdrop-filter: blur(24px);
            color: #ffffff;
        }

        .hc-glass-card h2 {
            font-family: 'Playfair Display', serif;
            font-size: 2.2rem;
            font-weight: 700;
            margin-bottom: 6px;
            text-align: center;
            color: #ffffff;
        }

        .hc-glass-card .hc-sub {
            text-align: center;
            font-size: 0.92rem;
            color: var(--text-muted);
            margin-bottom: 32px;
        }

        /* Form Inputs */
        .hc-field { margin-bottom: 24px; }
        .hc-field label {
            display: block;
            font-size: 0.75rem;
            font-weight: 700;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            color: var(--gold-light);
            margin-bottom: 8px;
        }

        .hc-field input {
            width: 100%;
            padding: 14px 16px;
            border-radius: 12px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            background: rgba(255, 255, 255, 0.06);
            color: #ffffff;
            font-size: 0.98rem;
            transition: border-color 0.3s ease, background 0.3s ease, box-shadow 0.3s ease;
            cursor: none;
        }

        .hc-field input::placeholder { color: rgba(255, 255, 255, 0.4); }

        .hc-field input:focus {
            outline: none;
            border-color: var(--gold-base);
            background: rgba(255, 255, 255, 0.12);
            box-shadow: 0 0 0 4px var(--gold-glow);
        }

        /* Glow Action Button */
        .hc-btn-glow {
            width: 100%;
            border: none;
            border-radius: 50px;
            padding: 16px;
            margin-top: 8px;
            font-size: 1.02rem;
            font-weight: 700;
            letter-spacing: 1px;
            color: #0a0908;
            background: linear-gradient(120deg, var(--gold-light), var(--gold-base));
            background-size: 180% auto;
            box-shadow: 0 12px 30px var(--gold-glow);
            transition: transform 0.3s var(--smooth-cubic), box-shadow 0.3s var(--smooth-cubic), background-position 0.4s ease;
            cursor: none;
        }

        .hc-btn-glow:hover {
            transform: translateY(-4px) scale(1.02);
            box-shadow: 0 20px 45px var(--gold-glow), 0 0 25px rgba(245, 215, 150, 0.6);
            background-position: right center;
        }

        .hc-btn-glow:active { transform: translateY(-1px); }

        /* Links & Error Alerts */
        .hc-glass-card .hc-link-row { text-align: center; margin-top: 26px; font-size: 0.9rem; color: var(--text-muted); }
        .hc-glass-card .hc-link-row a {
            color: #ffffff;
            font-weight: 700;
            text-decoration: underline;
            text-underline-offset: 4px;
            transition: color 0.25s ease;
            cursor: none;
        }
        .hc-glass-card .hc-link-row a:hover { color: var(--gold-light); }

        .hc-glass-card .alert-danger {
            background: rgba(196, 104, 67, 0.25);
            border: 1px solid rgba(196, 104, 67, 0.6);
            color: #ffded4;
            border-radius: 12px;
            font-size: 0.9rem;
        }

        /* Responsive Breakpoints */
        @media (max-width: 992px) {
            .hc-split-wrapper { flex-direction: column; }
            .hc-left-showcase { display: none; }
            .hc-right-form { min-height: 100vh; padding: 60px 20px; }
        }
    </style>
</head>
<body>

    <!-- CUSTOM INTERACTIVE CURSOR -->
    <div class="hc-cursor-dot" id="hcCursorDot"></div>

    <!-- MAIN SPLIT SCREEN WRAPPER -->
    <div class="hc-split-wrapper" id="hcBg">
        
        <!-- LEFT SIDE: DYNAMIC VISUAL SHOWCASE -->
        <div class="hc-left-showcase">
            <div class="hc-glow-blob hc-glow-1" id="blob1"></div>
            <div class="hc-glow-blob hc-glow-2" id="blob2"></div>

            <!-- Brand Logo -->
            <div class="hc-brand">
                <span class="hc-icon">&#127968;</span>
                <span class="hc-name">HomeCraft</span>
            </div>

            <!-- Floating Decor Items -->
            <div class="hc-float-card fp-left-top">
                <img src="https://images.unsplash.com/photo-1567538096630-e0c55bd6374c?auto=format&fit=crop&w=400&q=80" alt="Lounge Chair">
                <span>Nordic Chair</span>
            </div>
            <div class="hc-float-card fp-left-bottom">
                <img src="https://images.unsplash.com/photo-1507473885765-e6ed057f782c?auto=format&fit=crop&w=400&q=80" alt="Pendant Lamp">
                <span>Brass Pendant</span>
            </div>

            <!-- Showcase Content -->
            <div class="hc-showcase-content">
                <span class="hc-showcase-tag">✦ Bespoke Architecture</span>
                <h1>Crafting <span class="hc-accent-text">Eleganza</span> For Modern Spaces.</h1>
                <p>Welcome back to HomeCraft. Access your tailored interior dashboard, manage orders, and explore handpicked artisanal collections.</p>
            </div>

            <!-- Showcase Stats -->
            <div class="hc-showcase-stats">
                <div class="hc-stat-item">
                    <h3>12k+</h3>
                    <p>Spaces Styled</p>
                </div>
                <div class="hc-stat-item">
                    <h3>100%</h3>
                    <p>Artisanal Wood</p>
                </div>
            </div>
        </div>

        <!-- RIGHT SIDE: LUXURY LOGIN FORM -->
        <div class="hc-right-form">
            <div class="hc-tilt-wrap">
                <div class="hc-glass-card" id="hcCard">
                    <div class="hc-glass-inner">
                        <h2>Welcome back</h2>
                        <p class="hc-sub">Home &amp; Lifestyle, delivered with care.</p>

                        <!-- Display error message if login fails (UNCHANGED BACKEND) -->
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger text-center">
                                ${error}
                            </div>
                        </c:if>

                        <!-- Login Form (UNCHANGED ACTION/FIELDS) -->
                        <form action="/login" method="post">
                            <div class="hc-field">
                                <label for="username">Username</label>
                                <input type="text" id="username" name="username" placeholder="Enter your username" required>
                            </div>
                            <div class="hc-field">
                                <label for="password">Password</label>
                                <input type="password" id="password" name="password" placeholder="Enter your password" required>
                            </div>
                            <button type="submit" class="hc-btn-glow">Login to Portal</button>
                        </form>

                        <div class="hc-link-row">
                            New to HomeCraft? <a href="/users/create">Create an account</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- JAVASCRIPT: INTERACTIVE TILT & SPARKLE CURSOR -->
    <script>
        var dot = document.getElementById('hcCursorDot');
        var mouseX = 0, mouseY = 0;
        var dotX = 0, dotY = 0;

        document.addEventListener('mousemove', function (e) {
            mouseX = e.clientX;
            mouseY = e.clientY;
            spawnSparkle(e.clientX, e.clientY);
        });

        function animCursor() {
            dotX += (mouseX - dotX) * 0.22;
            dotY += (mouseY - dotY) * 0.22;
            dot.style.transform = 'translate3d(' + dotX + 'px, ' + dotY + 'px, 0)';
            requestAnimationFrame(animCursor);
        }
        animCursor();

        var lastSpark = 0;
        function spawnSparkle(x, y) {
            var now = Date.now();
            if (now - lastSpark < 35) return;
            lastSpark = now;
            var s = document.createElement('div');
            s.className = 'hc-sparkle';
            var angle = Math.random() * Math.PI * 2;
            var dist = 18 + Math.random() * 26;
            s.style.setProperty('--dx', (Math.cos(angle) * dist) + 'px');
            s.style.setProperty('--dy', (Math.sin(angle) * dist) + 'px');
            s.style.left = x + 'px';
            s.style.top = y + 'px';
            document.body.appendChild(s);
            setTimeout(function () { s.remove(); }, 700);
        }

        // 3D Tilt Card Interaction
        var card = document.getElementById('hcCard');
        var wrap = document.querySelector('.hc-tilt-wrap');
        wrap.addEventListener('mousemove', function (e) {
            var rect = card.getBoundingClientRect();
            var relX = (e.clientX - rect.left) / rect.width;
            var relY = (e.clientY - rect.top) / rect.height;
            var rotateY = (relX - 0.5) * 16;
            var rotateX = (0.5 - relY) * 16;
            card.style.transform = 'rotateX(' + rotateX + 'deg) rotateY(' + rotateY + 'deg)';
        });
        wrap.addEventListener('mouseleave', function () {
            card.style.transform = 'rotateX(0deg) rotateY(0deg)';
        });

        // Background Blobs Parallax
        var blob1 = document.getElementById('blob1');
        var blob2 = document.getElementById('blob2');
        document.addEventListener('mousemove', function (e) {
            var cx = window.innerWidth / 2;
            var cy = window.innerHeight / 2;
            var dx = (e.clientX - cx) / cx;
            var dy = (e.clientY - cy) / cy;
            if (blob1) blob1.style.transform = 'translate(' + (dx * 20) + 'px,' + (dy * 20) + 'px)';
            if (blob2) blob2.style.transform = 'translate(' + (dx * -18) + 'px,' + (dy * -18) + 'px)';
        });
    </script>
</body>
</html>