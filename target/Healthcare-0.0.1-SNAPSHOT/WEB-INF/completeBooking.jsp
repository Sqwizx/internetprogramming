<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta charset="utf-8" />
<title>Payment Completed</title>
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
	<section class="main-pd-wrapper" style="width: 450px; margin: auto">
		<div
			style="text-align: center; margin: auto; line-height: 1.5; font-size: 14px; color: #4a4a4a;">
			<h3>Rocket Consultation</h3>
			<p style="margin: 15px auto;">${email}</p>
			<p>
				<b>Consultation For Mr/Ms: </b> <br>${fullName}
			</p>
			<!-- <p>
                  <b>FSSAI No. :</b> 0987653456789
                </p> -->
			<hr style="border: 1px dashed rgb(131, 131, 131); margin: 25px auto">
		</div>
		<table style="width: 100%; table-layout: fixed">
			<thead>
				<tr>
					<th style="width: 220px;">Doctor's Name</th>
					<th>Date</th>
					<th>Time</th>

				</tr>
			</thead>
			<tbody>

				<tr class="invoice-items">
					<td>${doctorName}</td>
					<td>${date}</td>
					<td>${time}</td>
				</tr>
			</tbody>
		</table>

		<table
			style="width: 100%; margin-top: 15px; border: 1px dashed #00cd00; border-radius: 3px;">
			<thead>
				<tr>
					<td style="text-align: center;">Thank you for trusting Rocket
						Healthcare. We look forward to meeting you!</td>
				</tr>
			</thead>
		</table>

		<table style="border: none;">
			<tr>
				<td><button onclick="window.location.href='/Healthcare/index'">Back</button></td>
				<td style="text-align: right"><button id="print-button">Save
						Invoice</button></td>
			</tr>
		</table>


	</section>
</body>
<script>
	document.getElementById("print-button").addEventListener("click",
			function() {
				window.print();
			});
</script>
<style>
* {
	box-sizing: border-box;
}

.table-bordered td, .table-bordered th {
	border: 1px solid #ddd;
	padding: 10px;
	word-break: break-all;
}

body {
	font-family: Arial, Helvetica, sans-serif;
	margin: 0;
	padding: 0;
	font-size: 16px;
}

.h4-14 h4 {
	font-size: 12px;
	margin-top: 0;
	margin-bottom: 5px;
}

.img {
	margin-left: "auto";
	margin-top: "auto";
	height: 30px;
}

pre, p {
	/* width: 99%; */
	/* overflow: auto; */
	/* bpicklist: 1px solid #aaa; */
	padding: 0;
	margin: 0;
}

table {
	font-family: arial, sans-serif;
	width: 100%;
	border-collapse: collapse;
	padding: 1px;
}

.hm-p p {
	text-align: left;
	padding: 1px;
	padding: 5px 4px;
}

td, th {
	text-align: left;
	padding: 8px 6px;
}

.table-b td, .table-b th {
	border: 1px solid #ddd;
}

th {
	/* background-color: #ddd; */
	
}

.hm-p td, .hm-p th {
	padding: 3px 0px;
}

.cropped {
	float: right;
	margin-bottom: 20px;
	height: 100px; /* height of container */
	overflow: hidden;
}

.cropped img {
	width: 400px;
	margin: 8px 0px 0px 80px;
}

.main-pd-wrapper {
	box-shadow: 0 0 10px #ddd;
	background-color: #fff;
	border-radius: 10px;
	padding: 15px;
}

.table-bordered td, .table-bordered th {
	border: 1px solid #ddd;
	padding: 10px;
	font-size: 14px;
}

.invoice-items {
	font-size: 14px;
	border-top: 1px dashed #ddd;
}

.invoice-items td {
	padding: 14px 0;
}
</style>
</html>
