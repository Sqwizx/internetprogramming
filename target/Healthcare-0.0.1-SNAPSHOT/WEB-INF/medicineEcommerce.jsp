<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Medicine E-Commerce</title>
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
</head>
<body>
	<div class="container">
		<div class="header">
			<h1>Medicine E-Commerce</h1>
		</div>
		<form class="search" action="" style="margin: auto; max-width: 400px">
			<input type="text" placeholder="Search.." name="search2">
			<button type="submit">
				<i class="fa fa-search"></i>
			</button>
		</form>
		<form action="cart" method="post">
			<button class="cart" type="submit" value="Cart"><i class="fa-solid fa-cart-plus"></i></button>
		</form>
		<br> <br>
		<!-- <h3>Search by Category</h3>
	<div class="grid">
		<button class="product" onclick="">Covid-19</button>
		<button class="product" onclick="">
			Cough<br>and Flu
		</button>
		<button class="product" onclick="">
			Digestive<br>Tract
		</button>
		<button class="product" onclick="">
			Vitamin and<br>Supplement
		</button>
		<button class="product" onclick="">
			Allergy<br>Anti-Inflammatory
		</button>
		<button class="product" onclick="">Anti-Septic</button>
		<button class="product" onclick="">
			Mouth<br>and Throat
		</button>
	</div> -->
		<table>
			<tr>
				<th>ID</th>
				<th style="text-align: left;">Name</th>

				<th style="text-align: left;">Description</th>
				<th style="text-align: left;">Category</th>
				<th>Available</th>
				<th>Price</th>
				<th>Buy</th>
			</tr>


			<c:forEach items="${medicines}" var="medicine">
				<tr>
					<td style="border-right: 1px solid #ddd; text-align: center;">${medicine.medicineId}</td>
					<td style="text-align: left;">${medicine.name}</td>
					<td style="text-align: left;">${medicine.description}</td>
					<td style="text-align: left;">${medicine.category}</td>
					<td><c:if test="${not empty medicines}">
    Yes
</c:if> <c:if test="${empty medicines}">
    Empty
</c:if></td>
					<td>${medicine.price}</td>
					<td><a href="medicineEcommerce/${medicine.medicineId}"><button
								class="btn">Buy Now</button></a></td>
				</tr>
			</c:forEach>
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

h1 {
	font-size: 30px;
	letter-spacing: 1px;
}

* {
	box-sizing: border-box;
}

.container {
	margin: 10 10 10 10px;
	text-align: center;
	margin-left: 95px;
	margin-right: 95px;
	margin-top: 55px;
	margin-bottom: 55px;
}

form.search input[type=text] {
	padding: 10px;
	font-size: 17px;
	border: 1px solid grey;
	float: left;
	width: 80%;
	background: #f1f1f1;
	margin-bottom: 10px;
}

form.search button {
	float: left;
	width: 20%;
	padding: 10px;
	background: #2196F3;
	color: white;
	font-size: 17px;
	border: 1px solid grey;
	border-left: none;
	cursor: pointer;
}

form.search button:hover {
	background: #0b7dda;
}

form.search::after {
	content: "";
	clear: both;
	display: table;
}

.grid {
	display: grid;
	gap: 15px 15px;
	grid-template-columns: auto auto auto 990px;
}

.btn {
	margin-top: 10px;
	font-size: 13px;
	color: #142d4c;
	text-align: center;
	width: fit-content;
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

button.product {
	width: 140px;
	font-size: 13px;
	color: #142d4c;
	text-align: center;
	background: #ffffff;
	padding-top: 50px;
	padding-bottom: 50px;
	border: none;
	outline: none;
	border-radius: 16px;
	border: 1px solid rgba(0, 0, 0, 0.3);
	font-weight: 900;
}

button.product:hover {
	color: #333333;
	background-color: #ffff;
	background-position: 0 -15px;
	box-shadow: 0 6px 8px 1px rgba(0, 0, 0, 0.19);
}

button.cart {
	margin: 10px;
	font-size: 13px;
	color: #142d4c;
	text-align: center;
	width: 5%;
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

button.cart:hover {
	color: #333333;
	background-color: #00bbf0;
	background-position: 0 -15px;
	box-shadow: 0 6px 8px 1px rgba(0, 0, 0, 0.19);
}

table {
	width: 100%;
	border-collapse: collapse;
	background-color: white;
	border-radius: 10px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
}

td {
	padding: 8px;
	border-bottom: 1px solid #ddd;
}

th {
	background: #5585b5;
	margin: 8px;
	padding: 8px;
	color: white;
}
</style>
</html>