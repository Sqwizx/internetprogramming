<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/summary_style.css">
<head>
<meta charset="ISO-8859-1">
<title>Booking Details</title>
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
			<h1>Booking Summary</h1>
		</div>
		<br>
		<table>
			<tr>
				<td rowspan="2">
					<div class="card">
						<img
							src="https://www.sonypictures.com/sites/default/files/styles/max_360x390/public/banner-images/2020-11/thegooddoctor_banner_2572x1100.jpg?h=abc6acbe&itok=NCQnfRqo">
						<div class="container">
							<h4>
								<b>${doctor.doctorType}</b>
							</h4>
							<p>${doctor.doctorName}</p>
						</div>
					</div>
				</td>
				<td><b>Location:</b><br>${doctor.doctorLocation}<br>
					<br> <br>
					<hr> <b>Fixed Rate:</b><br>RM ${doctor.doctorRate}<br>
					<br> <br>
					<form action="bookingPayment" method="post">
					<hr> <b><label>Set Appointment Date<br></label></b>
						<input type="date" name="datevisit" min="2018-01-01"
							max="2023-5-18" required><br> <br> <br>
						<hr>
						<b>Time:</b><br> <select id="time" name=time>
							<option value="9.00">9.00AM</option>
							<option value="10.30">10.30AM</option>
							<option value="12.00">12.00PM</option>
							<option value="14.00">2.00PM</option>
							<option value="15.30">3.30PM</option>
							<option value="17.00">5.00PM</option>
						</select><br> <br> <br>
						<hr>

						<button class="button" id="submit" type="submit">Confirm
							and Pay</button>
					</form></td>
			</tr>
		</table>
		<script>
		 let today = new Date().toISOString().split('T')[0];
		    document.querySelectorAll("input[type='date']").forEach(function (input) {
		        input.setAttribute('min', today);
		    });
		</script>
	</div>

	<script>
		// Get the modal
		var modal = document.getElementById("payment-modal");
		// Get the button that opens the modal
		var btn = document.getElementById("pay-button");
		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];
		// When the user clicks the button, open the modal 
		btn.onclick = function() {
			modal.style.display = "block";
		}
		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}

		document.addEventListener("DOMContentLoaded", function() {
			  var ccExp = document.getElementById("ccExp");
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

	   
	</script>
</body>

<style>
body {
	background-color: #e3e3e3;
	font-family: 'Inter Tight', sans-serif;
}

.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	border-radius: 5px; /* 5px rounded corners */
}

/* Add rounded corners to the top left and the top right corner of the image */
img {
	border-radius: 5px 5px 0 0;
}

/* On mouse-over, add a deeper shadow */
.card:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

/* Add some padding inside the card container */
.container {
	padding: 2px 16px;
}

td {
	padding-top: 10px;
	padding-bottom: 20px;
	padding-left: 30px;
	padding-right: 40px;
}

.header {
	color: #142d4c;
	line-height: 1.6;
	padding-bottom: 20px;
	text-align: center;
}

a {
	text-decoration: none;
	font-weight: 600;
}

.doctor img {
	width: 200px;
	height: 200px;
	border-radius: 50%;
	object-fit: cover;
	box-shadow: 0 6px 8px 1px rgba(0, 0, 0, 0.19);
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

button {
	margin-top: 10px;
	font-size: 13px;
	color: #142d4c;
	text-align: center;
	width: auto;
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
	margin-left: auto;
	margin-right: auto;
}

hr {
	border: 3px;
	opacity: 0.5;
}

#payment-modal {
	display: none;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: white;
	border-radius: 10px;
	border: 2px solid lightblue;
	width: 70%;
	margin: 10% auto;
	padding: 20px;
}

.line:after {
	content: " ";
	display: block;
	border-bottom: 0.5px solid #9E9E9E;
}
</style>
</html>