<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.model.Delivery"%>
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

.btn {
	text-align: center;
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
		<form action="trackDelivery" method="get">
			<label for="deliveryId">Enter Delivery ID:</label> <input type="text"
				id="deliveryId" name="deliveryId"> <input type="submit"
				value="Track">
		</form>

		<%
		Delivery delivery = (Delivery) request.getAttribute("delivery");
		if (delivery != null) {
		%>
		<div class="delivery-info">
			<h3>Delivery Information:</h3>
			<p>
				Delivery ID:
				<%=delivery.getId()%></p>
			<p>
				Recipient Name:
				<%=delivery.getRecipientName()%></p>
			<p>
				Delivery Address:
				<%=delivery.getDeliveryAddress()%></p>
			<p>
				Delivery Status:
				<%=delivery.getStatus()%></p>
		</div>
		<div class="delivery-status">
			<%
			String status = delivery.getStatus();
			if (status.equals("In Transit")) {
			%>
			<i class="fas fa-truck-moving"></i>
			<%
			} else if (status.equals("Delivered")) {
			%>
			<i class="fas fa-check-double"></i>
			<%
			} else {
			%>
			<i class="fas fa-exclamation-triangle"></i>
			<%
			}
			%>
		</div>

		<div class="delivery-timeline">
			<h2><%=delivery.getStatus()%></h2>
			<c:if test="${user.role == 'admin'}">
			<a href="setInTransit?id=<%=delivery.getId()%>"><button class="btn">Set to in transit</button></a>
			<a href="setDelivered?id=<%=delivery.getId()%>"><button class="btn">Set to Delivered</button></a>
			<a href="setError?id=<%=delivery.getId()%>"><button class="btn">Error</button></a>
			</c:if>
			<%--       <h3>Delivery Timeline:</h3>
      <c:forEach var="timeline" items="${delivery.getTimeline()}">
        <div class="timeline-item">
          <div class="timeline-icon">
            <i class="fas fa-truck-moving"></i>
          </div>
          <p><%= timeline %></p>
        </div>
      </c:forEach> --%>
		</div>
		<%
		}
		%>
	</div>
</body>
</html>