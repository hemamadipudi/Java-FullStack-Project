<!-- checkout.jsp -->
<!DOCTYPE html>
<html>
<head>
    <title>Checkout - HomeCraft</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>

    <style>
        html, body{
            height: 100%;
            margin: 0;
            font-family: 'Poppins', sans-serif;
            cursor: none;
        }

        .hc-bg{
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
            background:
                linear-gradient(160deg, rgba(58,52,46,.84), rgba(58,52,46,.58)),
                url('https://images.unsplash.com/photo-1586023492125-27b2c045efd7?auto=format&fit=crop&w=1600&q=80') center/cover no-repeat fixed;
        }

        .hc-blob{ position: absolute; border-radius: 50%; filter: blur(60px); opacity: .5; pointer-events: none; }
        .hc-blob-1{ width:340px; height:340px; background:#D9A441; top:-90px; left:-100px; animation: hcDrift1 9s ease-in-out infinite; }
        .hc-blob-2{ width:300px; height:300px; background:#7C9473; bottom:-100px; right:-80px; animation: hcDrift2 11s ease-in-out infinite; }
        @keyframes hcDrift1{ 0%,100%{ transform: translate(0,0);} 50%{ transform: translate(24px,18px);} }
        @keyframes hcDrift2{ 0%,100%{ transform: translate(0,0);} 50%{ transform: translate(-20px,-14px);} }

        .hc-checkout-card{
            position: relative;
            z-index: 3;
            width: 100%;
            max-width: 400px;
            margin: 20px;
            background: rgba(255,253,251,.97);
            border-radius: 22px;
            padding: 46px 38px;
            text-align: center;
            box-shadow: 0 30px 60px rgba(0,0,0,.35);
            animation: hcPop .55s cubic-bezier(.2,.8,.3,1) both;
        }
        @keyframes hcPop{ from{ opacity:0; transform: translateY(20px) scale(.96);} to{ opacity:1; transform: translateY(0) scale(1);} }

        .hc-checkout-card .hc-icon{
            font-size: 2.4rem;
            margin-bottom: 16px;
        }
        .hc-checkout-card h1{
            font-family: 'Playfair Display', serif;
            font-size: 1.8rem;
            color: #3A342E;
            margin-bottom: 10px;
        }
        .hc-checkout-card p{
            color: #8a7f72;
            font-size: .9rem;
            margin-bottom: 30px;
        }

        #rzp-button{
            width: 100%;
            border: none;
            border-radius: 30px;
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
        #rzp-button:hover{
            transform: translateY(-3px);
            box-shadow: 0 18px 36px rgba(217,164,65,.55);
            background-position: right center;
        }

        .hc-cursor-dot{
            position: fixed; top: 0; left: 0; width: 10px; height: 10px; margin: -5px 0 0 -5px;
            border-radius: 50%; background: #D9A441;
            box-shadow: 0 0 14px 5px rgba(217,164,65,.65);
            pointer-events: none; z-index: 9999; transition: transform .08s ease;
        }
    </style>
</head>
<body>

    <div class="hc-bg">
        <div class="hc-blob hc-blob-1"></div>
        <div class="hc-blob hc-blob-2"></div>

        <div class="hc-checkout-card">
            <div class="hc-icon">&#128179;</div>
            <h1>Payment Checkout</h1>
            <p>You're one click away from completing your HomeCraft order.</p>
            <button id="rzp-button">Pay Now</button>
        </div>
    </div>

    <div class="hc-cursor-dot" id="hcCursorDot"></div>

    <script>
        document.addEventListener('mousemove', function (e) {
            var dot = document.getElementById('hcCursorDot');
            dot.style.left = e.clientX + 'px';
            dot.style.top = e.clientY + 'px';
        });

        var options = {
            "key": "YOUR_API_KEY",
            "amount": "<%= orderDetails.amount %>",
            "currency": "INR",
            "name": "HomeCraft",
            "description": "Order Payment",
            "order_id": "<%= orderDetails.id %>",
            "handler": function (response) {
                alert("Payment successful!");
                location.href = "/payment/verify?razorpayPaymentId=" + response.razorpay_payment_id +
                                "&razorpayOrderId=" + response.razorpay_order_id +
                                "&razorpaySignature=" + response.razorpay_signature;
            },
            "prefill": {
                "name": "Test User",
                "email": "testuser@example.com",
                "contact": "9876543210"
            },
            "theme": {
                "color": "#C1652F"
            }
        };
        var rzp = new Razorpay(options);
        document.getElementById('rzp-button').onclick = function (e) {
            rzp.open();
            e.preventDefault();
        }
    </script>
</body>
</html>