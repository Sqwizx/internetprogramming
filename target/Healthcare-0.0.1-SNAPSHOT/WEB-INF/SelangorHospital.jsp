<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hospital List In Selangor</title>
</head>
<body>
	<div class="container">
		<table>
			<tr>
				<th>City</th>
				<th>Hospital Name</th>
				<th>Address</th>
				<th>Phone No.</th>
			</tr>
			<tr>
				<td>Selangor</td>
				<td>Hospital Ampang</td>
				<td>30 Jalan Morib/Kelanang Kampung Kelanang 42700 Banting
					Malaysia</td>
				<td>(603) 31981461</td>
			</tr>
			<tr>
				<td>Selangor</td>
				<td>Hospital Banting</td>
				<td>7 Rumah Kedai Jalan Indah 2A Taman Ampang Indah 68000
					Ampang Malaysia</td>
				<td>(603) 33432344</td>
			</tr>
			<tr>
				<td>Selangor</td>
				<td>Hospital Kajang</td>
				<td>Lintang Sungai Keramat 2B, Taman Klang Utama, 42100</td>
				<td>033291-6454</td>
			</tr>
			<tr>
				<td>Selangor</td>
				<td>Hospital Kuala Kubu Bharu</td>
				<td>32A Tingkat 1 Bangunan Aked Mara Jln Kapar 41400 Malaysia</td>
				<td>03-2142-5911</td>
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

table {
	border: none;
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border: none;
	border-bottom: 1px solid lightgray;
	padding: 8px;
	text-align: left;
}

tr:hover {
	background-color: #eee;
	transform: scale(1.05);
	transition: transform ease-out 0.3s;
}

th {
	border: none;
	background-color: lightblue;
}
</style>
</html>
