<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="icon" type="image/x-icon"
	href="https://www.linkpicture.com/q/logo_527.png">
<link
	href="https://fonts.googleapis.com/css2?family=Inter+Tight&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="login">
		<img src="https://www.linkpicture.com/q/logo_527.png">
		<h1>Sign In</h1>
		<h4>Sign in to use our health services</h4>
		<form action="login" method="post">
			<p style="color: #1f6f78;">${message}</p>
			<p style="color: #DC143C;">${error}</p>
			<input type="text" name="username" placeholder="Username"
				required="required" /> <input type="password" name="password"
				placeholder="Password" required="required" />
			<button class="btn" type="submit" value="Login">Login</button>
			<p style="color: black;">
				Don't have an account yet? <a href="registerForm">Register</a>
			</p>
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
	top: 47%;
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