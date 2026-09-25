<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!DOCTYPE html>
		<html>

		<head>

			<meta charset="UTF-8">

			<title>Product List - HomeCraft</title>

			<!-- Bootstrap -->
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

			<link rel="stylesheet" href="/styles.css">

			<!-- Premium Fonts -->
			<link rel="preconnect" href="https://fonts.googleapis.com">

			<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

			<link
				href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Poppins:wght@300;400;500;600&display=swap"
				rel="stylesheet">


			<style>
				/* =========================================================
   HOMECRAFT PRODUCT LIST
   FRONTEND ONLY
   Backend / JSP functionality unchanged
   ========================================================= */

				:root {

					--hc-terracotta: #C1652F;
					--hc-gold: #D9A441;
					--hc-gold-light: #F0CC82;
					--hc-sage: #7C9473;

					--hc-charcoal: #3A342E;
					--hc-dark: #28231F;

					--hc-cream: #FAF3EA;
					--hc-linen: #FFFDFB;

					--hc-border: rgba(58, 52, 46, .10);

					--hc-shadow:
						0 12px 35px rgba(58, 52, 46, .10);

					--hc-shadow-hover:
						0 28px 65px rgba(58, 52, 46, .22);

					--hc-radius: 18px;

					--hc-ease:
						cubic-bezier(.22, .61, .36, 1);
				}


				/* =========================================================
   BASIC
   ========================================================= */

				* {
					box-sizing: border-box;
				}

				html {
					scroll-behavior: smooth;
				}

				body {

					margin: 0;

					font-family: 'Poppins', sans-serif;

					color: var(--hc-charcoal);

					background:

						radial-gradient(circle at 8% 10%,
							rgba(193, 101, 47, .10),
							transparent 35%),

						radial-gradient(circle at 92% 20%,
							rgba(124, 148, 115, .10),
							transparent 38%),

						radial-gradient(circle at 50% 100%,
							rgba(217, 164, 65, .12),
							transparent 40%),

						var(--hc-cream);

					overflow-x: hidden;
				}


				/* =========================================================
   TOP NAVBAR
   ========================================================= */

				.hc-topbar {

					position: sticky;

					top: 0;

					z-index: 1000;

					min-height: 72px;

					padding: 0 34px;

					display: flex;

					align-items: center;

					justify-content: space-between;

					color: white;

					background:

						linear-gradient(115deg,
							#28231F,
							#3A342E 50%,
							#4A4035);

					border-bottom:
						2px solid rgba(217, 164, 65, .7);

					box-shadow:
						0 8px 28px rgba(0, 0, 0, .18);
				}


				/* Brand */

				.hc-topbar .hc-brand {

					font-family:
						'Playfair Display',
						serif;

					font-size:
						1.55rem;

					font-weight:
						700;

					letter-spacing:
						.2px;

					display:
						flex;

					align-items:
						center;

					gap:
						10px;

					color:
						#FFFDFB;

					transition:
						transform .3s ease,
						color .3s ease;
				}

				.hc-topbar .hc-brand:hover {

					transform:
						translateY(-2px);

					color:
						var(--hc-gold-light);
				}


				/* User */

				.hc-topbar .hc-user-info {

					display:
						flex;

					align-items:
						center;

					gap:
						14px;

					font-size:
						.85rem;

					color:
						rgba(255, 255, 255, .82);
				}


				/* Logout */

				.hc-topbar .btn-hc-logout {

					border:
						none;

					border-radius:
						30px;

					padding:
						8px 20px;

					font-size:
						.78rem;

					font-weight:
						600;

					color:
						var(--hc-dark);

					background:
						linear-gradient(120deg,
							var(--hc-gold-light),
							var(--hc-gold),
							var(--hc-terracotta));

					box-shadow:
						0 8px 20px rgba(217, 164, 65, .22);

					transition:
						transform .3s var(--hc-ease),
						box-shadow .3s ease;
				}

				.hc-topbar .btn-hc-logout:hover {

					transform:
						translateY(-3px);

					box-shadow:
						0 14px 28px rgba(217, 164, 65, .38);

					color:
						var(--hc-dark);
				}


				/* =========================================================
   MAIN CONTAINER
   ========================================================= */

				.container {

					max-width:
						1240px;

					background:
						rgba(255, 253, 251, .88);

					border:
						1px solid rgba(255, 255, 255, .85);

					border-radius:
						24px;

					padding:
						32px;

					margin-top:
						30px;

					margin-bottom:
						30px;

					box-shadow:
						0 20px 55px rgba(58, 52, 46, .09);

					backdrop-filter:
						blur(8px);
				}


				/* =========================================================
   HERO / PRODUCT LIST HEADER
   ========================================================= */

				.hc-jumbotron {

					position:
						relative;

					overflow:
						hidden;

					min-height:
						255px;

					display:
						flex;

					flex-direction:
						column;

					align-items:
						center;

					justify-content:
						center;

					margin:
						0 0 34px;

					padding:
						48px 25px !important;

					color:
						white;

					border-radius:
						22px;

					background:

						linear-gradient(125deg,
							rgba(40, 35, 31, .97),
							rgba(58, 52, 46, .94),
							rgba(72, 59, 46, .92));

					box-shadow:
						0 22px 50px rgba(58, 52, 46, .22);
				}


				/* Decorative circles */

				.hc-jumbotron::before {

					content:
						"";

					position:
						absolute;

					width:
						360px;

					height:
						360px;

					right:
						-130px;

					top:
						-190px;

					border-radius:
						50%;

					background:
						radial-gradient(circle,
							rgba(217, 164, 65, .24),
							transparent 68%);
				}


				.hc-jumbotron::after {

					content:
						"";

					position:
						absolute;

					width:
						260px;

					height:
						260px;

					left:
						-120px;

					bottom:
						-160px;

					border-radius:
						50%;

					background:
						radial-gradient(circle,
							rgba(193, 101, 47, .22),
							transparent 68%);
				}


				/* Badge */

				.hc-jumbotron .badge-hc {

					position:
						relative;

					z-index:
						2;

					background:
						rgba(255, 255, 255, .05);

					border:
						1px solid rgba(255, 255, 255, .25);

					color:
						var(--hc-gold-light);

					font-size:
						.68rem;

					letter-spacing:
						2.5px;

					text-transform:
						uppercase;

					padding:
						8px 17px;

					display:
						inline-flex;

					align-items:
						center;

					gap:
						9px;

					border-radius:
						40px;

					box-shadow:
						0 8px 25px rgba(0, 0, 0, .12);
				}


				/* Live dot */

				.hc-live-dot {

					width:
						7px;

					height:
						7px;

					border-radius:
						50%;

					background:
						#9BB28E;

					box-shadow:
						0 0 0 4px rgba(124, 148, 115, .13);

					animation:
						hcPulseDot 2s infinite;
				}


				@keyframes hcPulseDot {

					0% {
						box-shadow:
							0 0 0 0 rgba(124, 148, 115, .55);
					}

					70% {
						box-shadow:
							0 0 0 9px rgba(124, 148, 115, 0);
					}

					100% {
						box-shadow:
							0 0 0 0 rgba(124, 148, 115, 0);
					}
				}


				/* Main heading */

				.hc-jumbotron h1 {

					position:
						relative;

					z-index:
						2;

					margin:
						12px 0 8px;

					font-family:
						'Playfair Display',
						serif;

					font-weight:
						700;

					font-size:
						clamp(2.5rem, 5vw, 4rem);

					letter-spacing:
						-1.5px;

					color:
						#FFFDFB;

					text-shadow:
						0 8px 25px rgba(0, 0, 0, .25);
				}


				/* subtitle */

				.hc-jumbotron .lead {

					position:
						relative;

					z-index:
						2;

					color:
						rgba(255, 255, 255, .68);

					font-size:
						.95rem;

					letter-spacing:
						.2px;
				}


				/* =========================================================
   ADD PRODUCT
   ========================================================= */

				.btn-hc-add {

					border:
						none;

					border-radius:
						30px;

					padding:
						11px 24px;

					font-size:
						.84rem;

					font-weight:
						600;

					color:
						white;

					background:
						linear-gradient(120deg,
							var(--hc-sage),
							#62795A);

					box-shadow:
						0 10px 24px rgba(124, 148, 115, .25);

					transition:
						transform .3s var(--hc-ease),
						box-shadow .3s ease;
				}

				.btn-hc-add:hover {

					transform:
						translateY(-4px);

					box-shadow:
						0 17px 32px rgba(124, 148, 115, .38);

					color:
						white;
				}


				/* =========================================================
   PRODUCT GRID
   ========================================================= */

				.container>.row {

					margin-left:
						-10px;

					margin-right:
						-10px;
				}


				.container>.row>[class*="col-"] {

					padding-left:
						10px;

					padding-right:
						10px;

					margin-bottom:
						22px !important;
				}


				/* =========================================================
   PRODUCT CARD
   ========================================================= */

				.card.hc-product-card {

					position:
						relative;

					width:
						100%;

					height:
						100%;

					display:
						flex;

					flex-direction:
						column;

					overflow:
						hidden;

					border:
						1px solid var(--hc-border);

					border-radius:
						var(--hc-radius);

					background:
						#FFFDFB;

					box-shadow:
						var(--hc-shadow);

					transform:
						translateY(0);

					transition:
						transform .42s var(--hc-ease),
						box-shadow .42s var(--hc-ease),
						border-color .35s ease;

					/* Important:
       No opacity change.
       No blur of other cards.
       No grid hover effect.
    */
				}


				/* Premium top border */

				.card.hc-product-card::before {

					content:
						"";

					position:
						absolute;

					top:
						0;

					left:
						18%;

					width:
						64%;

					height:
						2px;

					border-radius:
						0 0 10px 10px;

					background:
						linear-gradient(90deg,
							transparent,
							var(--hc-gold),
							var(--hc-terracotta),
							transparent);

					opacity:
						.45;

					z-index:
						5;

					transition:
						left .4s ease,
						width .4s ease,
						opacity .4s ease;
				}


				/* CARD HOVER */

				.card.hc-product-card:hover {

					transform:
						translateY(-12px);

					box-shadow:
						var(--hc-shadow-hover);

					border-color:
						rgba(217, 164, 65, .32);
				}


				.card.hc-product-card:hover::before {

					left:
						8%;

					width:
						84%;

					opacity:
						1;
				}


				/* =========================================================
   IMAGE SECTION
   ========================================================= */

				.hc-img-wrap {

					position:
						relative;

					height:
						220px;

					flex-shrink:
						0;

					overflow:
						hidden;

					background:
						#EFE4D7;

					border-bottom:
						1px solid rgba(58, 52, 46, .07);
				}


				/* Image */

				.hc-img-wrap img {

					width:
						100%;

					height:
						100%;

					object-fit:
						cover;

					transition:
						transform .65s var(--hc-ease),
						filter .45s ease;
				}


				/* Image hover
   No white light overlay */
				.card.hc-product-card:hover .hc-img-wrap img {

					transform:
						scale(1.07);

					filter:
						saturate(1.05) contrast(1.02);
				}


				/* Image bottom fade */

				.hc-img-wrap::after {

					content:
						"";

					position:
						absolute;

					left:
						0;

					right:
						0;

					bottom:
						0;

					height:
						55px;

					pointer-events:
						none;

					background:
						linear-gradient(to top,
							rgba(0, 0, 0, .10),
							transparent);
				}


				/* =========================================================
   PRICE BOX
   THIS IS THE PART YOU ASKED FOR
   ========================================================= */

				.badge-hc-price {

					position:
						absolute;

					top:
						13px;

					right:
						13px;

					z-index:
						3;

					min-width:
						88px;

					padding:
						8px 14px;

					text-align:
						center;

					border-radius:
						10px;

					color:
						#FFFDFB;

					font-size:
						.88rem;

					font-weight:
						600;

					background:
						rgba(58, 52, 46, .92);

					border:
						1px solid rgba(255, 255, 255, .22);

					box-shadow:
						0 8px 22px rgba(0, 0, 0, .25);

					backdrop-filter:
						blur(7px);

					transition:
						transform .35s var(--hc-ease),
						background .35s ease,
						box-shadow .35s ease;
				}


				.card.hc-product-card:hover .badge-hc-price {

					transform:
						translateY(-3px);

					background:
						linear-gradient(120deg,
							var(--hc-gold),
							var(--hc-terracotta));

					color:
						var(--hc-dark);

					box-shadow:
						0 12px 25px rgba(217, 164, 65, .32);
				}


				/* =========================================================
   PRICE PANEL BELOW IMAGE
   ========================================================= */

				.hc-price-panel {

					display:
						flex;

					align-items:
						center;

					justify-content:
						space-between;

					min-height:
						55px;

					padding:
						10px 17px;

					background:
						linear-gradient(135deg,
							#F7EFE5,
							#FFFDFB);

					border-bottom:
						1px solid #EDE1D3;
				}


				/* Price label */

				.hc-price-label {

					font-size:
						.64rem;

					font-weight:
						600;

					letter-spacing:
						1.5px;

					text-transform:
						uppercase;

					color:
						#9A8D7E;
				}


				/* Main price */

				.hc-price-value {

					font-family:
						'Playfair Display',
						serif;

					font-size:
						1.18rem;

					font-weight:
						700;

					color:
						var(--hc-terracotta);
				}


				/* =========================================================
   CARD BODY
   ========================================================= */

				.hc-product-card .card-body {

					flex:
						1 1 auto;

					padding:
						20px 18px 17px;

					background:
						#FFFDFB;
				}


				/* Product title */

				.hc-product-card .card-title {

					margin:
						0 0 9px;

					font-family:
						'Playfair Display',
						serif;

					font-size:
						1.18rem;

					font-weight:
						700;

					line-height:
						1.25;

					color:
						var(--hc-charcoal);

					transition:
						color .3s ease;
				}


				.card.hc-product-card:hover .card-title {

					color:
						var(--hc-terracotta);
				}


				/* Description */

				.hc-product-card .card-text {

					margin:
						0;

					color:
						#8A7E70;

					font-size:
						.78rem;

					line-height:
						1.65;

					min-height:
						25px;
				}


				/* =========================================================
   RATING
   ========================================================= */

				.hc-rating {

					display:
						flex;

					align-items:
						center;

					gap:
						8px;

					margin-top:
						13px;

					padding-top:
						12px;

					border-top:
						1px solid #F0E7DC;
				}


				.hc-rating-stars {

					color:
						var(--hc-gold);

					font-size:
						.78rem;

					letter-spacing:
						1px;

					line-height:
						1;
				}


				.hc-rating-number {

					color:
						#776B5E;

					font-size:
						.72rem;

					font-weight:
						500;
				}


				/* =========================================================
   CARD FOOTER
   ========================================================= */

				.hc-product-card .card-footer {

					flex-shrink:
						0;

					padding:
						14px 15px;

					background:
						#FBF6EF;

					border-top:
						1px solid #EDE1D3;

					display:
						flex;

					align-items:
						center;

					gap:
						9px;
				}


				/* =========================================================
   QUANTITY
   ========================================================= */

				.hc-qty-input {

					width:
						55px !important;

					height:
						39px;

					border:
						1px solid #DCCDBB !important;

					border-radius:
						10px !important;

					background:
						#FFFDFB !important;

					color:
						var(--hc-charcoal);

					font-size:
						.78rem;

					font-weight:
						600;

					text-align:
						center;

					box-shadow:
						inset 0 1px 4px rgba(58, 52, 46, .04);

					transition:
						border-color .25s ease,
						box-shadow .25s ease;
				}


				.hc-qty-input:focus {

					outline:
						none;

					border-color:
						var(--hc-gold) !important;

					box-shadow:
						0 0 0 3px rgba(217, 164, 65, .12) !important;
				}


				/* =========================================================
   ADD TO CART
   ========================================================= */

				.btn-hc-cart {

					flex:
						1;

					height:
						39px;

					border:
						none;

					border-radius:
						11px;

					padding:
						6px 14px;

					font-size:
						.76rem;

					font-weight:
						600;

					color:
						#FFFDFB;

					background:
						linear-gradient(120deg,
							var(--hc-terracotta),
							#A94F28);

					box-shadow:
						0 8px 18px rgba(193, 101, 47, .22);

					transition:
						transform .3s var(--hc-ease),
						box-shadow .3s ease,
						background .3s ease;
				}


				.btn-hc-cart:hover {

					transform:
						translateY(-3px);

					background:
						linear-gradient(120deg,
							#D27842,
							var(--hc-terracotta));

					box-shadow:
						0 13px 26px rgba(193, 101, 47, .35);

					color:
						#FFFDFB;
				}


				/* =========================================================
   ADMIN EDIT / DELETE
   ========================================================= */

				.btn-hc-edit,
				.btn-hc-delete {

					border:
						none;

					border-radius:
						11px;

					padding:
						8px 15px;

					font-size:
						.76rem;

					font-weight:
						600;

					transition:
						transform .3s var(--hc-ease),
						box-shadow .3s ease;
				}


				.btn-hc-edit {

					color:
						#5C4415;

					background:
						linear-gradient(120deg,
							#F4D79A,
							var(--hc-gold));

					box-shadow:
						0 7px 16px rgba(217, 164, 65, .18);
				}


				.btn-hc-edit:hover {

					transform:
						translateY(-3px);

					box-shadow:
						0 12px 24px rgba(217, 164, 65, .32);

					color:
						#5C4415;
				}


				.btn-hc-delete {

					color:
						white;

					background:
						linear-gradient(120deg,
							#D96E61,
							#B84438);

					box-shadow:
						0 7px 16px rgba(178, 58, 46, .18);
				}


				.btn-hc-delete:hover {

					transform:
						translateY(-3px);

					box-shadow:
						0 12px 24px rgba(178, 58, 46, .30);

					color:
						white;
				}


				/* =========================================================
   VIEW CART
   ========================================================= */

				.btn-hc-viewcart {

					border:
						none;

					border-radius:
						30px;

					padding:
						12px 28px;

					font-size:
						.82rem;

					font-weight:
						600;

					color:
						white;

					background:
						linear-gradient(120deg,
							var(--hc-sage),
							#62795A);

					box-shadow:
						0 10px 24px rgba(124, 148, 115, .25);

					transition:
						transform .3s var(--hc-ease),
						box-shadow .3s ease;
				}


				.btn-hc-viewcart:hover {

					transform:
						translateY(-4px);

					box-shadow:
						0 16px 32px rgba(124, 148, 115, .38);

					color:
						white;
				}


				/* =========================================================
   FOOTER
   ========================================================= */

				.hc-footer-strip {

					padding:
						28px 15px;

					text-align:
						center;

					color:
						#8A7E71;

					font-size:
						.78rem;

					letter-spacing:
						.3px;
				}


				/* =========================================================
   PRODUCT CARD ENTRANCE ANIMATION
   ========================================================= */

				.hc-product-card {

					opacity:
						0;

					transform:
						translateY(25px);
				}


				/* JS adds this */

				.hc-product-card.hc-visible {

					opacity:
						1;

					transform:
						translateY(0);
				}


				/* Keep hover working after reveal */

				.hc-product-card.hc-visible:hover {

					transform:
						translateY(-12px);
				}


				/* =========================================================
   DESKTOP — 3 PREMIUM CARDS PER ROW
   ========================================================= */

				@media (min-width: 992px) {

					.container>.row>.col-md-4 {

						flex:
							0 0 33.333333%;

						max-width:
							33.333333%;
					}

					.hc-img-wrap {

						height:
							225px;
					}
				}


				/* =========================================================
   TABLET
   ========================================================= */

				@media (max-width: 991px) {

					.container {

						margin-left:
							15px;

						margin-right:
							15px;

						width:
							auto;

						padding:
							24px;
					}

					.hc-img-wrap {

						height:
							210px;
					}
				}


				/* =========================================================
   MOBILE
   ========================================================= */

				@media (max-width: 767px) {

					.hc-topbar {

						min-height:
							64px;

						padding:
							0 17px;
					}

					.hc-topbar .hc-brand {

						font-size:
							1.25rem;
					}

					.hc-topbar .hc-user-info {

						gap:
							8px;

						font-size:
							.7rem;
					}

					.hc-topbar .btn-hc-logout {

						padding:
							7px 12px;

						font-size:
							.68rem;
					}

					.container {

						margin:
							15px 10px;

						padding:
							15px;

						border-radius:
							18px;
					}

					.hc-jumbotron {
					    background: #fff;
					    border: 1px solid #e8e1d8;
					    border-radius: 22px;
					    padding: 42px 25px;
					    margin-bottom: 40px;
					    box-shadow: 0 10px 30px rgba(40, 30, 20, 0.07);
					}

					.hc-jumbotron h1 {
					    color: #2f2924;
					    font-family: "Playfair Display", serif;
					    font-weight: 600;
					    margin-top: 16px;
					    margin-bottom: 10px;
					}

					.hc-jumbotron .lead {
					    color: #777067;
					    font-size: 16px;
					}

					.hc-img-wrap {

						height:
							235px;
					}

					.hc-product-card .card-body {

						padding:
							18px 17px;
					}

					.hc-product-card .card-footer {

						padding:
							13px;
					}
				}


				/* =========================================================
   SMALL MOBILE
   ========================================================= */

				@media (max-width: 430px) {

					.hc-topbar .hc-user-info span {

						display:
							none;
					}

					.hc-jumbotron h1 {

						font-size:
							2.2rem;
					}

					.hc-img-wrap {

						height:
							220px;
					}

					.hc-price-panel {

						padding:
							9px 14px;
					}

					.btn-hc-cart {

						font-size:
							.72rem;
					}
				}


				/* =========================================================
   REDUCE MOTION
   ========================================================= */

				@media (prefers-reduced-motion: reduce) {

					*,
					*::before,
					*::after {

						animation-duration:
							.01ms !important;

						animation-iteration-count:
							1 !important;

						scroll-behavior:
							auto !important;

						transition-duration:
							.01ms !important;
					}
				}

				/* Premium HomeCraft Cursor */
				html,
				body {
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
						0 0 8px rgba(217, 164, 65, .95),
						0 0 18px rgba(217, 164, 65, .65),
						0 0 32px rgba(217, 164, 65, .35);
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
					border: 1px solid rgba(217, 164, 65, .65);
					box-shadow: 0 0 15px rgba(217, 164, 65, .22);
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
					background: radial-gradient(circle,
							#FFFDFB 0%,
							#D9A441 60%,
							transparent 75%);
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


			<!-- =====================================================
     TOP BAR
     ===================================================== -->

			<div class="hc-topbar">

				<div class="hc-brand">
					&#127968; HomeCraft
				</div>


				<c:if test="${loggedInUser != null}">

					<div class="hc-user-info">

						<span>
							Welcome, ${loggedInUser.username}!
						</span>

						<a href="/logout" class="btn btn-hc-logout">
							Sign Out
						</a>

					</div>

				</c:if>

			</div>



			<!-- =====================================================
     MAIN
     ===================================================== -->

			<div class="container">


				<!-- =================================================
         PRODUCT HEADER
         ================================================= -->

		 <div class="jumbotron hc-jumbotron text-center">

		     <span class="badge-hc badge">
		         <span class="hc-live-dot"></span>
		         HomeCraft Collection
		     </span>

		     <h1 class="display-4">
		         Our Furniture
		     </h1>

		     <p class="lead mb-0">
		         Designed for comfort. Made for your home.
		     </p>

		 </div>



				<!-- =================================================
         ADMIN ADD PRODUCT
         ================================================= -->

				<c:if test="${loggedInUser.role == 'ADMIN'}">

					<a href="/products/add" class="btn btn-hc-add mb-4">

						+ Add New Product

					</a>

				</c:if>



				<!-- =================================================
         PRODUCT GRID
         ================================================= -->

				<div class="row" id="hcProductGrid">


					<c:forEach var="product" items="${products}">


						<div class="col-md-4 mb-4">


							<div class="card hc-product-card h-100">


								<!-- =================================
                         PRODUCT IMAGE
                         ================================= -->

								<div class="hc-img-wrap">

									<img src="${product.imagePath}" class="card-img-top" alt="${product.name}">


									<!-- Top floating price -->

									<span class="badge-hc-price">

										&#8377;${product.price}

									</span>

								</div>



								<!-- =================================
                         SEPARATE PRICE LAYER
                         ================================= -->

								<div class="hc-price-panel">

									<span class="hc-price-label">
										Price
									</span>

									<span class="hc-price-value">
										&#8377;${product.price}
									</span>

								</div>



								<!-- =================================
                         PRODUCT INFORMATION
                         ================================= -->

								<div class="card-body">

									<h5 class="card-title">
										${product.name}
									</h5>


									<p class="card-text text-truncate">
										${product.description}
									</p>


									<!-- Rating -->

									<div class="hc-rating">

										<span class="hc-rating-stars">
											&#9733;&#9733;&#9733;&#9733;&#9733;
										</span>

										<span class="hc-rating-number">
											4.8
										</span>

									</div>

								</div>



								<!-- =================================
                         BOTTOM ACTION LAYER
                         ================================= -->

								<div class="card-footer">


									<!-- USER -->

									<c:if test="${loggedInUser.role != 'ADMIN'}">


										<form action="/cart/add" method="post" class="form-inline w-100">


											<input type="hidden" name="productId" value="${product.id}">


											<input type="number" name="quantity" value="1" min="1"
												class="form-control form-control-sm hc-qty-input mr-2">


											<button type="submit" class="btn btn-hc-cart">

												Add to Cart

											</button>


										</form>


									</c:if>



									<!-- ADMIN -->

									<c:if test="${loggedInUser.role == 'ADMIN'}">


										<a href="/products/edit/${product.id}" class="btn btn-hc-edit">

											&#9998; Edit

										</a>


										<a href="/products/delete/${product.id}" class="btn btn-hc-delete">

											&#128465; Delete

										</a>


									</c:if>


								</div>


							</div>


						</div>


					</c:forEach>


				</div>



				<!-- =================================================
         VIEW CART
         ================================================= -->

				<c:if test="${loggedInUser.role != 'ADMIN'}">

					<div class="text-right mb-4">

						<a href="/cart" class="btn btn-hc-viewcart">

							View Cart

						</a>

					</div>

				</c:if>


			</div>



			<!-- =====================================================
     FOOTER
     ===================================================== -->

			<div class="hc-footer-strip">

				&copy; HomeCraft &mdash;
				Online Home &amp; Lifestyle Shopping Platform

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


			<!-- =====================================================
     CARD REVEAL
     ===================================================== -->

			<script>

				var cards =
					document.querySelectorAll('.hc-product-card');


				var observer =
					new IntersectionObserver(

						function (entries) {

							entries.forEach(

								function (entry, index) {

									if (entry.isIntersecting) {

										setTimeout(

											function () {

												entry.target
													.classList
													.add('hc-visible');

											},

											index * 70
										);


										observer.unobserve(
											entry.target
										);

									}

								}

							);

						},

						{
							threshold: 0.12
						}

					);


				cards.forEach(

					function (card) {

						observer.observe(card);

					}

				);

			</script>


		</body>

		</html>