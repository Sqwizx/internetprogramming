<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Emergency Response</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Inter+Tight:wght@800&family=Roboto:wght@300;400&display=swap"
	rel="stylesheet">
<%@ page import="com.model.User"%>
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
			<h1>Emergency Response</h1>
		</div>
		<c:set var="user" value="${sessionScope.user}" />
		<c:set var="userCity" value="${not empty user ? user.city : ''}" />
		<c:choose>
			<c:when test="${userCity eq 'Selangor'}">
				<jsp:include page="SelangorHospital.jsp" />
			</c:when>
			<c:when test="${userCity eq 'Johor'}">
				<jsp:include page="JohorHospital.jsp" />
			</c:when>
			<c:when test="${userCity eq 'Kelantan'}">
				<jsp:include page="KelantanHospital.jsp" />
			</c:when>
			<c:otherwise>
				<p>City information not available</p>
			</c:otherwise>
		</c:choose>
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

button {
	width: 140px;
	font-size: 13px;
	color: #142d4c;
	text-align: center;
	background: #ffffff;
	padding-top: 50px;
	padding-bottom: 50px;
	margin: 5px;
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
</style>
</html>