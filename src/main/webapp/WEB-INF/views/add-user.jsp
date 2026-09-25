<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Account - HomeCraft</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>
        *{ box-sizing: border-box; }
        html, body{
            height: 100%;
            margin: 0;
            font-family: 'Poppins', sans-serif;
            cursor: none;
            overflow-x: hidden;
        }

        .hc-bg{
            min-height: 100vh;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            padding: 60px 20px;
            background:
                linear-gradient(160deg, rgba(58,52,46,.84), rgba(58,52,46,.58)),
                url('https://images.unsplash.com/photo-1493663284031-b7e3aefcae8e?auto=format&fit=crop&w=1600&q=80') center/cover no-repeat fixed;
        }

        .hc-blob{ position: absolute; border-radius: 50%; filter: blur(60px); opacity: .55; pointer-events: none; transition: transform .25s ease-out; }
        .hc-blob-1{ width:380px; height:380px; background:#C1652F; top:-80px; left:-100px; }
        .hc-blob-2{ width:320px; height:320px; background:#7C9473; bottom:-100px; right:-80px; }
        .hc-blob-3{ width:220px; height:220px; background:#D9A441; top:40%; right:8%; }

        .hc-particle{
            position: absolute; border-radius: 50%;
            background: rgba(217,164,65,.6); pointer-events: none;
            animation: hcFloatUp linear infinite;
        }
        @keyframes hcFloatUp{
            0%{ transform: translateY(0); opacity:0; }
            12%{ opacity:.8; }
            88%{ opacity:.4; }
            100%{ transform: translateY(-560px); opacity:0; }
        }

        .hc-brand{
            position: absolute; top: 32px; left: 50%;
            transform: translateX(-50%);
            display: flex; align-items: center; gap: 10px;
            color: #FFFDFB; z-index: 4;
        }
        .hc-brand span.hc-icon{ font-size: 1.6rem; }
        .hc-brand span.hc-name{ font-family: 'Playfair Display', serif; font-size: 1.5rem; letter-spacing: .5px; }

        .hc-tilt-wrap{ perspective: 1200px; z-index: 3; margin-top: 60px; }

        .hc-glass-card{
            position: relative;
            width: 100%;
            max-width: 460px;
            padding: 3px;
            border-radius: 22px;
            background: linear-gradient(130deg, #D9A441, #C1652F, #7C9473, #D9A441);
            background-size: 300% 300%;
            animation: hcBorderShift 6s ease infinite, hcPop .55s cubic-bezier(.2,.8,.3,1) both;
            box-shadow: 0 25px 60px rgba(0,0,0,.4);
            transform-style: preserve-3d;
            transition: transform .12s ease-out;
        }
        @keyframes hcBorderShift{
            0%{ background-position: 0% 50%; }
            50%{ background-position: 100% 50%; }
            100%{ background-position: 0% 50%; }
        }
        @keyframes hcPop{ from{ opacity: 0; transform: translateY(22px) scale(.97); } to{ opacity: 1; transform: translateY(0) scale(1); } }

        .hc-glass-inner{
            background: rgba(40,36,31,.62);
            border-radius: 20px;
            padding: 42px 38px 34px;
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            color: #FFFDFB;
        }

        .hc-glass-card h2{
            font-family: 'Playfair Display', serif;
            font-size: 1.9rem; margin-bottom: 4px; text-align: center;
        }
        .hc-glass-card .hc-sub{ text-align: center; font-size: .9rem; color: #EFE7DC; margin-bottom: 28px; }

        .hc-field{ margin-bottom: 18px; }
        .hc-field label{
            display: block; font-size: .74rem; font-weight: 600;
            letter-spacing: 1px; text-transform: uppercase;
            color: #D9A441; margin-bottom: 7px;
        }
        .hc-field input, .hc-field select{
            width: 100%; padding: 11px 14px; border-radius: 10px;
            border: 1px solid rgba(255,253,251,.4);
            background: rgba(255,253,251,.08);
            color: #FFFDFB; font-size: .94rem;
            transition: border-color .25s ease, background .25s ease, box-shadow .25s ease;
            cursor: none;
        }
        .hc-field input::placeholder{ color: rgba(255,253,251,.55); }
        .hc-field input:focus, .hc-field select:focus{
            outline: none;
            border-color: #D9A441;
            background: rgba(255,253,251,.16);
            box-shadow: 0 0 0 3px rgba(217,164,65,.22);
        }
        .hc-field select option{ color: #3A342E; }

        .hc-row-2{ display: grid; grid-template-columns: 1fr; gap: 0; }
        @media (min-width: 480px){
            .hc-row-2{ grid-template-columns: 1fr 1fr; gap: 14px; }
        }

        .hc-btn-glow{
            width: 100%; border: none; border-radius: 12px; padding: 13px;
            margin-top: 8px; font-size: 1rem; font-weight: 600; letter-spacing: .4px;
            color: #3A342E;
            background: linear-gradient(120deg, #D9A441, #C1652F);
            background-size: 160% auto;
            box-shadow: 0 10px 26px rgba(217,164,65,.4);
            transition: transform .2s ease, box-shadow .2s ease, background-position .3s ease;
            cursor: none;
        }
        .hc-btn-glow:hover{
            transform: translateY(-3px);
            box-shadow: 0 18px 38px rgba(217,164,65,.55);
            background-position: right center;
        }
        .hc-btn-glow:active{ transform: translateY(-1px); }

        .hc-glass-card .hc-link-row{ text-align: center; margin-top: 20px; font-size: .88rem; }
        .hc-glass-card .hc-link-row a{
            color: #FFFDFB; font-weight: 600; text-decoration: underline;
            text-underline-offset: 3px; transition: color .2s ease; cursor: none;
        }
        .hc-glass-card .hc-link-row a:hover{ color: #D9A441; }

        .hc-cursor-dot{
            position: fixed; top: 0; left: 0; width: 10px; height: 10px; margin: -5px 0 0 -5px;
            border-radius: 50%; background: #D9A441;
            box-shadow: 0 0 14px 5px rgba(217,164,65,.65);
            pointer-events: none; z-index: 9999; transition: transform .08s ease;
        }
        .hc-sparkle{
            position: fixed; top: 0; left: 0; width: 6px; height: 6px;
            pointer-events: none; z-index: 9998; border-radius: 50%;
            background: radial-gradient(circle, #FFFDFB 0%, #D9A441 60%, transparent 75%);
            animation: hcSparkleFade .7s ease-out forwards;
        }
        @keyframes hcSparkleFade{
            0%{ opacity: 1; transform: translate(0,0) scale(1); }
            100%{ opacity: 0; transform: translate(var(--dx), var(--dy)) scale(.2); }
        }
    </style>
</head>
<body>

    <div class="hc-bg" id="hcBg">
        <div class="hc-blob hc-blob-1" id="blob1"></div>
        <div class="hc-blob hc-blob-2" id="blob2"></div>
        <div class="hc-blob hc-blob-3" id="blob3"></div>

        <div class="hc-brand">
            <span class="hc-icon">&#127968;</span>
            <span class="hc-name">HomeCraft</span>
        </div>

        <div class="hc-tilt-wrap">
            <div class="hc-glass-card" id="hcCard">
                <div class="hc-glass-inner">
                    <h2>Create your account</h2>
                    <p class="hc-sub">Join HomeCraft for home &amp; lifestyle shopping.</p>

                    <!-- Add User Form (unchanged action/fields) -->
                    <form action="/register" method="post">
                        <div class="hc-field">
                            <label for="username">Username</label>
                            <input type="text" id="username" name="username" placeholder="Choose a username" required>
                        </div>
                        <div class="hc-field">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" placeholder="Create a password" required>
                        </div>
                        <div class="hc-field">
                            <label for="role">Role</label>
                            <select id="role" name="role" required>
                                <option value="USER">User</option>
                                <option value="ADMIN">Admin</option>
                            </select>
                        </div>

                        <button type="submit" class="hc-btn-glow">Create Account</button>
                    </form>

                    <div class="hc-link-row">
                        Already have an account? <a href="/login">Back to Login</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="hc-cursor-dot" id="hcCursorDot"></div>

    <script>
        var dot = document.getElementById('hcCursorDot');
        document.addEventListener('mousemove', function (e) {
            dot.style.left = e.clientX + 'px';
            dot.style.top = e.clientY + 'px';
            spawnSparkle(e.clientX, e.clientY);
        });

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

        var card = document.getElementById('hcCard');
        var wrap = document.querySelector('.hc-tilt-wrap');
        wrap.addEventListener('mousemove', function (e) {
            var rect = card.getBoundingClientRect();
            var relX = (e.clientX - rect.left) / rect.width;
            var relY = (e.clientY - rect.top) / rect.height;
            var rotateY = (relX - 0.5) * 12;
            var rotateX = (0.5 - relY) * 12;
            card.style.transform = 'rotateX(' + rotateX + 'deg) rotateY(' + rotateY + 'deg)';
        });
        wrap.addEventListener('mouseleave', function () {
            card.style.transform = 'rotateX(0deg) rotateY(0deg)';
        });

        var blob1 = document.getElementById('blob1');
        var blob2 = document.getElementById('blob2');
        var blob3 = document.getElementById('blob3');
        document.addEventListener('mousemove', function (e) {
            var cx = window.innerWidth / 2;
            var cy = window.innerHeight / 2;
            var dx = (e.clientX - cx) / cx;
            var dy = (e.clientY - cy) / cy;
            blob1.style.transform = 'translate(' + (dx * 18) + 'px,' + (dy * 18) + 'px)';
            blob2.style.transform = 'translate(' + (dx * -16) + 'px,' + (dy * -16) + 'px)';
            blob3.style.transform = 'translate(' + (dx * 22) + 'px,' + (dy * 22) + 'px)';
        });

        var bg = document.getElementById('hcBg');
        for (var i = 0; i < 20; i++) {
            var p = document.createElement('div');
            p.className = 'hc-particle';
            var size = 2 + Math.random() * 3;
            p.style.width = size + 'px';
            p.style.height = size + 'px';
            p.style.left = Math.random() * 100 + '%';
            p.style.bottom = (Math.random() * 30) + 'px';
            p.style.animationDuration = (6 + Math.random() * 8) + 's';
            p.style.animationDelay = (Math.random() * 8) + 's';
            bg.appendChild(p);
        }
    </script>
</body>
</html>