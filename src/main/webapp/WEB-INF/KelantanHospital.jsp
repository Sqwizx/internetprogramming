<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hospital List in Kelantan</title>
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
				<td>Kelantan</td>
				<td>Hospital Gua Musang</td>
				<td>"Bandar Baru 18300 Gua Musang Kelantan"</td>
				<td>609 - 9121 133</td>
			</tr>
			<tr>
				<td>Kelantan</td>
				<td>Hospital Jeli</td>
				<td>17600 Jeli Kelantan</td>
				<td>609 - 9121 133</td>
			</tr>
			<tr>
				<td>Kelantan</td>
				<td>Hospital Kuala Krai</td>
				<td>"Jalan Kota Bharu 18000 Kuala Krai Kelantan</td>
				<td>609 - 9666 333</td>
			</tr>
			<tr>
				<td>Kelantan</td>
				<td>Hospital Machang</td>
				<td>"Jalan Pasir Puteh 18500 Machang Kelantan</td>
				<td>609 - 9752 533</td>
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
