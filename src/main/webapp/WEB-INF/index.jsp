<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<c:choose>
	<c:when test="${user.role == 'admin'}">
		<%@ include file="adminNavbar.html"%>
	</c:when>
	<c:otherwise>
		<%@ include file="navbar.html"%>
	</c:otherwise>
</c:choose>
<link
	href="https://fonts.googleapis.com/css2?family=Inter+Tight:wght@800&family=Roboto:wght@300;400&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="crop">
		<img src="https://i.ibb.co/0n3QzZm/header.jpg" alt="Rocket Healthcare">
	</div>
	<div class="container">
		<div class="header">
			<h2>One Stop Health Solution</h2>
			<p>
				Consult with your doctor simply, buy medicine easily, take
				medication regularly,<br>get a quick emergency response,
				measure your BMI and stress level, all can be done with us!
			</p>
		</div>
		<div class="grid">
			<a href="consultationBooking">
				<button>
					Online<br>Consultation
				</button>
			</a> <a href="medicineEcommerce">
				<button>
					Medicine<br>E-Commerce
				</button>
			</a> <a href="medicineDelivery">
				<button>
					Medicine<br>Delivery Service
				</button>
			</a> <a href="emergencyResponse">
				<button>
					Emergency<br>Response
				</button>
			</a> <a href="bmiCalculator">
				<button>
					BMI<br>Calculator
				</button>
			</a> <a href=stressChecker>
				<button>
					Stress Level<br>Checker
				</button>
			</a> <a href="medicineSchedule">
				<button>
					Medicine<br>Intake Schedule
				</button>
			</a>
		</div>
	</div>
</body>
<style>
.crop {
	width: 100%;
	overflow: hidden;
}

.crop img {
	width: 100%;
	height: 450px;
	margin: -100px 0 -100px 0;
}

body {
	background: url("https://i.ibb.co/TMmb3mx/bg.png");
	background-color: #e3e3e3;
	font-family: 'Inter Tight', sans-serif;
	background-size: 100%;
}

* {
	box-sizing: border-box;
}

h2 {
	font-size: 30px;
	letter-spacing: 1px;
}

.header {
	color: #142d4c;
	line-height: 1.6;
	padding-bottom: 20px;
}

.container {
	margin: 10 10 10 10px;
	text-align: left;
	margin-left: 95px;
	margin-right: 95px;
	margin-top: 55px;
	margin-bottom: 55px;
}

.grid {
	display: grid;
	gap: 15px 15px;
	grid-template-columns: auto auto auto 990px;
}

button {
	width: 140px;
	font-size: 13px;
	color: #142d4c;
	text-align: center;
	background: #ffffff;
	padding-top: 50px;
	padding-bottom: 50px;
	border: none;
	outline: none;
	border-radius: 16px;
	border: 1px solid rgba(0, 0, 0, 0.3);
	font-weight: 900;
}

button:hover {
	color: #333333;
	background-color: #ffff;
	background-position: 0 -15px;
	box-shadow: 0 6px 8px 1px rgba(0, 0, 0, 0.19);
}

@media only screen and (max-width: 767px) {
	.grid {
		grid-template-columns: auto;
	}
	button {
		width: 100%;
		margin-bottom: 15px;
	}
	.crop img {
		height: 300px;
		margin: -50px 0 -50px 0;
	}
}
</style>
</html>