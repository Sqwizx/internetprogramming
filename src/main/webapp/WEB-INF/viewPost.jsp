<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Post</title>
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
			<h2>${post.title}</h2>
		</div>

		<div class="row">
			<div class="leftcolumn">
				<div class="card">
					<h5>Last accessed, ${post.lastPost}</h5>
					<p style="white-space: pre-line;">${post.content}</p>
				</div>
			</div>
			<div class="rightcolumn">
				<div class="card">
					<h3>Author</h3>
					<p>${post.author}</p>
				</div>
				<div class="card">
					<h3>View Count</h3>
					<p>${post.viewCount}</p>
				</div>
			</div>
		</div>
	</div>
</body>
<style>
body {
	background-color: #e3e3e3;
	font-family: 'Inter Tight', sans-serif;
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

.header {
	padding: 30px;
	font-size: 40px;
	text-align: center;
	background: white;
	border-radius: 13px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
}

.leftcolumn {
	float: left;
	width: 75%;
	text-align: left;
}

.rightcolumn {
	float: right;
	width: 25%;
	padding-left: 20px;
}

.card {
	background-color: white;
	border-radius: 13px;
	padding: 35px;
	margin-top: 20px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
}

.row:after {
	content: "";
	display: table;
	clear: both;
}

* {
	box-sizing: border-box;
}
</style>
</html>