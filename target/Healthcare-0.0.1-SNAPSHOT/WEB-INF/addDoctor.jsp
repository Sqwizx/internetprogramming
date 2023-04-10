<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Management</title>
<link rel="stylesheet" href="css/login_style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Inter+Tight&display=swap"
	rel="stylesheet">
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
	<div class="container">
		<h2>Doctor Management</h2>
		<p>Add a doctor, approve requests and remove existing.</p>

		<div class="tab">
			<button class="tablinks" onclick="openCity(event, 'Add')">Add
				Doctor</button>
			<button class="tablinks" onclick="openCity(event, 'Remove')">Remove
				Doctor</button>
		</div>


		<div id="Add" class="tabcontent">
			<h3>Add Doctor</h3>
			<c:forEach items="${userList}" var="user" varStatus="count">

				<div class="accordion">
					<div class="accordion-header" id="accordion-header">
						<h2>${user.username}</h2>
						<i style="text-align: center" class="fa fa-angle-down"></i>
					</div>
					<div class="accordion-panel" id="accordion-panel">
						<form action="submitDoctor" method="post">
							<p>
								Email: <br>
								<input type="text" name="email" value="${user.email}"
									required="required" disabled />
							</p>
							<p>
								Full Name: <br>
								<input type="text" name="doctorName" placeholder="Full Name"
									required="required" />
							</p>
							<p>
								Location: <br>
								<input type="text" name="doctorLocation" placeholder="Location"
									required="required" />
							</p>
							<p>
								Specialty: <select id="doctorType" name="doctorType">
									<option value="" selected disabled hidden="hidden">Specialty</option>
									<option value="General Doctor">General Doctor</option>
									<option value="Child Specialist">Child Specialist</option>
									<option value="Cardiologist">Cardiologist</option>
								</select>
							</p>
							Rate: <br>
							<br>RM <input type="text" name="doctorRate"
								placeholder="Rate" required="required" /> <input type="hidden"
								name="userId" value="${user.id}"> <input type="hidden"
								name="role" value="doctor"><br>
							<button style="width: 100px" class="button2" type="submit"
								value="result">Add</button>
						</form>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<div id="Remove" class="tabcontent">
		<h3>Doctor List</h3>
		<table border="1">
			<tr>
				<th>Username</th>
				<th>Email</th>
				<th>Full Name</th>
				<th>Location</th>
				<th>Action</th>
			</tr>
			<c:forEach items="${doctorList}" var="doctor" varStatus="count">
				<tr>
					<td>${doctor.username}</td>
					<td>${doctor.email}</td>
					<td>${doctor.first_name}${doctor.last_name}</td>
					<td>${doctor.address}</td>
					<td>
						<form action="removeDoctor" method="post">
							<input type="hidden" name="userId" value="${doctor.id}">
							<input type="hidden" name="role" value="user">
							<button style="width: 100px" class="button2" type="submit"
								value="result">Remove</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>


	<script>
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.maxHeight) {
					panel.style.maxHeight = null;
				} else {
					panel.style.maxHeight = panel.scrollHeight + "px";
				}
			});
		}

		function openCity(evt, cityName) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}
			document.getElementById(cityName).style.display = "block";
			evt.currentTarget.className += " active";
		}

		document.addEventListener("DOMContentLoaded", function() {
			var headers = document.querySelectorAll(".accordion-header");
			headers.forEach(function(header) {
				header.addEventListener("click", function() {
					var contentId = "#"
							+ header.nextElementSibling.getAttribute("id");
					var content = document.querySelector(contentId);
					if (content.style.maxHeight === "0px") {
						content.style.maxHeight = content.scrollHeight + "px";
					} else {
						content.style.maxHeight = "0px";
					}
				});
			});
		});
	</script>

</body>

<style>
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
/* Style the tab */
.tab {
	overflow: hidden;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
	background-color: inherit;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
	font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
	background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
	display: none;
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-top: none;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
}

.tabcontent {
	animation: fadeEffect 1s; /* Fading effect takes 1 second */
}

/* Go from zero to full opacity */
@
keyframes fadeEffect {
	from {opacity: 0;
}

to {
	opacity: 1;
}

}
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.accordion {
	background-color: #eee;
	color: #444;
	cursor: pointer;
	padding: 18px;
	width: 96.5%;
	border: none;
	text-align: left;
	outline: none;
	font-size: 15px;
	transition: 0.5s;
}

.accordion:hover {
	background-color: #ccc;
}

.accordion-header {
	padding: 5px 0;
	display: flex;
	justify-content: space-between;
}

.accordion-header h2 {
	margin: 0;
}

.accordion-panel {
	padding: 0px 18px;
	background-color: #eee;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
}

.fa-angle-down {
	display: inline-block;
	transform: rotate(0deg);
	transition: transform 0.5s;
}

.active .fa-angle-down {
	transform: rotate(180deg);
}

input[type=text] {
	width: 50%;
	margin-bottom: 20px;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

input:focus {
	color: #142d4c;
	background-color: #edf7fa;
	background-position: 0 -15px;
}

input[disabled] {
	background-color: lightgray;
}

.button2 {
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
	font-size: 13px;
}

.button2:hover {
	color: #333333;
	background-color: #00bbf0;
	background-position: 0 -15px;
	box-shadow: 0 6px 8px 1px rgba(0, 0, 0, 0.19);
}

.container {
	background-color: white;
	padding: 5px 20px 15px 20px;
	border: 1px solid lightgrey;
	border-radius: 3px;
}
</style>
</html>