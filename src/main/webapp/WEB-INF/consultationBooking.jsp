<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Consultation Booking Page</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Inter+Tight:wght@800&family=Roboto:wght@300;400&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/booking_style.css">
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
		<a href="index">
			<button style="float: left; width: 100px; text-decoration: none;">
				<i class="fa-solid fa-backward"></i>&nbsp;Back
			</button>
		</a>
		<div class="header" style="text-align: center;">
			<h1>Online Consultation Booking</h1>
		</div>

		<table class="table table-borderless"
			style="margin-left: auto; margin-right: auto; white-space: nowrap; text-align: center;">
			<tr style="padding: 0 150px; width: 28%">
				<c:forEach items="${doctorList}" var="doctor" varStatus="count">
					<td style="padding: 0 150px; width: 28%"><br>
						<p>${doctor.doctorType}</p> <br>
						<div class="doctor">
							<img
								src="https://www.sonypictures.com/sites/default/files/styles/max_360x390/public/banner-images/2020-11/thegooddoctor_banner_2572x1100.jpg?h=abc6acbe&itok=NCQnfRqo">
							<br>
							<h4>${doctor.doctorName}</h4>
							<p>${doctor.doctorLocation}</p>
							<p>RM ${doctor.doctorRate}</p>
						</div>
						<div class="schedule">
							<form action="bookingSummary" method="get">
								<br> <input type="hidden" name="doctorId"
									value="${doctor.id}">
								<button style="width: 100px" class="btn" type="submit"
									value="result">Book Now</button>
							</form>
						</div> <br></td>
					<c:if test="${count.index % 3 == 2}">
			</tr>
			<tr>
				</c:if>
				</c:forEach>
			</tr>
		</table>
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

.doctor img {
	width: 200px;
	height: 200px;
	border-radius: 50%;
	object-fit: cover;
	box-shadow: 0 6px 8px 1px rgba(0, 0, 0, 0.19);
}

input {
	width: 100px;
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