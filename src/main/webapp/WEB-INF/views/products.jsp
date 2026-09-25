<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <title>Products - HomeCraft</title>
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

        .container{
            max-width: 900px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .hc-panel{
            background: #FFFDFB;
            border-radius: 18px;
            padding: 34px 30px;
            box-shadow: 0 16px 36px rgba(58,52,46,.10);
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
        .hc-panel h1{
            font-family: 'Playfair Display', serif;
            font-size: 1.9rem;
            color: #3A342E;
            margin: 0 0 22px;
        }
        .hc-panel h2{
            font-family: 'Playfair Display', serif;
            font-size: 1.4rem;
            color: #3A342E;
            margin: 40px 0 18px;
        }

        .hc-simple-table{
            border-collapse: separate;
            border-spacing: 0 10px;
            width: 100%;
        }
        .hc-simple-table thead th{
            border: none;
            color: #3A342E;
            font-size: .74rem;
            text-transform: uppercase;
            letter-spacing: .7px;
            padding-bottom: 6px;
        }
        .hc-simple-table tbody tr{ background: #FAF3EA; }
        .hc-simple-table tbody td{
            border: none;
            padding: 14px;
            font-size: .9rem;
            color: #3A342E;
        }
        .hc-simple-table tbody tr td:first-child{ border-radius: 10px 0 0 10px; }
        .hc-simple-table tbody tr td:last-child{ border-radius: 0 10px 10px 0; }

        .hc-field{ margin-bottom: 18px; }
        .hc-field label{
            display: block;
            font-size: .78rem;
            font-weight: 600;
            letter-spacing: .6px;
            text-transform: uppercase;
            color: #7C9473;
            margin-bottom: 7px;
        }
        .hc-field input, .hc-field textarea{
            width: 100%;
            border: 1px solid #EADFCF;
            border-radius: 10px;
            padding: 11px 14px;
            font-size: .95rem;
            color: #3A342E;
            transition: border-color .25s ease, box-shadow .25s ease;
            cursor: none;
        }
        .hc-field input:focus, .hc-field textarea:focus{
            outline: none;
            border-color: #C1652F;
            box-shadow: 0 0 0 3px rgba(193,101,47,.15);
        }

        .hc-btn-submit{
            border: none;
            border-radius: 12px;
            padding: 12px 32px;
            font-size: .95rem;
            font-weight: 600;
            color: #3A342E;
            background: linear-gradient(120deg, #D9A441, #C1652F);
            box-shadow: 0 12px 26px rgba(217,164,65,.4);
            transition: transform .2s ease, box-shadow .2s ease;
            cursor: none;
        }
        .hc-btn-submit:hover{
            transform: translateY(-3px);
            box-shadow: 0 18px 38px rgba(217,164,65,.55);
        }

        .hc-action-row{
            display: flex;
            gap: 14px;
            flex-wrap: wrap;
            margin-top: 30px;
        }
        .hc-btn-pill{
            display: inline-block;
            border: none;
            border-radius: 26px;
            padding: 10px 26px;
            font-weight: 600;
            font-size: .88rem;
            cursor: none;
            transition: transform .2s ease, box-shadow .2s ease;
        }
        .hc-btn-sage{
            color: #fff;
            background: linear-gradient(120deg, #7C9473, #62795A);
            box-shadow: 0 10px 22px rgba(124,148,115,.35);
        }
        .hc-btn-sage:hover{ transform: translateY(-2px); box-shadow: 0 14px 28px rgba(124,148,115,.5); color: #fff; }
        .hc-btn-danger{
            color: #fff;
            background: linear-gradient(120deg, #C1493D, #B23A2E);
            box-shadow: 0 10px 22px rgba(178,58,46,.35);
        }
        .hc-btn-danger:hover{ transform: translateY(-2px); box-shadow: 0 14px 28px rgba(178,58,46,.5); color: #fff; }

        .hc-footer-strip{ text-align: center; padding: 26px 10px; color: #8a7f72; font-size: .85rem; }

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

    <div class="container">
        <div class="hc-panel">
            <span class="hc-eyebrow">HomeCraft Catalog</span>
            <h1>Product List</h1>

            <table class="hc-simple-table">
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${products}">
                        <tr>
                            <td>${product.id}</td>
                            <td>${product.name}</td>
                            <td>${product.description}</td>
                            <td>₹${product.price}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <h2>Add New Product</h2>
            <form action="/products/add" method="post">
                <div class="hc-field">
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="hc-field">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" rows="3" required></textarea>
                </div>
                <div class="hc-field">
                    <label for="price">Price</label>
                    <input type="number" id="price" name="price" step="0.01" required>
                </div>

                <button type="submit" class="hc-btn-submit">Add Product</button>
            </form>

            <div class="hc-action-row">
                <a href="/cart" class="hc-btn-pill hc-btn-sage">View Cart</a>
                <a href="/logout" class="hc-btn-pill hc-btn-danger">Logout</a>
            </div>
        </div>
    </div>

    <div class="hc-footer-strip">
        &copy; HomeCraft — Online Home &amp; Lifestyle Shopping Platform
    </div>

    <div class="hc-cursor-dot" id="hcCursorDot"></div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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