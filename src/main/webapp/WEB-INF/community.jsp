<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Community</title>
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
	<div class="container">
		<div class="header">
			<h1>Community</h1>
		</div>
		<table style="background: #5585b5; margin-bottom: 8px;">
			<tr>
				<th style="color: white;">Post</th>
				<th style="color: white; width: 10%;">View Count</th>
				<th style="color: white; width: 10%">Last Accessed</th>
				<th style="color: white; width: 10%">Actions</th>
			</tr>
		</table>

		<c:forEach items="${posts}" var="post" varStatus="loop">
			<table style="background: white; margin-bottom: 6px;">
				<tr>
					<td style="text-align: left;">
						<div class="postTitle">
							<c:out value="${post.title}" />
						</div> <br>
						<div class="postContent">
							<c:out value="${post.content.substring(0,270)}..." />
							<br>

						</div>
						<div class="postAuthor">
							Author:&nbsp;~
							<c:out value="${post.author}" />
						</div>
					</td>
					<td style="width: 10%;"><c:out value="${post.viewCount}" /></td>
					<td style="width: 10%;"><c:out value="${post.lastPost}" /></td>
					<td style="width: 10%;">
						<div class="action">
							<a style="text-decoration: none; color: white;"
								href="view/${post.id}">View</a>
						</div> <c:if test="${user.role == 'admin'}">
							<div class="action">
								<a style="text-decoration: none; color: white;"
									href="edit/${post.id}">Edit</a>
							</div>
							<div class="action">
								<a style="text-decoration: none; color: white;"
									href="delete/${post.id}">Delete</a>
							</div>
						</c:if>
					</td>
				</tr>
			</table>
		</c:forEach>
		<!-- <input type="file"> -->
		<br>
		<div class="button">
			<a style="text-decoration: none; color: black;" href="create">Add
				Post</a>
		</div>
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

table {
	margin: 0 auto;
	width: 100%;
	border-collapse: collapse;
	border-radius: 13px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
}

table:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

td {
	padding-left: 20px;
	text-align: center;
}

td:first-child {
	width: 70%;
	padding: 20px;
	text-align: center;
}

th:first-child {
	width: 70%;
	padding: 20px;
	text-align: center;
}

.postTitle {
	font-size: 20px;
	color: #142d4c;
	font-weight: bold;
}

.postContent {
	margin-top: 2px;
	line-height: normal;
}

.postAuthor {
	margin-top: 12px;
	font-style: italic;
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
	text-align: center;
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
	text-align: center;
}

textarea:focus {
	color: #142d4c;
	background-color: #edf7fa;
	background-position: 0 -15px;
}

.button {
	margin: 0 auto;
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

.button:hover {
	color: #333333;
	background-color: #00bbf0;
	background-position: 0 -15px;
	box-shadow: 0 6px 8px 1px rgba(0, 0, 0, 0.19);
}

.action {
	margin: 10px 25px 10px auto;
	font-size: 13px;
	text-align: center;
	background-color: #ff6f3c;
	padding: 3px;
	border: none;
	outline: none;
	border-radius: 6px;
	border: 1px solid rgba(0, 0, 0, 0.3);
	font-weight: 900;
	font-size: 13px;
}

.action:hover {
	background-color: #ff9a3c;
	background-position: 0 -15px;
	box-shadow: 0 6px 8px 1px rgba(0, 0, 0, 0.19);
}

* {
	box-sizing: border-box;
}
</style>
</html>