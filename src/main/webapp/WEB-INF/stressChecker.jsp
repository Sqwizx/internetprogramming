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
			<h1>Stress Level Checker</h1>
		</div>
		<form name=stressform method="post" action="stressResult">
			<label for="gender">What's your gender?</label> <select name="gender" id="gender">
				<option value="Male">Male</option>
				<option value="Female">Female</option>
			</select> <label for="age">How old are you?</label> <select name="age" id="age">
				<option value="less than 20">Less than 20</option>
				<option value="20 - 25">20 - 25</option>
				<option value="26 - 30">26 - 30</option>
				<option value="30 - 35">30 - 35</option>
				<option value="36 - 40">36 - 40</option>
				<option value="more than 40">More than 40</option>
			</select><br> <br> <br>

			<div class="card">
				<div class="survey">
					<label>Is there a diagnosis of a health condition?</label>
				</div>
				<input type="checkbox" name="health" value="Asthma">Asthma <input
					type="checkbox" name="health" value="Diabetes">Diabetes <input
					type="checkbox" name="health" value="Heart Disease">Heart
				Disease <input type="checkbox" name="health" value="Obesity">Obesity
			</div>

			<div class="card">
				<div class="survey">
					<label>Feeling upset because something happens unexpectedly?</label>
				</div>
				<input type="radio" name="q1" value="Never">Never <input
					type="radio" name="q1" value="Seldom">Seldom <input
					type="radio" name="q1" value="Sometime">Sometime <input
					type="radio" name="q1" value="Often">Often
			</div>

			<div class="card">
				<div class="survey">
					<label>Feeling out of control over the important things in
						your life?</label>
				</div>
				<input type="radio" name="q2" value="Never">Never <input
					type="radio" name="q2" value="Seldom">Seldom <input
					type="radio" name="q2" value="Sometime">Sometime <input
					type="radio" name="q2" value="Often">Often
			</div>

			<div class="card">
				<div class="survey">
					<label>Feeling restless and stressed?</label>
				</div>
				<input type="radio" name="q3" value="Never">Never <input
					type="radio" name="q3" value="Seldom">Seldom <input
					type="radio" name="q3" value="Sometime">Sometime <input
					type="radio" name="q3" value="Often">Often
			</div>

			<div class="card">
				<div class="survey">
					<label>Feeling confident that everything is going your way?</label>
				</div>
				<input type="radio" name="q4" value="Never">Never <input
					type="radio" name="q4" value="Seldom">Seldom <input
					type="radio" name="q4" value="Sometime">Sometime <input
					type="radio" name="q4" value="Often">Often
			</div>

			<div class="card">
				<div class="survey">
					<label>Able to control the things that interfere in your
						life?</label>
				</div>
				<input type="radio" name="q5" value="Never">Never <input
					type="radio" name="q5" value="Seldom">Seldom <input
					type="radio" name="q5" value="Sometime">Sometime <input
					type="radio" name="q5" value="Often">Often
			</div>

			<div class="card">
				<div class="survey">
					<label>Feeling in control of things in your life?</label>
				</div>
				<input type="radio" name="q6" value="Never">Never <input
					type="radio" name="q6" value="Seldom">Seldom <input
					type="radio" name="q6" value="Sometime">Sometime <input
					type="radio" name="q6" value="Often">Often
			</div>

			<div class="card">
				<div class="survey">
					<label>Feeling angry because things are happening outside
						of your control?</label>
				</div>
				<input type="radio" name="q7" value="Never">Never <input
					type="radio" name="q7" value="Seldom">Seldom <input
					type="radio" name="q7" value="Sometime">Sometime <input
					type="radio" name="q7" value="Often">Often
			</div>

			<div class="card">
				<div class="survey">
					<label>Feel that your difficulties are so much that you are
						unable to overcome them?</label>
				</div>
				<input type="radio" name="q8" value="Never">Never <input
					type="radio" name="q8" value="Seldom">Seldom <input
					type="radio" name="q8" value="Sometime">Sometime <input
					type="radio" name="q8" value="Often">Often
			</div>
			<button class="btn" type="submit" value="result">See Result</button>
		</form>
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

h1 {
	font-size: 30px;
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
	border-radius: 6px;
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
</style>
</html>