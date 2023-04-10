<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" href="css/login_style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Inter+Tight&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="login">
		<img src="https://www.linkpicture.com/q/logo_527.png">
		<h1>Sign Up</h1>
		<h4>Sign up to use our health services</h4>
		<form action="register" method="post" enctype="multipart/form-data">
			<input type="file" name="image" accept="image/*" required="required">
			<input type="text" name="first_name" placeholder="Firstname"
				required="required" /> <input type="text" name="last_name"
				placeholder="Lastname" required="required" /> <input type="text"
				name="username" placeholder="Username" required="required" /> <input
				type="text" name="email" placeholder="Email" required="required" />
			<!-- <input type="text"
				name="phone" placeholder="Phone | +60 xxxxxxxxx" required="required" /> -->
			<input type="text" name="address" placeholder="Address"
				required="required" /> <select id="city" name=city>
				<option value="" selected disabled>Choose City...</option>
				<option value="Selangor">Selangor</option>
				<option value="Johor">Johor</option>
				<option value="Kelantan">Kelantan</option>
			</select> <input type="password" name="password" placeholder="Password"
				required="required" /> <input type="hidden" name="role"
				value="user">
			<button class="btn" type="submit" value="Login">Register</button>
		</form>
	</div>
</body>
<style>
body {
	background-color: #e3e3e3;
	font-family: 'Inter Tight', sans-serif;
	width: 20%;
	margin: auto;
	text-align: center;
}

* {
	box-sizing: border-box;
}

.login {
	position: absolute;
	top: 45%;
	left: 50%;
	margin: -240px 0 0 -150px;
	width: 300px;
	height: 300px;
}

.login h1 {
	color: #142d4c;
	letter-spacing: 3px;
}

.login h4 {
	font-size: 15px;
}

input {
	width: 100%;
	color: #e3e3e3;
	margin-bottom: 10px;
	background: #142d4c;
	border: none;
	outline: none;
	padding: 10px;
	font-size: 13px;
	border: 1px solid rgba(0, 0, 0, 0.3);
	border-radius: 4px;
	color: #e3e3e3;
}

select {
	width: 100%;
	color: #e3e3e3;
	margin-bottom: 10px;
	background: #142d4c;
	border: none;
	outline: none;
	padding: 10px;
	font-size: 13px;
	border: 1px solid rgba(0, 0, 0, 0.3);
	border-radius: 4px;
	color: #e3e3e3;
}

::placeholder {
	color: #e3e3e3;
}

.login p {
	font-size: 15px;
}

.login a {
	text-decoration: none;
}

.btn {
	margin-top: 10px;
	font-size: 13px;
	color: #142d4c;
	text-align: center;
	width: 100%;
	background: #00bbf0;
	padding: 9px;
	border: none;
	outline: none;
	border-radius: 4px;
	border: 1px solid rgba(0, 0, 0, 0.3);
	font-weight: bold;
	font-size: 13px;
}

.btn:hover {
	color: #333333;
	background-color: #b2dffb;
	background-position: 0 -15px;
}
</style>
</html>