<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Payment Success - HomeCraft</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>
        html, body{
            height: 100%;
            margin: 0;
            font-family: 'Poppins', sans-serif;
            cursor: none;
        }

        .hc-bg{
            min-height: 100vh;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            padding: 40px 20px;
            background:
                linear-gradient(160deg, rgba(58,52,46,.84), rgba(58,52,46,.58)),
                url('https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1600&q=80') center/cover no-repeat fixed;
        }

        .hc-blob{ position: absolute; border-radius: 50%; filter: blur(60px); opacity: .5; pointer-events: none; }
        .hc-blob-1{ width:340px; height:340px; background:#7C9473; top:-90px; left:-100px; animation: hcDrift1 9s ease-in-out infinite; }
        .hc-blob-2{ width:300px; height:300px; background:#D9A441; bottom:-100px; right:-80px; animation: hcDrift2 11s ease-in-out infinite; }
        @keyframes hcDrift1{ 0%,100%{ transform: translate(0,0);} 50%{ transform: translate(24px,18px);} }
        @keyframes hcDrift2{ 0%,100%{ transform: translate(0,0);} 50%{ transform: translate(-20px,-14px);} }

        .hc-particle{
            position: absolute; border-radius: 50%;
            background: rgba(217,164,65,.6); pointer-events: none;
            animation: hcFloatUp linear infinite;
        }
        @keyframes hcFloatUp{
            0%{ transform: translateY(0); opacity:0; }
            12%{ opacity:.8; }
            88%{ opacity:.4; }
            100%{ transform: translateY(-500px); opacity:0; }
        }

        .hc-success-card{
            position: relative;
            z-index: 3;
            width: 100%;
            max-width: 460px;
            background: rgba(255,253,251,.96);
            border-radius: 22px;
            padding: 48px 40px;
            text-align: center;
            box-shadow: 0 30px 60px rgba(0,0,0,.35);
            animation: hcPop .55s cubic-bezier(.2,.8,.3,1) both;
        }
        @keyframes hcPop{ from{ opacity:0; transform: translateY(20px) scale(.96);} to{ opacity:1; transform: translateY(0) scale(1);} }

        .hc-check-badge{
            width: 90px; height: 90px;
            border-radius: 50%;
            background: linear-gradient(120deg, #7C9473, #62795A);
            display: flex; align-items: center; justify-content: center;
            margin: 0 auto 24px;
            font-size: 2.6rem;
            color: #FFFDFB;
            box-shadow: 0 16px 34px rgba(124,148,115,.45);
            animation: hcCheckPulse 1.8s ease-in-out infinite;
        }
        @keyframes hcCheckPulse{
            0%,100%{ box-shadow: 0 16px 34px rgba(124,148,115,.45); }
            50%{ box-shadow: 0 16px 44px rgba(124,148,115,.7); }
        }

        .hc-success-card h1{
            font-family: 'Playfair Display', serif;
            font-size: 1.9rem;
            color: #3A342E;
            margin-bottom: 10px;
        }
        .hc-success-card p{
            color: #8a7f72;
            font-size: .94rem;
            margin-bottom: 6px;
        }
        .hc-message-line{
            color: #7C9473;
            font-weight: 600;
            margin: 14px 0 28px;
        }

        .hc-continue-btn{
            display: inline-block;
            border: none;
            border-radius: 30px;
            padding: 13px 36px;
            font-weight: 600;
            color: #3A342E;
            background: linear-gradient(120deg, #D9A441, #C1652F);
            box-shadow: 0 12px 26px rgba(217,164,65,.4);
            transition: transform .2s ease, box-shadow .2s ease;
            cursor: none;
        }
        .hc-continue-btn:hover{
            transform: translateY(-3px);
            box-shadow: 0 18px 36px rgba(217,164,65,.55);
            color: #3A342E;
        }

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
        <div class="hc-blob hc-blob-1"></div>
        <div class="hc-blob hc-blob-2"></div>

        <div class="hc-success-card">
            <div class="hc-check-badge">&#10003;</div>
            <h1>Payment Successful!</h1>
            <p>Thank you for shopping with HomeCraft. Your order has been successfully placed.</p>

            <!-- Display success message (unchanged) -->
            <p class="hc-message-line">${message}</p>

            <a href="/products" class="hc-continue-btn">Continue Shopping</a>
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
            if (now - lastSpark < 40) return;
            lastSpark = now;
            var s = document.createElement('div');
            s.className = 'hc-sparkle';
            var angle = Math.random() * Math.PI * 2;
            var dist = 16 + Math.random() * 22;
            s.style.setProperty('--dx', (Math.cos(angle) * dist) + 'px');
            s.style.setProperty('--dy', (Math.sin(angle) * dist) + 'px');
            s.style.left = x + 'px';
            s.style.top = y + 'px';
            document.body.appendChild(s);
            setTimeout(function () { s.remove(); }, 700);
        }

        var bg = document.getElementById('hcBg');
        for (var i = 0; i < 18; i++) {
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