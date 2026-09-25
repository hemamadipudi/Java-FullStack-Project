<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Order Confirmed - HomeCraft</title>
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
            display: flex;
            align-items: center;
            justify-content: center;
            color: #FFFDFB;
        }
        .hc-topbar .hc-brand{
            display: flex; align-items: center; gap: 10px;
            font-family: 'Playfair Display', serif; font-size: 1.5rem;
        }

        .container{
            background: #FFFDFB;
            border-radius: 16px;
            padding: 30px;
            margin-top: 26px;
            margin-bottom: 26px;
            box-shadow: 0 10px 28px rgba(58,52,46,.08);
        }

        .hc-success-hero{
            text-align: center;
            padding: 30px 10px 10px;
        }
        .hc-check-badge{
            width: 80px; height: 80px;
            border-radius: 50%;
            background: linear-gradient(120deg, #7C9473, #62795A);
            display: flex; align-items: center; justify-content: center;
            margin: 0 auto 20px;
            font-size: 2.2rem;
            color: #FFFDFB;
            box-shadow: 0 14px 30px rgba(124,148,115,.4);
            animation: hcPop .5s cubic-bezier(.2,.8,.3,1) both;
        }
        @keyframes hcPop{ from{ opacity:0; transform: scale(.7);} to{ opacity:1; transform: scale(1);} }

        .hc-success-hero h1{
            font-family: 'Playfair Display', serif;
            font-size: 2.1rem;
            color: #3A342E;
            margin-bottom: 8px;
        }
        .hc-success-hero p{
            color: #8a7f72;
            margin-bottom: 26px;
        }

        .hc-order-table{
            border-collapse: separate;
            border-spacing: 0 10px;
            width: 100%;
        }
        .hc-order-table thead th{
            border: none;
            color: #3A342E;
            font-size: .78rem;
            text-transform: uppercase;
            letter-spacing: .8px;
        }
        .hc-order-table tbody tr{
            background: #FAF3EA;
        }
        .hc-order-table tbody td{
            border: none;
            padding: 14px;
            font-size: .9rem;
            color: #3A342E;
        }
        .hc-order-table tbody tr td:first-child{ border-radius: 10px 0 0 10px; font-weight: 600; }
        .hc-order-table tbody tr td:last-child{ border-radius: 0 10px 10px 0; }

        .hc-total-box{
            background: linear-gradient(120deg, #3A342E, #4d453b);
            color: #FFFDFB;
            border-radius: 14px;
            padding: 22px 26px;
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .hc-total-box h4{ font-family: 'Playfair Display', serif; margin: 0; }
        .hc-total-box .hc-amount{ font-size: 1.5rem; color: #D9A441; font-weight: 700; }
        .hc-total-box p{ font-size: .82rem; color: #EFE7DC; margin: 4px 0 0; }

        .hc-continue-btn{
            border: none;
            border-radius: 30px;
            padding: 13px 36px;
            font-weight: 600;
            color: #3A342E;
            background: linear-gradient(120deg, #D9A441, #C1652F);
            box-shadow: 0 10px 24px rgba(217,164,65,.4);
            transition: transform .2s ease, box-shadow .2s ease;
            cursor: none;
        }
        .hc-continue-btn:hover{
            transform: translateY(-3px);
            box-shadow: 0 16px 34px rgba(217,164,65,.55);
            color: #3A342E;
        }

        .hc-footer-strip{ text-align: center; padding: 18px; color: #8a7f72; font-size: .85rem; }

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
        <div class="hc-success-hero">
            <div class="hc-check-badge">&#10003;</div>
            <h1>Thank you for shopping with HomeCraft!</h1>
            <p>Your order has been placed successfully. Here are your order details:</p>
        </div>

        <table class="hc-order-table">
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${order.orderItems}">
                    <tr>
                        <td>${item.product.name}</td>
                        <td>${item.quantity}</td>
                        <td>₹${item.price}</td>
                        <td>₹${item.price * item.quantity}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="hc-total-box">
            <div>
                <h4>Total Paid</h4>
                <p>We'll process your order and notify you by email shortly.</p>
            </div>
            <div class="hc-amount">₹<c:out value="${order.totalPrice}"/></div>
        </div>

        <div class="mt-4 text-center">
            <a href="/products" class="btn hc-continue-btn">Continue Shopping</a>
        </div>
    </div>

    <div class="hc-footer-strip">
        &copy; HomeCraft — Online Home &amp; Lifestyle Shopping Platform
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