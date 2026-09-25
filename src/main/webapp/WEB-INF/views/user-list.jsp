<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List - HomeCraft</title>
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
            text-align: center;
            color: #FFFDFB;
        }
        .hc-topbar .hc-brand{
            display: inline-flex; align-items: center; gap: 10px;
            font-family: 'Playfair Display', serif; font-size: 1.5rem;
        }

        .container{
            max-width: 1000px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .hc-panel{
            background: #FFFDFB;
            border-radius: 18px;
            padding: 34px 30px;
            box-shadow: 0 16px 36px rgba(58,52,46,.10);
        }

        .hc-panel-header{
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 14px;
            margin-bottom: 26px;
        }
        .hc-eyebrow{
            display: block;
            font-size: .72rem;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: #C1652F;
            font-weight: 600;
            margin-bottom: 6px;
        }
        .hc-panel-header h1{
            font-family: 'Playfair Display', serif;
            font-size: 1.9rem;
            color: #3A342E;
            margin: 0;
        }

        .hc-create-btn{
            border: none;
            border-radius: 26px;
            padding: 10px 26px;
            font-weight: 600;
            font-size: .88rem;
            color: #3A342E;
            background: linear-gradient(120deg, #D9A441, #C1652F);
            box-shadow: 0 10px 22px rgba(217,164,65,.35);
            transition: transform .15s ease, box-shadow .15s ease;
            cursor: pointer;
            display: inline-block;
            text-decoration: none;
        }
        .hc-create-btn:hover{
            transform: translateY(-2px);
            box-shadow: 0 14px 28px rgba(217,164,65,.5);
            color: #3A342E;
            text-decoration: none;
        }
        .hc-create-btn:active{
            transform: translateY(0) scale(.96);
            box-shadow: 0 6px 14px rgba(217,164,65,.4);
        }
        .hc-create-btn:focus{
            outline: 3px solid rgba(217,164,65,.5);
            outline-offset: 2px;
        }

        .hc-user-table{
            border-collapse: separate;
            border-spacing: 0 10px;
            width: 100%;
        }
        .hc-user-table thead th{
            border: none;
            color: #3A342E;
            font-size: .74rem;
            text-transform: uppercase;
            letter-spacing: .7px;
            padding-bottom: 6px;
        }
        .hc-user-table tbody tr{
            background: #FAF3EA;
        }
        .hc-user-table tbody td{
            border: none;
            padding: 14px;
            font-size: .9rem;
            color: #3A342E;
            vertical-align: middle;
        }
        .hc-user-table tbody tr td:first-child{ border-radius: 10px 0 0 10px; }
        .hc-user-table tbody tr td:last-child{ border-radius: 0 10px 10px 0; }

        .hc-role-badge{
            display: inline-block;
            padding: 3px 12px;
            border-radius: 20px;
            font-size: .74rem;
            font-weight: 700;
        }
        .hc-role-admin{ background: #F1E6D8; color: #C1652F; }
        .hc-role-user{ background: #E9EFE6; color: #62795A; }

        .hc-mini-btn{
            display: inline-block;
            border-radius: 20px;
            font-size: .78rem;
            font-weight: 600;
            padding: 6px 16px;
            border: none;
            cursor: pointer;
            text-decoration: none;
            transition: transform .15s ease, box-shadow .15s ease, background .15s ease;
            -webkit-tap-highlight-color: transparent;
        }
        .hc-mini-btn-edit{ background: #FBE7C6; color: #8a5a12; }
        .hc-mini-btn-edit:hover{
            background: #F3D08C;
            transform: translateY(-2px);
            box-shadow: 0 8px 16px rgba(217,164,65,.35);
            color: #8a5a12;
            text-decoration: none;
        }
        .hc-mini-btn-edit:active{
            transform: translateY(0) scale(.94);
            background: #E8C67A;
            box-shadow: 0 4px 8px rgba(217,164,65,.3);
        }
        .hc-mini-btn-edit:focus{
            outline: 3px solid rgba(217,164,65,.55);
            outline-offset: 2px;
        }

        .hc-mini-btn-delete{ background: #F6DCD7; color: #B23A2E; }
        .hc-mini-btn-delete:hover{
            background: #f0c6bd;
            transform: translateY(-2px);
            box-shadow: 0 8px 16px rgba(178,58,46,.3);
            color: #B23A2E;
            text-decoration: none;
        }
        .hc-mini-btn-delete:active{
            transform: translateY(0) scale(.94);
            background: #e8b3a8;
            box-shadow: 0 4px 8px rgba(178,58,46,.25);
        }
        .hc-mini-btn-delete:focus{
            outline: 3px solid rgba(178,58,46,.45);
            outline-offset: 2px;
        }

        .hc-footer-strip{ text-align: center; padding: 26px 10px; color: #8a7f72; font-size: .85rem; }
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
    </div>

    <div class="container">
        <div class="hc-panel">
            <div class="hc-panel-header">
                <div>
                    <span class="hc-eyebrow">Admin &middot; Users</span>
                    <h1>User List</h1>
                </div>
                <a href="/users/create" class="hc-create-btn">+ Create New User</a>
            </div>

            <table class="hc-user-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Role</th>
                        <th>Phone Number</th>
                        <th>Email</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.username}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${user.role == 'ADMIN'}">
                                        <span class="hc-role-badge hc-role-admin">${user.role}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="hc-role-badge hc-role-user">${user.role}</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${user.phone_number}</td>
                            <td>${user.email}</td>
                            <td>
                                <a href="/users/edit/${user.id}" class="hc-mini-btn hc-mini-btn-edit">Edit</a>
                                <a href="/users/delete/${user.id}" class="hc-mini-btn hc-mini-btn-delete">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
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