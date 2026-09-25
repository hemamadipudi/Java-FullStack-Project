<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Cart - HomeCraft</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>

    <style>
        html, body{
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: #FAF3EA !important;
            cursor: none;
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

        .container{
            background: #FFFDFB;
            border-radius: 16px;
            padding: 30px;
            margin-top: 26px;
            margin-bottom: 26px;
            box-shadow: 0 10px 28px rgba(58,52,46,.08);
        }

        .hc-page-hero{
            position: relative;
            border-radius: 18px;
            overflow: hidden;
            padding: 40px 30px;
            margin-bottom: 30px;
            text-align: center;
            color: #FFFDFB;
            background:
                linear-gradient(150deg, rgba(58,52,46,.82), rgba(58,52,46,.6)),
                url('https://images.unsplash.com/photo-1586023492125-27b2c045efd7?auto=format&fit=crop&w=1400&q=80') center/cover no-repeat;
            box-shadow: 0 20px 45px rgba(58,52,46,.2);
        }
        .hc-page-hero h1{
            font-family: 'Playfair Display', serif;
            font-size: 2.1rem;
            margin: 0 0 6px;
        }
        .hc-page-hero p{
            font-size: .94rem;
            color: #EFE7DC;
            margin: 0;
        }
        .hc-page-hero .hc-eyebrow{
            display: inline-block;
            font-size: .72rem;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: #D9A441;
            border: 1px solid rgba(255,253,251,.4);
            padding: 5px 14px;
            border-radius: 30px;
            margin-bottom: 12px;
        }

        .hc-cart-table{
            border-collapse: separate;
            border-spacing: 0 12px;
            width: 100%;
        }
        .hc-cart-table thead th{
            background: transparent;
            border: none;
            color: #3A342E;
            font-size: .78rem;
            text-transform: uppercase;
            letter-spacing: .8px;
            padding-bottom: 4px;
        }
        .hc-cart-table tbody tr{
            background: #FAF3EA;
            box-shadow: 0 6px 16px rgba(58,52,46,.06);
        }
        .hc-cart-table tbody td{
            border: none;
            vertical-align: middle;
            padding: 16px 14px;
            font-size: .92rem;
            color: #3A342E;
        }
        .hc-cart-table tbody tr td:first-child{ border-radius: 12px 0 0 12px; font-weight: 600; }
        .hc-cart-table tbody tr td:last-child{ border-radius: 0 12px 12px 0; }

        .hc-qty-input{
            width: 60px !important;
            border-radius: 8px !important;
        }
        .hc-mini-btn{
            border-radius: 20px;
            font-size: .78rem;
            padding: 5px 14px;
            border: none;
            cursor: none;
            transition: transform .2s ease, box-shadow .2s ease;
        }
        .hc-mini-btn-update{
            background: linear-gradient(120deg, #D9A441, #C1652F);
            color: #3A342E;
            box-shadow: 0 6px 14px rgba(217,164,65,.35);
        }
        .hc-mini-btn-update:hover{ transform: translateY(-2px); box-shadow: 0 10px 20px rgba(217,164,65,.5); color: #3A342E; }
        .hc-mini-btn-remove{
            background: #F6DCD7;
            color: #B23A2E;
            box-shadow: none;
        }
        .hc-mini-btn-remove:hover{ background: #f0c6bd; }

        .hc-total-row{
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 6px;
            border-top: 2px dashed #F1E6D8;
            margin-top: 10px;
        }
        .hc-total-row h4{
            font-family: 'Playfair Display', serif;
            color: #3A342E;
            margin: 0;
        }
        .hc-total-row .hc-total-amount{
            font-size: 1.6rem;
            color: #C1652F;
            font-weight: 700;
        }

        .hc-checkout-btn{
            border: none;
            border-radius: 30px;
            padding: 14px 40px;
            font-weight: 600;
            font-size: 1rem;
            color: #3A342E;
            background: linear-gradient(120deg, #D9A441, #C1652F);
            background-size: 160% auto;
            box-shadow: 0 12px 26px rgba(217,164,65,.4);
            transition: transform .2s ease, box-shadow .2s ease, background-position .3s ease;
            cursor: none;
        }
        .hc-checkout-btn:hover{
            transform: translateY(-3px);
            box-shadow: 0 18px 36px rgba(217,164,65,.55);
            background-position: right center;
        }

        .hc-empty-cart{
            text-align: center;
            padding: 50px 20px;
        }
        .hc-empty-cart .hc-empty-icon{ font-size: 3rem; margin-bottom: 14px; }
        .hc-empty-cart p{ color: #8a7f72; }
        .hc-empty-cart a{
            color: #C1652F;
            font-weight: 600;
            cursor: none;
        }

        .hc-continue-btn{
            border-radius: 30px;
            padding: 12px 30px;
            font-weight: 600;
            cursor: none;
        }

        .hc-footer-strip{
            text-align: center;
            padding: 18px;
            color: #8a7f72;
            font-size: .85rem;
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

        <div class="hc-page-hero">
            <div class="hc-eyebrow">Your Bag</div>
            <h1>Your Cart</h1>
            <p>Review your picks before checkout</p>
        </div>

        <c:if test="${not empty cartItems}">
            <table class="hc-cart-table">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Price (&#8377;)</th>
                        <th>Quantity</th>
                        <th>Subtotal</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${cartItems}">
                        <tr>
                            <td>${item.product.name}</td>
                            <td>${item.price}</td>
                            <td>
                                <form action="/cart/update" method="post" class="d-flex align-items-center">
                                    <input type="hidden" name="productId" value="${item.product.id}">
                                    <input type="number" name="quantity" value="${item.quantity}" min="0" class="form-control form-control-sm hc-qty-input mr-2">
                                    <button type="submit" class="hc-mini-btn hc-mini-btn-update">Update</button>
                                </form>
                            </td>
                            <td>${item.price * item.quantity}</td>
                            <td>
                                <form action="/cart/update" method="post">
                                    <input type="hidden" name="productId" value="${item.product.id}">
                                    <input type="hidden" name="quantity" value="0">
                                    <button type="submit" class="hc-mini-btn hc-mini-btn-remove">Remove</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div class="hc-total-row">
                <h4>Total</h4>
                <span class="hc-total-amount">${totalPrice}</span>
            </div>

            <div class="text-center mt-4">
                <button id="checkoutButton" class="hc-checkout-btn">Proceed to Checkout</button>
            </div>
        </c:if>

        <c:if test="${empty cartItems}">
            <div class="hc-empty-cart">
                <div class="hc-empty-icon">&#128722;</div>
                <p>Your cart is empty.</p>
                <a href="/products">Continue Shopping &rarr;</a>
            </div>
        </c:if>

        <div class="mt-4 text-center">
            <a href="/products" class="btn btn-primary hc-continue-btn">Continue Shopping</a>
        </div>
    </div>

    <div class="hc-footer-strip">
        &copy; HomeCraft — Online Home &amp; Lifestyle Shopping Platform
    </div>

    <div class="hc-cursor-dot" id="hcCursorDot"></div>

    <!-- Razorpay JavaScript Integration (unchanged) -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var checkoutBtn = document.getElementById("checkoutButton");
            if (checkoutBtn) {
                checkoutBtn.onclick = function (e) {
                    e.preventDefault();

                    fetch('/cart/razorpayOrder', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' }
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data && data.id) {
                            const options = {
                                key: "rzp_test_VxDXNU2LjZXDcy",
                                amount: data.amount,
                                currency: data.currency,
                                name: "HomeCraft",
                                description: "Order Payment",
                                order_id: data.id,
                                handler: function (response) {
                                    alert("Payment Successful! Payment ID: " + response.razorpay_payment_id);
                                    window.location.href = "/cart/payment-success";
                                },
                                prefill: {
                                    name: "Customer Name",
                                    email: "customer@example.com",
                                    contact: "1234567890"
                                },
                                theme: { color: "#C1652F" }
                            };

                            const razorpay = new Razorpay(options);
                            razorpay.open();
                        } else {
                            alert("Failed to create Razorpay order.");
                        }
                    })
                    .catch(error => {
                        console.error("Error creating Razorpay order:", error);
                        alert("An error occurred while processing your payment.");
                    });
                };
            }
        });

        /* Sparkle cursor */
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