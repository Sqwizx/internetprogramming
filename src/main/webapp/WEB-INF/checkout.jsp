<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
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
	<h2>Checkout</h2>
	</div>
	<table>
		<tr>
			<th>Medicine Name</th>
			<th>Description</th>
			<th>Category</th>
			<th>Quantity</th>
			<th>Price</th>
			<th>Total Price</th>
		</tr>
		<c:forEach items="${cartList}" var="cart">
			<tr>
				<td>${cart.medicine.name}</td>
				<td>${cart.medicine.description}</td>
				<td>${cart.medicine.category}</td>
				<td>${cart.quantity}</td>
				<td>${cart.medicine.price}</td>
				<td>${cart.price}</td>
			</tr>
		</c:forEach>
	</table>
	<table><tr>
	<th></th>
	<th></th>
	<th>Total Cost</th>
	<th></th>
	<th></th>
	<td>
	${checkoutPrice}</td>
	</tr></table>
	<form action="payment" method="post">
		<input type="hidden" name="cartList" value="${cartList}" />
		<input class="btn" type="submit" value="Proceed to Payment" />
	</form></div>
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

button {
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

button:hover {
	color: #333333;
	background-color: #00bbf0;
	background-position: 0 -15px;
	box-shadow: 0 6px 8px 1px rgba(0, 0, 0, 0.19);
}

table {
	margin: 0 auto;
	width: 100%;
	border-collapse: collapse;
	background-color: white;
	border-radius: 10px;
}

table:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

td {
  padding: 8px;
  border-bottom: 1px solid #ddd;
  
}
th{
	background: #5585b5; 
	margin: 8px;
	padding: 8px;
	color: white;

	}

.button-26 {
  appearance: button;
  background-color: #1652F0;
  border: 1px solid #1652F0;
  border-radius: 4px;
  box-sizing: border-box;
  color: #FFFFFF;
  cursor: pointer;
  font-family: Graphik,-apple-system,system-ui,"Segoe UI",Roboto,Oxygen,Ubuntu,Cantarell,"Fira Sans","Droid Sans","Helvetica Neue",sans-serif;
  font-size: 14px;
  line-height: 1.15;
  overflow: visible;
  padding: 12px 16px;
  position: relative;
  text-align: center;
  text-transform: none;
  transition: all 80ms ease-in-out;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  width: fit-content;
}

.button-26:disabled {
  opacity: .5;
}

.button-26:focus {
  outline: 0;
}

.button-26:hover {
  background-color: #0A46E4;
  border-color: #0A46E4;
}

.button-26:active {
  background-color: #0039D7;
  border-color: #0039D7;
}}
}
</style>
</html>