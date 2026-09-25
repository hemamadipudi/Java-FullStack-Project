<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - HomeCraft</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>
        html, body{
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background:
                radial-gradient(circle at 10% 10%, rgba(193,101,47,.10), transparent 40%),
                radial-gradient(circle at 90% 30%, rgba(124,148,115,.12), transparent 45%),
                radial-gradient(circle at 50% 90%, rgba(217,164,65,.10), transparent 45%),
                #FAF3EA;
        }

        .hc-topbar{
            background: linear-gradient(120deg, #3A342E, #4d453b);
            border-bottom: 3px solid #C1652F;
            padding: 16px 30px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            color: #FFFDFB;
        }
        .hc-topbar .hc-brand{
            display: flex; align-items: center; gap: 10px;
            font-family: 'Playfair Display', serif; font-size: 1.5rem;
        }
        .hc-topbar .hc-user-info{ display: flex; align-items: center; gap: 14px; font-size: .92rem; }
        .hc-topbar .hc-logout-btn{
            background: linear-gradient(120deg, #D9A441, #C1652F);
            color: #3A342E; border: none; padding: 6px 16px; border-radius: 20px;
            font-weight: 600; font-size: .8rem; text-decoration: none;
            cursor: pointer; transition: transform .15s ease, box-shadow .15s ease;
        }
        .hc-topbar .hc-logout-btn:hover{ transform: translateY(-2px); box-shadow: 0 8px 18px rgba(217,164,65,.4); color: #3A342E; text-decoration: none; }
        .hc-topbar .hc-logout-btn:active{ transform: translateY(0) scale(.95); box-shadow: 0 4px 10px rgba(217,164,65,.35); }
        .hc-topbar .hc-logout-btn:focus{ outline: 3px solid rgba(217,164,65,.5); outline-offset: 2px; }

        .container{
            max-width: 900px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .hc-dash-hero{
            text-align: center;
            margin-bottom: 40px;
        }
        .hc-eyebrow{
            display: inline-block;
            font-size: .72rem;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: #C1652F;
            font-weight: 600;
            margin-bottom: 10px;
        }
        .hc-dash-hero h1{
            font-family: 'Playfair Display', serif;
            font-size: 2.3rem;
            color: #3A342E;
            margin-bottom: 6px;
        }
        .hc-dash-hero p{ color: #8a7f72; }

        .hc-admin-card{
            background: #FFFDFB;
            border-radius: 18px;
            padding: 40px 30px;
            text-align: center;
            box-shadow: 0 16px 36px rgba(58,52,46,.10);
            transition: transform .25s ease, box-shadow .25s ease;
            height: 100%;
        }
        .hc-admin-card:hover{
            transform: translateY(-8px);
            box-shadow: 0 26px 50px rgba(58,52,46,.18);
        }
        .hc-admin-card .hc-icon{
            width: 70px; height: 70px;
            border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            margin: 0 auto 22px;
            font-size: 1.8rem;
            color: #FFFDFB;
        }
        .hc-icon-users{ background: linear-gradient(120deg, #7C9473, #62795A); }
        .hc-icon-products{ background: linear-gradient(120deg, #D9A441, #C1652F); }

        .hc-admin-card h5{
            font-family: 'Playfair Display', serif;
            font-size: 1.3rem;
            color: #3A342E;
            margin-bottom: 8px;
        }
        .hc-admin-card p{
            color: #8a7f72;
            font-size: .9rem;
            margin-bottom: 22px;
        }

        .hc-admin-btn{
            display: inline-block;
            border: none;
            border-radius: 26px;
            padding: 10px 28px;
            font-weight: 600;
            font-size: .88rem;
            color: #3A342E;
            background: linear-gradient(120deg, #D9A441, #C1652F);
            background-size: 160% auto;
            box-shadow: 0 10px 22px rgba(217,164,65,.35);
            transition: transform .15s ease, box-shadow .15s ease, background-position .2s ease;
            cursor: pointer;
            text-decoration: none;
            -webkit-tap-highlight-color: transparent;
        }
        .hc-admin-btn:hover{
            transform: translateY(-3px);
            box-shadow: 0 16px 30px rgba(217,164,65,.5);
            background-position: right center;
            color: #3A342E;
            text-decoration: none;
        }
        .hc-admin-btn:active{
            transform: translateY(0) scale(.95);
            box-shadow: 0 6px 14px rgba(217,164,65,.4);
        }
        .hc-admin-btn:focus{
            outline: 3px solid rgba(217,164,65,.55);
            outline-offset: 2px;
        }

        .hc-footer-strip{ text-align: center; padding: 26px; color: #8a7f72; font-size: .85rem; }
		/* Premium HomeCraft Cursor */
		html, body {
		    cursor: none;
		}

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
		    box-shadow: 0 0 15px rgba(217,164,65,.22);
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

		/* Sparkles */
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
		        transform: translate(var(--dx), var(--dy)) scale(.2);
		    }
		}
    </style>
</head>
<body>

    <div class="hc-topbar">
        <div class="hc-brand">&#127968; HomeCraft</div>
        <c:if test="${loggedInUser != null}">
            <div class="hc-user-info">
                <span>Welcome, ${loggedInUser.username}!</span>
                <a href="/logout" class="hc-logout-btn">Sign Out</a>
            </div>
        </c:if>
    </div>

    <div class="container">
        <div class="hc-dash-hero">
            <div class="hc-eyebrow">Admin Panel</div>
            <h1>Admin Dashboard</h1>
            <p>Manage everything that keeps HomeCraft running</p>
        </div>

        <div class="row">
            <div class="col-md-6 mb-4">
                <div class="hc-admin-card">
                    <div class="hc-icon hc-icon-users">&#128101;</div>
                    <h5>Manage Users</h5>
                    <p>Add, edit, or remove users from the system.</p>
                    <a href="/users" class="hc-admin-btn">Go to Manage Users</a>
                </div>
            </div>
            <div class="col-md-6 mb-4">
                <div class="hc-admin-card">
                    <div class="hc-icon hc-icon-products">&#128717;&#65039;</div>
                    <h5>Manage Products</h5>
                    <p>Add, edit, or remove products in the catalog.</p>
                    <a href="/products" class="hc-admin-btn">Go to Manage Products</a>
                </div>
            </div>
        </div>
    </div>

    <div class="hc-footer-strip">
        &copy; HomeCraft &mdash; Online Home &amp; Lifestyle Shopping Platform
    </div>
	
	<div class="hc-cursor-dot" id="hcCursorDot"></div>

	<script>
	    var dot = document.getElementById('hcCursorDot');
	    var lastSpark = 0;

	    document.addEventListener('mousemove', function (e) {

	        /* Move premium cursor */
	        dot.style.left = e.clientX + 'px';
	        dot.style.top = e.clientY + 'px';

	        /* Create sparkle trail */
	        spawnSparkle(e.clientX, e.clientY);
	    });

	    function spawnSparkle(x, y) {

	        var now = Date.now();

	        /* Prevent too many particles */
	        if (now - lastSpark < 45) {
	            return;
	        }

	        lastSpark = now;

	        var sparkle = document.createElement('div');

	        sparkle.className = 'hc-sparkle';

	        /* Random direction */
	        var angle = Math.random() * Math.PI * 2;

	        /* Random distance */
	        var distance = 14 + Math.random() * 24;

	        sparkle.style.setProperty(
	            '--dx',
	            (Math.cos(angle) * distance) + 'px'
	        );

	        sparkle.style.setProperty(
	            '--dy',
	            (Math.sin(angle) * distance) + 'px'
	        );

	        sparkle.style.left = x + 'px';
	        sparkle.style.top = y + 'px';

	        document.body.appendChild(sparkle);

	        /* Remove after animation */
	        setTimeout(function () {
	            sparkle.remove();
	        }, 700);
	    }
	</script>

</body>
</html>