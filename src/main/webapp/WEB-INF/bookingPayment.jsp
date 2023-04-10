<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Payment</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
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
	<div class="row">
		<div class="col-75">
			<div class="container">
				<form action="completeBooking" method="post">

					<div class="row">
						<div class="col-50">
							<h3>Billing Address</h3>
							<label for="name"><i class="fa fa-user"></i> Name</label> <input
								type="text" class="form-control" id="name" name="fullName"
								placeholder="John M. Doe" value="" required> <label
								for="email"><i class="fa fa-envelope"></i> Email</label> <input
								type="text" class="form-control"
								pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" id="email"
								name="email" placeholder="john@example.com" required> <label
								for="address"><i class="fa-regular fa-address-card"></i>
								Address</label> <input type="text" class="form-control" id="address"
								name="address" placeholder="542 W. 15th Street" required>

						</div>

						<div class="col-50">
							<h3>Payment</h3>
							<label for="fname">Accepted Cards</label>
							<div class="icon-container">
								<label style="font-size: 15px" for="credit"><i
									class="fa-brands fa-cc-visa" style="color: navy;"></i> Credit
									card <input id="credit" name="payType" type="radio"
									value="Credit card" checked required> </label> <label
									style="font-size: 15px" for="credit"><i
									class="fa-brands fa-cc-mastercard" style="color: red;"></i><input
									id="credit" name="payType" type="radio" value="Credit card"
									required> Credit card</label> <label style="font-size: 15px"
									for="credit"><i class="fa-brands fa-cc-paypal"></i><input
									id="credit" name="payType" type="radio" value="Credit card"
									required> Paypal</label>

							</div>
							<label for="ccName">Name on card</label> <input type="text"
								id="ccName" name="ccName" placeholder="John More Doe" required>

							<label for="ccNo">Credit card number</label> <input type="text"
								id="ccNo" name="ccNo" inputmode="numeric"
								pattern="[0-9\s]{13,19}" autocomplete="cc-number" maxlength="19"
								placeholder="1111 2222 33333 4444" required>

							<div class="row">
								<div class="col-50">
									<label for="ccExp">Expiration</label> <input type="text"
										id="ccExp" name="ccExp" pattern="(0[1-9]|1[0-2])\/?([0-9]{2})"
										placeholder="MM/YY" required>
								</div>
								<div class="col-50">
									<label for="ccCVV">CVV</label> <input type="text"
										pattern="[0-9]{3,4}" id="ccCVV" maxlength="4"
										inputmode="numeric" name="ccCVV" placeholder="345" required>
								</div>
							</div>
						</div>

					</div>
					<input type="submit" value="Continue to checkout" class="btn">
				</form>
			</div>
		</div>
		<!--<div class="col-25">-->
		<!--  <div class="container">-->
		<!--    <h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b>4</b></span></h4>-->
		<!--    <p><a href="#">Product 1</a> <span class="price">$15</span></p>-->
		<!--    <p><a href="#">Product 2</a> <span class="price">$5</span></p>-->
		<!--    <p><a href="#">Product 3</a> <span class="price">$8</span></p>-->
		<!--    <p><a href="#">Product 4</a> <span class="price">$2</span></p>-->
		<!--    <hr>-->
		<!--    <p>Total <span class="price" style="color:black"><b>$30</b></span></p>-->
		<!--  </div>-->
		<!--</div>-->
	</div>

	<script>
		document.addEventListener("DOMContentLoaded", function() {
			  var ccExp = document.getElementById("ccExp");
			  var ccNo = document.getElementById("ccNo");
			  var ccCVV = document.getElementById("ccCVV");
			  ccExp.addEventListener("input", function() {
			    var value = this.value.replace(/[^\d]/g, "").slice(0, 4);
			    var month = value.slice(0, 2);
			    var year = value.slice(2, 4);
			    this.value = month + "/" + year;
			  });

			  var ccNo = document.getElementById("ccNo");
			  ccNo.addEventListener("input", function() {
			    var value = this.value.replace(/[^\d]/g, "").slice(0, 16);
			    var cardNumber = value.match(/.{1,4}/g).join(" ");
			    this.value = cardNumber;
			  });

			  var ccCVV = document.getElementById("ccCVV");
			  ccExp.addEventListener("keypress", function(e) {
			    var keyCode = (e.keyCode ? e.keyCode : e.which);
			    if (keyCode > 47 && keyCode < 58) {
			      return true;
			    } else {
			      return false;
			    }
			  });
			  ccNo.addEventListener("keypress", function(e) {
			    var keyCode = (e.keyCode ? e.keyCode : e.which);
			    if (keyCode > 47 && keyCode < 58) {
			      return true;
			    } else {
			      return false;
			    }
			  });
			  ccCVV.addEventListener("keypress", function(e) {
			    var keyCode = (e.keyCode ? e.keyCode : e.which);
			    if (keyCode > 47 && keyCode < 58) {
			      return true;
			    } else {
			      return false;
			    }
			  });
			});
		document.getElementById("ccCVV").addEventListener("keypress", function(e) {
		    if (e.which < 48 || e.which > 57) {
		        e.preventDefault();
		    }
		});
		document.getElementById("ccNo").addEventListener("keypress", function(e) {
		    if (e.which < 48 || e.which > 57) {
		        e.preventDefault();
		    }
		});
	</script>
</body>
<style>
input[type=radio], input.radio {
	float: left;
	clear margin: 2px 0 0 2px;
}

body {
	font-family: Arial;
	font-size: 17px;
	padding: 8px;
}

* {
	box-sizing: border-box;
}

.row {
	display: -ms-flexbox; /* IE10 */
	display: flex;
	-ms-flex-wrap: wrap; /* IE10 */
	flex-wrap: wrap;
	margin: 0 -16px;
}

.col-25 {
	-ms-flex: 25%; /* IE10 */
	flex: 25%;
}

.col-50 {
	-ms-flex: 50%; /* IE10 */
	flex: 50%;
}

.col-75 {
	-ms-flex: 75%; /* IE10 */
	flex: 75%;
}

.col-25, .col-50, .col-75 {
	padding: 0 16px;
}

.container {
	background-color: #f2f2f2;
	padding: 5px 20px 15px 20px;
	border: 1px solid lightgrey;
	border-radius: 3px;
}

input[type=text] {
	width: 100%;
	margin-bottom: 20px;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

label {
	margin-bottom: 10px;
	display: block;
}

.icon-container {
	margin-bottom: 5px;
	padding: 7px 0;
	font-size: 24px;
}

.btn {
	background: #00bbf0;
	color: #142d4c;
	padding: 12px;
	margin: 10px 0;
	border: 1px solid rgba(0, 0, 0, 0.3);
	width: 100%;
	border-radius: 4px;
	cursor: pointer;
	font-size: 17px;
}

.btn:hover {
	color: #333333;
	background-color: #00bbf0;
	background-position: 0 -15px;
	box-shadow: 0 6px 8px 1px rgba(0, 0, 0, 0.19);
}

a {
	color: #2196F3;
}

hr {
	border: 1px solid lightgrey;
}

span.price {
	float: right;
	color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media ( max-width : 800px) {
	.row {
		flex-direction: column-reverse;
	}
	.col-25 {
		margin-bottom: 20px;
	}
}
</style>
</html>
