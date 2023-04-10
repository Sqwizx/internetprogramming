<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Report</title>
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
			<h2>Activities</h2>
		</div>
		<div class="fltr">
			<form action="reportaction" method="GET">
				<label for="filter">Filter :</label> <select name="Filter">
					<!-- <option value="BH">Booking History</option> -->
					<option value="MDS">Medicine Delivery Service</option>
					<option value="BMI">BMI</option>
					<option value="SL">Stress Level</option>
					<option value="MS">Medicine Schedule</option>
				</select>
				<button type="submit">Confirm</button>
			</form>
		</div>
		<table>
			<c:if test="${not empty medlist}">
				<c:forEach items="${medlist}" var="medlist" varStatus="loop">
					<tr>
						<td class="row1">
							<p>Name:</p>
							<p>Dosage:</p>
							<p>Frequency:</p>
							<p>Start Date:</p>
							<p>End Date:</p>
						</td>


						<td class="row2">
							<p>
								<c:out value="${medlist.name}" />
							</p>
							<p>
								<c:out value="${medlist.dosage}" />
							</p>
							<p>
								<c:out value="${medlist.frequency}" />
							</p>
							<p>
								<c:out value="${medlist.start_date}" />
							</p>
							<p>
								<c:out value="${medlist.end_date}" />
							</p>
						</td>
					</tr>
				</c:forEach>
			</c:if>
<c:if test="${not empty bmilist}">
				<c:forEach items="${bmilist}" var="bmilist" varStatus="loop">
					<tr>
						<td class="row1">
							<p>Your BMI is:</p>
							<p>Your status:</p>
							<p>Your age:</p>
						</td>


						<td class="row2">
							<p>
								<c:out value="${bmilist.bmi}" />
							</p>
							<p>
								<c:out value="${bmilist.description}" />
							</p>
							<p>
								<c:out value="${bmilist.age}" />
							</p>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${not empty stresslist}">
				<c:forEach items="${stresslist}" var="stresslist" varStatus="loop">
					<tr>
						<td class="row1">
							<p>Gender: </p>
							<p>Age: </p>
							<p>Stress Level: </p>
							<p>Stress Point: </p>
						</td>


						<td class="row2">
							<p>
								<c:out value="${stresslist.gender}" />
							</p>
							<p>
								<c:out value="${stresslist.age} Years" />
							</p>
							<p>
								<c:out value="${stresslist.stressLevelResult}" />
							</p>
							<p>
								<c:out value="${stresslist.stressLevel}" />
							</p>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${not empty deliverylist}">
				<c:forEach items="${deliverylist}" var="deliverylist" varStatus="loop">
					<tr>
						<td class="row1">
							<p>Order Code:<p>
							<p>Status:</p>
						</td>


						<td class="row2">
							<p>
								<c:out value="${deliverylist.id}" />
							</p>
							<p>
								<c:out value="${deliverylist.status}" />
							</p>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			
			<%-- <c:if test="${not empty bookinglist}">
				<c:forEach items="${bookinglist}" var="bmilist" varStatus="loop">
					<tr>
						<td class="row1">
							<p>Doctor's Name:</p>
							<p>Date:</p>
							<p>Time:</p>
						</td>


						<td class="row2">
							<p>
								<c:out value="${bookinglist.doctorName}" />
							</p>
							<p>
								<c:out value="${bookinglist.date}" />
							</p>
							<p>
								<c:out value="${bookinglist.time}" />
							</p>
						</td>
					</tr>
				</c:forEach>
			</c:if> --%>
			
		</table>
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

h2 {
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

.select {
	position: relative;
	min-width: 200px;
}

.fltr {
	text-align: center;
	padding-bottom: 10px;
}

select {
	-webkit-appearance: none;
	padding: 7px;
	width: 10%;
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

table {
	margin: 0 auto;
	width: 50%;
	border-collapse: collapse;
	background-color: white;
	border-radius: 20px;
}

th, td {
	padding-left: 20px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}
</style>
</html>