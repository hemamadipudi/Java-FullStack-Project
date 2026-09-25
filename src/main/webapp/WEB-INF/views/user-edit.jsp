<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User - HomeCraft</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>
        html, body{
            margin: 0;
            font-family: 'Poppins', sans-serif;
            cursor: none;
            background:
                radial-gradient(circle at 10% 10%, rgba(193,101,47,.10), transparent 40%),
                radial-gradient(circle at 90% 30%, rgba(124,148,115,.12), transparent 45%),
                radial-gradient(circle at 50% 90%, rgba(217,164,65,.10), transparent 45%),
                #FAF3EA !important;
            background-attachment: fixed;
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

        .hc-form-wrap{
            max-width: 560px;
            margin: 46px auto;
            padding: 0 20px;
        }

        .hc-form-card{
            background: #FFFDFB;
            border-radius: 18px;
            padding: 40px 38px;
            box-shadow: 0 20px 45px rgba(58,52,46,.14);
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
        .hc-form-card h1{
            font-family: 'Playfair Display', serif;
            font-size: 1.9rem;
            color: #3A342E;
            margin-bottom: 6px;
        }
        .hc-form-card .hc-sub{
            color: #8a7f72;
            font-size: .9rem;
            margin-bottom: 28px;
        }

        .hc-field{ margin-bottom: 20px; }
        .hc-field label{
            display: block;
            font-size: .78rem;
            font-weight: 600;
            letter-spacing: .6px;
            text-transform: uppercase;
            color: #7C9473;
            margin-bottom: 7px;
        }
        .hc-field input, .hc-field select{
            width: 100%;
            border: 1px solid #EADFCF;
            border-radius: 10px;
            padding: 11px 14px;
            font-size: .95rem;
            color: #3A342E;
            transition: border-color .25s ease, box-shadow .25s ease;
            cursor: none;
        }
        .hc-field input:focus, .hc-field select:focus{
            outline: none;
            border-color: #C1652F;
            box-shadow: 0 0 0 3px rgba(193,101,47,.15);
        }

        .hc-btn-submit{
            width: 100%;
            border: none;
            border-radius: 12px;
            padding: 14px;
            font-size: 1rem;
            font-weight: 600;
            color: #3A342E;
            background: linear-gradient(120deg, #D9A441, #C1652F);
            background-size: 160% auto;
            box-shadow: 0 12px 26px rgba(217,164,65,.4);
            transition: transform .2s ease, box-shadow .2s ease, background-position .3s ease;
            cursor: none;
        }
        .hc-btn-submit:hover{
            transform: translateY(-3px);
            box-shadow: 0 18px 38px rgba(217,164,65,.55);
            background-position: right center;
        }

        .hc-back-link{
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #7C9473;
            font-weight: 600;
            font-size: .9rem;
            cursor: none;
        }
        .hc-back-link:hover{ color: #62795A; }

        .hc-cursor-dot{
            position: fixed; top: 0; left: 0; width: 10px; height: 10px; margin: -5px 0 0 -5px;
            border-radius: 50%; background: #D9A441;
            box-shadow: 0 0 14px 5px rgba(217,164,65,.6);
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

    <div class="hc-topbar">
        <div class="hc-brand">&#127968; HomeCraft</div>
    </div>

    <div class="hc-form-wrap">
        <div class="hc-form-card">
            <div class="hc-eyebrow">Admin &middot; Users</div>
            <h1>Edit User</h1>
            <p class="hc-sub">Update this user's account details.</p>

            <!-- Same form action/fields as original -->
            <form action="/users/update/${user.id}" method="post">
                <div class="hc-field">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" value="${user.username}" required>
                </div>
                <div class="hc-field">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" value="${user.password}" required>
                </div>
                <div class="hc-field">
                    <label for="role">Role</label>
                    <select id="role" name="role" required>
                        <option value="USER" ${user.role == 'USER' ? 'selected' : ''}>User</option>
                        <option value="ADMIN" ${user.role == 'ADMIN' ? 'selected' : ''}>Admin</option>
                    </select>
                </div>
                <div class="hc-field">
                    <label for="phone_number">Phone Number</label>
                    <input type="text" id="phone_number" name="phone_number" value="${user.phone_number}" required>
                </div>
                <div class="hc-field">
                    <label for="email">Email</label>
                    <input type="text" id="email" name="email" value="${user.email}" required>
                </div>

                <button type="submit" class="hc-btn-submit">Update User</button>
            </form>

            <a href="/users" class="hc-back-link">&larr; Back to User List</a>
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
    </script>
</body>
</html>