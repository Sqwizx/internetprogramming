<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BMI Calculator</title>
<link
	href="https://fonts.googleapis.com/css2?family=Inter+Tight:wght@800&family=Roboto:wght@300;400&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<c:choose>
	<c:when test="${user.role == 'admin'}">
		<%@ include file="adminNavbar.html"%>
	</c:when>
	<c:otherwise>
		<%@ include file="navbar.html"%>
	</c:otherwise>
</c:choose>
</head>
<body>
	<div class="container">
		<div class="header">
			<h1>BMI Calculator</h1>
		</div>
		<form name=BMICal method="post" action="bmiResult">

			<input type="text" name="name" placeholder="Name"> <br>
			<input type="text" name="age" placeholder="Age"> <br> <input
				type="text" name="height" placeholder="Height (cm)"><br>
			<input type="text" name="weight" placeholder="Weight (kg)"> <br>
			<input type="text" name="username" placeholder="${user.username}">

			<div class="center">
				<input class="btn" name="bmical" type="submit" placeholder="Calculate BMI">
			</div>
		</form>
	</div>
</body>
<style>
body {
	background-color: #e3e3e3;
	font-family: 'Inter Tight', sans-serif;
}

.header {
	color: #142d4c;
	line-height: 1.6;
	padding-bottom: 20px;
}

h1 {
	font-size: 30px;
	letter-spacing: 1px;
}

.container {
	margin: 10 10 10 10px;
	text-align: center;
	margin-left: 95px;
	margin-right: 95px;
	margin-top: 55px;
	margin-bottom: 55px;
}

.icon {
	margin: 10px 10px 10px 10px;
	padding: 50px 20px 50px 10px;
}

*, *::before, *::after {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

label {
	height: 180px;
	margin: auto;
	border-radius: 10px;
	position: relative;
	color: #00bbf0;
	transition: 0.3s;
}

.fa {
	font-size: 80px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -80%);
	cursor: pointer;
}

label>span {
	font-size: 25px;
	font-weight: 500;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, 80%);
}

input[type="radio"] {
	margin: 0;
	padding: 0;
	-webkit-appearance: none;
	-moz-appearance: none;
}

input[type="radio"]:checked+label {
	background-color: #00bbf0;
	color: #ffffff;
	box-shadow: 0 15px 45px rgb(24, 249, 141, 0.2);
}

input {
	width: 107px;
	color: #142d4c;
	margin-bottom: 10px;
	background: #ffffff;
	border: none;
	outline: none;
	padding: 10px;
	font-size: 13px;
	border: 1px solid rgba(0, 0, 0, 0.3);
	border-radius: 4px;
	text-align: center;
}

input:focus {
	color: #142d4c;
	background-color: #edf7fa;
	background-position: 0 -15px;
}

::placeholder {
	text-align: center;
	color: grey;
}

button {
	margin-top: 10px;
	font-size: 13px;
	color: #142d4c;
	text-align: center;
	width: 17%;
	background: #00bbf0;
	padding: 9px;
	padding-bottom: 13px;
	border: none;
	outline: none;
	border-radius: 4px;
	border: 1px solid rgba(0, 0, 0, 0.3);
	font-weight: 900;
	font-size: 13px;
}

button:hover {
	color: #333333;
	background-color: #00bbf0;
	background-position: 0 -15px;
	box-shadow: 0 6px 8px 1px rgba(0, 0, 0, 0.19);
}
.btn {
	margin-top: 10px;
	font-size: 13px;
	color: #142d4c;
	text-align: center;
	width: 10%;
	background: #00bbf0;
	padding: 9px;
	padding-bottom: 13px;
	border: none;
	outline: none;
	border-radius: 4px;
	border: 1px solid rgba(0, 0, 0, 0.3);
	font-weight: 900;
	font-size: 13px;
}
</style>
</html>