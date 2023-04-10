<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hospital List in Johor</title>
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
				<td>Johor</td>
				<td>Hospital Batu Pahat</td>
				<td>118B, Jalan Serampang, Taman Pelangi</td>
				<td>07-333-7626</td>
			</tr>
			<tr>
				<td>Johor</td>
				<td>Hospital Kluang</td>
				<td>30, Suspa Building Jalan Bayu 2/1, Taman Perindustrian
					Tampoi Jaya</td>
				<td>07-237-9788</td>
			</tr>
			<tr>
				<td>Johor</td>
				<td>Hospital Kota Tinggi</td>
				<td>23, Jalan Firma 2/1, Kawasan Perindustrian Tebrau 1</td>
				<td>07-224-4028</td>
			</tr>
			<tr>
				<td>Johor</td>
				<td>Hospital Mersing</td>
				<td>3rd Floor, Merlin Tower, Jalan Meldrum</td>
				<td>07-353-3390</td>
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