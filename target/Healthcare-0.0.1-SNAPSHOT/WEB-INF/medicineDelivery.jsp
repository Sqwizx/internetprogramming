<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delivery Tracker</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Inter+Tight:wght@800&family=Roboto:wght@300;400&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/schedule_style.css">
<c:choose>
	<c:when test="${user.role == 'admin'}">
		<%@ include file="adminNavbar.html"%>
	</c:when>
	<c:otherwise>
		<%@ include file="navbar.html"%>
	</c:otherwise>
</c:choose>
<style>
body {
	background-color: #e3e3e3;
	font-family: 'Inter Tight', sans-serif;
}

.header {
	color: #142d4c;
	line-height: 1.6;
	padding-bottom: 20px;
	text-align: center;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
}

.delivery-info {
	background-color: #f2f2f2;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px #ccc;
}

.delivery-info h3 {
	margin-top: 0;
}

.delivery-info p {
	margin-bottom: 20px;
}

.delivery-status {
	background-color: #333;
	color: white;
	padding: 10px;
	border-radius: 5px;
	box-shadow: 0 0 10px #ccc;
	text-align: center;
}

.delivery-timeline {
	background-color: #f2f2f2;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px #ccc;
}

.delivery-timeline h3 {
	margin-top: 0;
}

.timeline-item {
	display: flex;
	align-items: center;
	margin-bottom: 20px;
}

.timeline-item p {
	margin: 0;
	padding-left: 20px;
}

.timeline-icon {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	background-color: #333;
	color: white;
	display: flex;
	align-items: center;
	justify-content: center;
}

.timeline-icon i {
	font-size: 20px;
}
</style>
</head>
<body>
	<div class="header">
		<h1>Delivery Tracker</h1>
	</div>
	<div class="container">
		<form action="trackDelivery" method="post">
			<label for="deliveryId">Enter Delivery ID:</label> <input type="text"
				id="deliveryId" name="deliveryId"> <input type="submit"
				value="Track">
		</form>

		<div class="delivery-info">
			<h3>Delivery Information:</h3>
			<p>Delivery ID:</p>
			<p>Recipient Name:</p>
			<p>Delivery Address:</p>
			<p>Delivery Status:</p>
		</div>
		<div class="delivery-status">

			<!--     </div>
    <div class="delivery-timeline">
      <h3>Delivery Timeline:</h3>
      
        <div class="timeline-item">
          <div class="timeline-icon">
            <i class="fas fa-truck-moving"></i>
          </div>

        </div>
    -->
		</div>

	</div>
</body>
</html>