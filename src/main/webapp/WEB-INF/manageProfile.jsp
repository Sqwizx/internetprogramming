<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="manageprofilestyle.css" />
<title>Profile</title>
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
		<div class="box">
			<div class="header">
				<img
					src="https://akcdn.detik.net.id/community/media/visual/2022/09/23/kylian-mbappe.jpeg?w=700&q=90"
					alt="profile photo">
			</div>
			<h4>My Profile</h4>
			<p style="color: #1f6f78;">${message}</p>
			<form action="saveChanges" method="post">
				<div class="grid">
					<input type="text" name="first_name" value="${user.first_name}">
					<input type="text" name="last_name" value="${user.last_name}">
					<input type="text" name="email" value="${user.email}">
					<textarea rows="2" name="address">${user.address}</textarea>
				</div>
				<button type="submit">Save Changes</button>
			</form>
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
	margin-left: 595px;
	margin-right: 595px;
	margin-top: 55px;
	margin-bottom: 55px;
	display: flex;
	justify-content: space-evenly;
}

.box {
	width: auto;
	padding: 30px 40px 30px 40px;
	background-color: white;
	border-radius: 16px;
	box-shadow: 0 6px 8px 1px rgba(0, 0, 0, 0.19);
}

img {
	width: 200px;
	height: 200px;
	border-radius: 50%;
	object-fit: cover;
	box-shadow: 0 6px 8px 1px rgba(0, 0, 0, 0.19);
}

input {
	width: 300px;
	color: #142d4c;
	margin-bottom: 10px;
	background: #ffffff;
	border: none;
	outline: none;
	padding: 10px;
	font-size: 13px;
	border: 1px solid rgba(0, 0, 0, 0.3);
	border-radius: 4px;
}

input:focus {
	color: #142d4c;
	background-color: #edf7fa;
	background-position: 0 -15px;
}

textarea {
	width: 300px;
	color: #142d4c;
	margin-bottom: 10px;
	background: #ffffff;
	border: none;
	outline: none;
	padding: 10px;
	font-size: 13px;
	border: 1px solid rgba(0, 0, 0, 0.3);
	border-radius: 4px;
}

textarea:focus {
	color: #142d4c;
	background-color: #edf7fa;
	background-position: 0 -15px;
}

::placeholder {
	color: grey;
}

.grid {
	display: grid;
	gap: 6px 10px;
	grid-template-columns: auto auto;
}

button {
	margin-top: 10px;
	font-size: 13px;
	color: #142d4c;
	text-align: center;
	width: 30%;
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
