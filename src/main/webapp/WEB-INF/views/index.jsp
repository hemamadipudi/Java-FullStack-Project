<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>HomeCraft — Modern Luxury Interior Studio</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,600;0,700;0,800;1,600&family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap"
          rel="stylesheet">

    <style>

        /* =========================================================
           GLOBAL
        ========================================================= */

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        :root {
            --bg-dark: #0a0908;
            --bg-card: rgba(255, 255, 255, 0.05);
            --gold-base: #d8a753;
            --gold-light: #f5d796;
            --gold-glow: rgba(216, 167, 83, 0.5);
            --terracotta: #c46843;
            --text-muted: #c8c0b6;
            --smooth-cubic: cubic-bezier(0.16, 1, 0.3, 1);
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            margin: 0;
            font-family: 'Plus Jakarta Sans', sans-serif;
            background: var(--bg-dark);
            color: #fff;
            overflow-x: hidden;
            cursor: none;
        }

        a {
            text-decoration: none;
        }


        /* =========================================================
           CUSTOM CURSOR
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


        /* =========================================================
           SPARKLES
        ========================================================= */

        .hc-sparkle {
            position: fixed;
            top: 0;
            left: 0;
            width: 6px;
            height: 6px;
            pointer-events: none;
            z-index: 999998;
            border-radius: 50%;

            background: radial-gradient(
                circle,
                #FFFDFB 0%,
                #D9A441 60%,
                transparent 75%
            );

            animation: hcSparkleFade .7s ease-out forwards;
        }

        @keyframes hcSparkleFade {

            0% {
                opacity: 1;
                transform: translate(0, 0) scale(1);
            }

            100% {
                opacity: 0;
                transform:
                    translate(var(--dx), var(--dy))
                    scale(.2);
            }
        }


        /* =========================================================
           SCROLL REVEAL
        ========================================================= */

        .reveal-up {
            opacity: 0;

            transform: translateY(45px);

            transition:
                opacity .9s var(--smooth-cubic),
                transform .9s var(--smooth-cubic);
        }

        .reveal-up.active {
            opacity: 1;
            transform: translateY(0);
        }

        .delay-1 {
            transition-delay: .15s;
        }

        .delay-2 {
            transition-delay: .30s;
        }

        .delay-3 {
            transition-delay: .45s;
        }

        .delay-4 {
            transition-delay: .60s;
        }


        /* =========================================================
           HERO
        ========================================================= */

        .hc-hero {
            position: relative;

            min-height: 100vh;

            padding: 90px 0 45px;

            display: flex;
            flex-direction: column;
            justify-content: flex-start;

            overflow: hidden;
            isolation: isolate;

            background:
                linear-gradient(
                    180deg,
                    rgba(5,5,4,.30) 0%,
                    rgba(5,5,4,.42) 45%,
                    rgba(5,5,4,.35) 75%,
                    rgba(5,5,4,.28) 100%
                ),

                url("https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?auto=format&fit=crop&w=2200&q=90")
                center center / cover no-repeat;
        }

        .hc-hero::before {
            content: "";

            position: absolute;
            inset: 0;

            background:
                radial-gradient(
                    circle at 50% 30%,
                    rgba(210,168,92,.08),
                    transparent 38%
                );

            pointer-events: none;
            z-index: 1;
        }


        /* =========================================================
           AMBIENT GLOW
        ========================================================= */

        .hc-glow-blob {
            position: absolute;

            border-radius: 50%;

            filter: blur(100px);

            pointer-events: none;

            opacity: .22;

            animation:
                floatGlow 10s ease-in-out infinite alternate;

            z-index: 1;
        }

        .hc-glow-1 {
            width: 550px;
            height: 550px;

            top: -150px;
            left: -150px;

            background: var(--terracotta);
        }

        .hc-glow-2 {
            width: 500px;
            height: 500px;

            bottom: -150px;
            right: -150px;

            background: var(--gold-base);

            animation-delay: -5s;
        }

        @keyframes floatGlow {

            0% {
                transform:
                    translate(0,0)
                    scale(1)
                    rotate(0deg);
            }

            100% {
                transform:
                    translate(70px,50px)
                    scale(1.2)
                    rotate(180deg);
            }
        }


        /* =========================================================
           HERO CONTENT
        ========================================================= */

        .hc-hero-content {
            position: relative;

            z-index: 5;

            width: min(900px, 92%);

            margin: 0 auto;

            text-align: center;

            padding-top: 0;

            /* MOVED HERO CONTENT TOWARD MIDDLE */
            transform: translateY(120px);

            margin-bottom: auto;
        }

        .hc-hero-badge {
            display: inline-flex;

            align-items: center;
            justify-content: center;

            gap: 10px;

            padding: 11px 25px;

            border:
                1px solid rgba(216,167,83,.65);

            border-radius: 50px;

            background:
                rgba(10,9,8,.45);

            color:
                var(--gold-light);

            font-size: .78rem;

            font-weight: 700;

            letter-spacing: 3px;

            text-transform: uppercase;

            margin-bottom: 24px;

            box-shadow:
                0 10px 30px rgba(0,0,0,.35);
        }

        .hc-hero h1 {
            max-width: 900px;

            margin: 0 auto 30px;

            font-family:
                'Playfair Display', serif;

            /* MEDIUM-LARGE HEADING */
            font-size:
                clamp(3rem, 5.2vw, 4.2rem);

            font-weight: 800;

            line-height: 1.08;

            letter-spacing: -1.8px;

            text-shadow:
                0 10px 40px rgba(0,0,0,.85);
        }

        .hc-accent {
            background:
                linear-gradient(
                    120deg,
                    #ffffff,
                    #f5d796,
                    #d8a753,
                    #ffffff
                );

            background-size: 300% auto;

            -webkit-background-clip: text;
            background-clip: text;

            color: transparent;

            animation:
                hcShine 5s linear infinite;
        }

        @keyframes hcShine {

            to {
                background-position: 300% center;
            }
        }


        /* =========================================================
           BUTTONS
        ========================================================= */

        .hc-cta-row {
            display: flex;

            gap: 16px;

            justify-content: center;

            flex-wrap: wrap;
        }

        .hc-btn-primary,
        .hc-btn-ghost {
            position: relative;

            display: inline-flex;

            align-items: center;
            justify-content: center;

            padding: 16px 34px;

            border-radius: 50px;

            font-size: .92rem;

            font-weight: 700;

            letter-spacing: .8px;

            transition:
                transform .4s var(--smooth-cubic),
                box-shadow .4s ease,
                background .4s ease,
                border-color .4s ease;
        }

        .hc-btn-primary {
            color: #0a0908;

            background:
                linear-gradient(
                    120deg,
                    var(--gold-light),
                    var(--gold-base)
                );

            box-shadow:
                0 15px 35px var(--gold-glow);
        }

        .hc-btn-primary:hover {
            transform:
                translateY(-6px)
                scale(1.03);

            box-shadow:
                0 25px 55px var(--gold-glow);
        }

        .hc-btn-ghost {
            color: #fff;

            border:
                1px solid rgba(255,255,255,.45);

            background:
                rgba(0,0,0,.35);
        }

        .hc-btn-ghost:hover {
            transform:
                translateY(-6px)
                scale(1.03);

            background:
                rgba(255,255,255,.12);

            border-color: #fff;

            box-shadow:
                0 20px 40px rgba(0,0,0,.45);
        }


        /* =========================================================
           FULL WIDTH AUTO SCROLL GALLERY
        ========================================================= */

        .hc-gallery-strip {
            position: relative;

            z-index: 3;

            width: 100vw;

            max-width: none;

            margin-top: 30px;

            margin-left:
                calc(50% - 50vw);

            padding:
                12px 0 18px;

            background:
                transparent;

            overflow: hidden;

            border-top:
                1px solid rgba(255,255,255,.10);

            border-bottom:
                1px solid rgba(255,255,255,.10);
        }

        .hc-track {
            display: flex;

            gap: 26px;

            width: max-content;

            animation:
                scrollGallery 25s linear infinite;
        }

        .hc-track:hover {
            animation-play-state: paused;
        }

        .hc-gallery-item {
            position: relative;

            width: 360px;
            height: 190px;

            flex-shrink: 0;

            overflow: hidden;

            border-radius: 20px;

            border:
                1px solid rgba(255,255,255,.16);

            background:
                rgba(20,20,18,.45);

            box-shadow:
                0 15px 35px rgba(0,0,0,.50);

            transition:
                transform .5s var(--smooth-cubic);
        }

        .hc-gallery-item img {
            width: 100%;
            height: 100%;

            display: block;

            object-fit: cover;

            transition:
                transform .7s var(--smooth-cubic);
        }

        /* ONLY HOVERED IMAGE MOVES */
        .hc-gallery-item:hover {
            transform:
                translateY(-7px)
                scale(1.025);
        }

        .hc-gallery-item:hover img {
            transform: scale(1.06);
        }

        @keyframes scrollGallery {

            0% {
                transform: translateX(0);
            }

            100% {
                transform: translateX(-50%);
            }
        }


        /* =========================================================
           FEATURES
        ========================================================= */

        .hc-features {
            position: relative;

            padding: 130px 24px;

            background:
                var(--bg-dark);

            text-align: center;
        }

        .hc-eyebrow {
            color:
                var(--terracotta);

            font-size: .85rem;

            font-weight: 800;

            letter-spacing: 4px;

            text-transform: uppercase;
        }

        .hc-features h2 {
            font-family:
                'Playfair Display', serif;

            font-size:
                clamp(2.7rem, 5vw, 4.4rem);

            font-weight: 800;

            margin:
                18px 0 65px;
        }

        .hc-feature-grid {
            display: grid;

            grid-template-columns:
                repeat(auto-fit, minmax(280px,1fr));

            gap: 30px;

            max-width: 1280px;

            margin: 0 auto;
        }

        .hc-feature-card {
            position: relative;

            padding: 45px 32px;

            background:
                var(--bg-card);

            border:
                1px solid rgba(255,255,255,.10);

            border-radius: 26px;

            backdrop-filter:
                blur(14px);

            text-align: left;

            overflow: hidden;

            transition:
                transform .5s var(--smooth-cubic),
                border-color .5s ease,
                box-shadow .5s ease;
        }

        .hc-feature-card::before {
            content: "";

            position: absolute;
            inset: 0;

            background:
                radial-gradient(
                    circle at top right,
                    var(--gold-glow),
                    transparent 70%
                );

            opacity: 0;

            transition:
                opacity .5s ease;
        }

        .hc-feature-card:hover {
            transform:
                translateY(-14px)
                scale(1.02);

            border-color:
                rgba(216,167,83,.65);

            box-shadow:
                0 35px 75px rgba(0,0,0,.75),
                0 0 35px rgba(216,167,83,.25);
        }

        .hc-feature-card:hover::before {
            opacity: 1;
        }

        .hc-ficon {
            position: relative;

            z-index: 2;

            font-size: 2.5rem;

            margin-bottom: 22px;

            display: inline-block;

            transition:
                transform .5s var(--smooth-cubic);
        }

        .hc-feature-card:hover .hc-ficon {
            transform:
                translateY(-7px)
                scale(1.15);
        }

        .hc-feature-card h4 {
            position: relative;

            z-index: 2;

            font-family:
                'Playfair Display', serif;

            font-size: 1.65rem;

            font-weight: 700;

            margin-bottom: 13px;

            color:
                var(--gold-light);
        }

        .hc-feature-card p {
            position: relative;

            z-index: 2;

            color:
                var(--text-muted);

            font-size: 1rem;

            line-height: 1.8;
        }


        /* =========================================================
           FOOTER CTA
        ========================================================= */

        .hc-cta-footer {
            padding:
                120px 24px;

            text-align: center;

            background:
                radial-gradient(
                    circle,
                    rgba(22,18,15,1) 0%,
                    rgba(10,9,8,1) 100%
                );

            border-top:
                1px solid rgba(255,255,255,.1);
        }

        .hc-cta-footer h2 {
            max-width: 900px;

            margin:
                0 auto 32px;

            font-family:
                'Playfair Display', serif;

            font-size:
                clamp(2.5rem,5vw,4.2rem);

            font-weight: 800;
        }


        /* =========================================================
           MOBILE
        ========================================================= */

        @media (max-width: 768px) {

            body {
                cursor: auto;
            }

            .hc-cursor-dot {
                display: none;
            }

            .hc-hero {
                min-height: 100vh;

                padding:
                    70px 0 35px;

                background-position:
                    center center;
            }

            .hc-hero-content {
                width: 92%;

                padding-top: 0;

                /* MOBILE CONTENT ALSO MOVED DOWN */
                transform: translateY(85px);

                margin-bottom: auto;
            }

            .hc-hero-badge {
                font-size: .68rem;

                letter-spacing: 2px;

                padding: 9px 18px;

                margin-bottom: 20px;
            }

            .hc-hero h1 {
                font-size:
                    clamp(2.6rem, 11vw, 4rem);

                line-height: 1.10;

                letter-spacing:
                    -1.5px;

                margin-bottom:
                    28px;
            }

            .hc-cta-row {
                gap: 10px;
            }

            .hc-btn-primary,
            .hc-btn-ghost {
                padding:
                    14px 24px;

                font-size:
                    .82rem;
            }

            .hc-gallery-strip {
                margin-top:
                    25px;

                padding:
                    10px 0 15px;
            }

            .hc-track {
                gap:
                    16px;

                animation-duration:
                    22s;
            }

            .hc-gallery-item {
                width:
                    280px;

                height:
                    155px;

                border-radius:
                    17px;
            }

            .hc-features {
                padding:
                    90px 20px;
            }

            .hc-features h2 {
                margin-bottom:
                    45px;
            }

            .hc-feature-grid {
                grid-template-columns:
                    1fr;

                gap:
                    20px;
            }

            .hc-feature-card {
                padding:
                    35px 27px;
            }

            .hc-cta-footer {
                padding:
                    90px 20px;
            }

            .hc-glow-blob {
                opacity:
                    .12;
            }
        }


        /* =========================================================
           SMALL MOBILE
        ========================================================= */

        @media (max-width: 420px) {

            .hc-hero-content {
                transform:
                    translateY(65px);
            }

            .hc-hero h1 {
                font-size:
                    2.35rem;
            }

            .hc-hero-badge {
                font-size:
                    .62rem;

                letter-spacing:
                    1.5px;
            }

            .hc-btn-primary,
            .hc-btn-ghost {
                padding:
                    13px 20px;
            }
        }


        /* =========================================================
           REDUCED MOTION
        ========================================================= */

        @media (prefers-reduced-motion: reduce) {

            html {
                scroll-behavior:
                    auto;
            }

            *,
            *::before,
            *::after {
                animation-duration:
                    .01ms !important;

                animation-iteration-count:
                    1 !important;

                transition-duration:
                    .01ms !important;
            }
        }

    </style>
</head>


<body>

    <!-- CUSTOM CURSOR -->

    <div class="hc-cursor-dot" id="hcCursor"></div>


    <!-- =========================================================
         HERO
    ========================================================== -->

    <section class="hc-hero">

        <div class="hc-glow-blob hc-glow-1"></div>
        <div class="hc-glow-blob hc-glow-2"></div>


        <!-- HERO CONTENT -->

        <div class="hc-hero-content">

            <div class="hc-hero-badge reveal-up">
                ✦ Crafted for Modern Living ✦
            </div>


            <h1 class="reveal-up delay-1">

                Sculpting Living Spaces With

                <span class="hc-accent">
                    HomeCraft
                </span>

            </h1>


            <!-- PARAGRAPH REMOVED -->


            <div class="hc-cta-row reveal-up delay-3">

                <a href="${pageContext.request.contextPath}/login"
                   class="hc-btn-primary">

                    Enter HomeCraft →

                </a>


                <a href="#features"
                   class="hc-btn-ghost">

                    Explore Details

                </a>

            </div>

        </div>


        <!-- =====================================================
             FULL WIDTH AUTO-SCROLLING GALLERY
        ====================================================== -->

        <div class="hc-gallery-strip reveal-up">

            <div class="hc-track">


                <!-- SET 1 -->

                <div class="hc-gallery-item">

                    <img
                        src="https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?auto=format&fit=crop&w=800&q=80"
                        alt="Luxury Interior 1">

                </div>


                <div class="hc-gallery-item">

                    <img
                        src="https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?auto=format&fit=crop&w=800&q=80"
                        alt="Luxury Interior 2">

                </div>


                <div class="hc-gallery-item">

                    <img
                        src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=800&q=80"
                        alt="Luxury Interior 3">

                </div>


                <div class="hc-gallery-item">

                    <img
                        src="https://images.unsplash.com/photo-1540518614846-7eded433c457?auto=format&fit=crop&w=800&q=80"
                        alt="Luxury Interior 4">

                </div>


                <!-- DUPLICATE SET FOR SEAMLESS LOOP -->

                <div class="hc-gallery-item">

                    <img
                        src="https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?auto=format&fit=crop&w=800&q=80"
                        alt="Luxury Interior 1">

                </div>


                <div class="hc-gallery-item">

                    <img
                        src="https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?auto=format&fit=crop&w=800&q=80"
                        alt="Luxury Interior 2">

                </div>


                <div class="hc-gallery-item">

                    <img
                        src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=800&q=80"
                        alt="Luxury Interior 3">

                </div>


                <div class="hc-gallery-item">

                    <img
                        src="https://images.unsplash.com/photo-1540518614846-7eded433c457?auto=format&fit=crop&w=800&q=80"
                        alt="Luxury Interior 4">

                </div>

            </div>

        </div>

    </section>


    <!-- =========================================================
         FEATURES
    ========================================================== -->

    <section id="features" class="hc-features">

        <span class="hc-eyebrow reveal-up">
            Excellence &amp; Innovation
        </span>


        <h2 class="reveal-up delay-1">
            Crafted For Modern Living
        </h2>


        <div class="hc-feature-grid">


            <div class="hc-feature-card reveal-up delay-1">

                <div class="hc-ficon">
                    🌳
                </div>

                <h4>
                    Sustainable Timber
                </h4>

                <p>
                    Ethically sourced premium hardwoods handcrafted
                    into timeless architectural statements.
                </p>

            </div>


            <div class="hc-feature-card reveal-up delay-2">

                <div class="hc-ficon">
                    ✨
                </div>

                <h4>
                    Master Artisans
                </h4>

                <p>
                    Every piece is custom-built with meticulous
                    attention to detail, balance, and fine finish.
                </p>

            </div>


            <div class="hc-feature-card reveal-up delay-3">

                <div class="hc-ficon">
                    🤝
                </div>

                <h4>
                    White-Glove Service
                </h4>

                <p>
                    Full-service setup, positioning, and interior
                    arrangement inside your luxury property.
                </p>

            </div>


            <div class="hc-feature-card reveal-up delay-4">

                <div class="hc-ficon">
                    🛡️
                </div>

                <h4>
                    Lifetime Support
                </h4>

                <p>
                    Guaranteed structural integrity for enduring
                    confidence across generations.
                </p>

            </div>

        </div>

    </section>


    <!-- =========================================================
         FOOTER CTA
    ========================================================== -->

    <section class="hc-cta-footer">

        <h2 class="reveal-up">
            Begin Your Living Transformation
        </h2>


        <a href="${pageContext.request.contextPath}/login"
           class="hc-btn-primary reveal-up delay-1">

            Sign In / Register Now

        </a>

    </section>


    <!-- =========================================================
         JAVASCRIPT
    ========================================================== -->

    <script>

        document.addEventListener("DOMContentLoaded", function () {


            /* =====================================================
               SCROLL REVEAL
            ====================================================== */

            const observerOptions = {
                threshold: 0.15
            };


            const observer =
                new IntersectionObserver(
                    function (entries) {

                        entries.forEach(function (entry) {

                            if (entry.isIntersecting) {

                                entry.target.classList.add("active");

                            }

                        });

                    },
                    observerOptions
                );


            document
                .querySelectorAll(".reveal-up")
                .forEach(function (element) {

                    observer.observe(element);

                });


            /* =====================================================
               CUSTOM CURSOR + SPARKLE TRAIL
            ====================================================== */

            const dot =
                document.getElementById("hcCursor");


            let mouseX = 0;
            let mouseY = 0;

            let dotX = 0;
            let dotY = 0;


            window.addEventListener(
                "mousemove",
                function (event) {

                    mouseX = event.clientX;
                    mouseY = event.clientY;


                    /* Create subtle sparkle particles */

                    if (Math.random() > 0.55) {

                        const sparkle =
                            document.createElement("div");

                        sparkle.className =
                            "hc-sparkle";


                        sparkle.style.left =
                            event.clientX + "px";

                        sparkle.style.top =
                            event.clientY + "px";


                        const angle =
                            Math.random() *
                            Math.PI *
                            2;


                        const distance =
                            15 +
                            Math.random() *
                            25;


                        sparkle.style.setProperty(
                            "--dx",
                            Math.cos(angle) *
                            distance +
                            "px"
                        );


                        sparkle.style.setProperty(
                            "--dy",
                            Math.sin(angle) *
                            distance +
                            "px"
                        );


                        document.body.appendChild(
                            sparkle
                        );


                        setTimeout(
                            function () {
                                sparkle.remove();
                            },
                            700
                        );

                    }

                }
            );


            /* Smooth cursor movement */

            function animateCursor() {

                dotX +=
                    (mouseX - dotX) *
                    0.22;

                dotY +=
                    (mouseY - dotY) *
                    0.22;


                dot.style.transform =
                    "translate3d(" +
                    dotX +
                    "px," +
                    dotY +
                    "px,0)";


                requestAnimationFrame(
                    animateCursor
                );
            }


            animateCursor();

        });

    </script>

</body>
</html>