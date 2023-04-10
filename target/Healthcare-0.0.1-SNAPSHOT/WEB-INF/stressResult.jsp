<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Stress Level Checker</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Inter+Tight:wght@800&family=Roboto:wght@300;400&display=swap"
	rel="stylesheet">
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
			<h1>Stress Result</h1>
		</div>
		<div class="card">
			<p>Stress level of ${gender}&nbsp;${age}&nbsp;years</p>
			<%
			String color = "";
			String stressLevel = request.getAttribute("stressLevelResult").toString();

			if (stressLevel.equals("Low")) {
				color = "green";
			} else if (stressLevel.equals("Medium")) {
				color = "orange";
			} else {
				color = "red";
			}
			%>
			<h3 style="color:<%=color%>">${stressLevelResult}</h3>
			<h4>Total point : ${stressLevel}</h4>
			<div class="subcard">
				<p>${stressLevelAnalysis.toString()}</p>
			</div>
		</div>
	</div>

</body>
<style>
body {
	background-color: #e3e3e3;
	font-family: 'Inter Tight', sans-serif;
}

.container {
	margin: 10 10 10 10px;
	text-align: center;
	margin-left: 95px;
	margin-right: 95px;
	margin-top: 55px;
	margin-bottom: 55px;
}

.header {
	color: #142d4c;
	line-height: 1.6;
	padding-bottom: 20px;
	text-align: center;
}

p {
	margin: 0;
	letter-spacing: 1px;
	text-align: center;
}

h3 {
	letter-spacing: 1px;
	font-size: 35px;
	text-align: center;
}

h4 {
	padding-bottom: 10px;
	letter-spacing: 1px;
	text-align: center;
}

.select {
	position: relative;
	min-width: 200px;
}

select {
	-webkit-appearance: none;
	padding: 7px;
	width: 11%;
	border: 1px solid #E8EAED;
	border-radius: 5px;
	background: white;
	box-shadow: 0 1px 3px -2px #9098A9;
	cursor: pointer;
	font-family: inherit;
	font-size: 16px;
	transition: all 150ms ease;
	color: #5A667F;
	margin-right: 20px;
}

.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	margin-left: 295px;
	margin-right: 295px;
	margin-bottom: 35px;
	padding: 40px;
	border-radius: 12px;
	background-color: white;
}

.subcard {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	margin-left: 100px;
	margin-right: 100px;
	padding: 10px;
	border-radius: 12px;
	background-color: #F0F8FF;
	border-radius: 12px;
}

.card:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

.survey {
	background-color: #ffff;
	padding: 15px;
	border-radius: 6px;
	align-items: center;
	font-size: 1.125rem;
	margin-bottom: 0.5rem;
}

input[type="radio"] {
	padding: 6px;
	border-radius: 50px;
	cursor: pointer;
	transition: background .2s ease;
	margin-left: 50px;
	margin-top: 10px;
	margin-bottom: 20px;
	-webkit-tap-highlight-color: transparent;
	-webkit-tap-highlight-color: transparent;
}

input[type="checkbox"] {
	padding: 6px;
	border-radius: 50px;
	cursor: pointer;
	transition: background .2s ease;
	margin-left: 50px;
	margin-top: 10px;
	margin-bottom: 20px;
	-webkit-tap-highlight-color: transparent;
	margin-top: 10px;
	margin-bottom: 20px;
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

* {
	box-sizing: border-box;
}
</style>
</html>