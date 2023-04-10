<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<title>View Medicine</title>
<c:choose>
	<c:when test="${user.role == 'admin'}">
		<%@ include file="adminNavbar.html"%>
	</c:when>
	<c:otherwise>
		<%@ include file="navbar.html"%>
	</c:otherwise>
</c:choose>
<script data-require="jquery@3.1.1" data-semver="3.1.1" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
function wcqib_refresh_quantity_increments() {
    jQuery("div.quantity:not(.buttons_added), td.quantity:not(.buttons_added)").each(function(a, b) {
        var c = jQuery(b);
        c.addClass("buttons_added"), c.children().first().before('<input type="button" value="-" class="minus" />'), c.children().last().after('<input type="button" value="+" class="plus" />')
    })
}
String.prototype.getDecimals || (String.prototype.getDecimals = function() {
    var a = this,
        b = ("" + a).match(/(?:\.(\d+))?(?:[eE]([+-]?\d+))?$/);
    return b ? Math.max(0, (b[1] ? b[1].length : 0) - (b[2] ? +b[2] : 0)) : 0
}), jQuery(document).ready(function() {
    wcqib_refresh_quantity_increments()
}), jQuery(document).on("updated_wc_div", function() {
    wcqib_refresh_quantity_increments()
}), jQuery(document).on("click", ".plus, .minus", function() {
    var a = jQuery(this).closest(".quantity").find(".qty"),
        b = parseFloat(a.val()),
        c = parseFloat(a.attr("max")),
        d = parseFloat(a.attr("min")),
        e = a.attr("step");
    b && "" !== b && "NaN" !== b || (b = 0), "" !== c && "NaN" !== c || (c = ""), "" !== d && "NaN" !== d || (d = 0), "any" !== e && "" !== e && void 0 !== e && "NaN" !== parseFloat(e) || (e = 1), jQuery(this).is(".plus") ? c && b >= c ? a.val(c) : a.val((b + parseFloat(e)).toFixed(e.getDecimals())) : d && b <= d ? a.val(d) : b > 0 && a.val((b - parseFloat(e)).toFixed(e.getDecimals())), a.trigger("change")
});
 </script>
</head>
<body>
<div class="container">
	<div class="header">
	<h1>Medicine Details</h1>
	</div>
	<table>
		<tr>
			<th>Medicine ID:</th>
			<td>${medicine.medicineId}</td>
		</tr>
		<tr>
			<th>Name:</th>
			<td>${medicine.name}</td>
		</tr>
		<tr>
			<th>Price:</th>
			<td>${medicine.price}</td>
		</tr>
		<tr>
			<th>Description:</th>
			<td>${medicine.description}</td>
		</tr>
		<tr>
			<th>Category:</th>
			<td>${medicine.category}</td>
		</tr>
		<tr>
			<th>Quantity:</th>
			<td>
						<div class="quantity buttons_added">
				<input type="button" value="-" class="minus">
				<input type="number" step="1" min="1" max="" name="quantity" value="2" title="Qty" class="input-text qty text" size="4" pattern="" oninput="updateLink(this.value)" >
				<input type="button" value="+" class="plus">
			</div>
			<script>
			function updateLink(quantity) {
			    var addToCartLink = document.getElementById("addToCartLink");
			    addToCartLink.href = "/Healthcare/medicineEcommerce/${medicine.medicineId}/" + quantity;
			  }
</script>
			</td>
			
		</tr>
	</table>

			<a style="padding-top:10px;" id="addToCartLink" href="/Healthcare/medicineEcommerce/${medicine.medicineId}/1" ><button type="button" class="btn">Add to Cart</button></a>
</div>
</body>
<style>
	.quantity {
 display: inline-block; }

.quantity .input-text.qty {
 width: 35px;
 height: 39px;
 padding: 0 5px;
 text-align: center;
 background-color: transparent;
 border: 1px solid #efefef;
}

.quantity.buttons_added {
 text-align: left;
 position: relative;
 white-space: nowrap;
 vertical-align: top; }

.quantity.buttons_added input {
 display: inline-block;
 margin: 0;
 vertical-align: top;
 box-shadow: none;
}

.quantity.buttons_added .minus,
.quantity.buttons_added .plus {
 padding: 7px 10px 8px;
 height: 41px;
 background-color: #ffffff;
 border: 1px solid #efefef;
 cursor:pointer;}

.quantity.buttons_added .minus {
 border-right: 0; }

.quantity.buttons_added .plus {
 border-left: 0; }

.quantity.buttons_added .minus:hover,
.quantity.buttons_added .plus:hover {
 background: #eeeeee; }

.quantity input::-webkit-outer-spin-button,
.quantity input::-webkit-inner-spin-button {
 -webkit-appearance: none;
 -moz-appearance: none;
 margin: 0; }
 
 .quantity.buttons_added .minus:focus,
.quantity.buttons_added .plus:focus {
 outline: none; }
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



table {
  margin: 0 auto;
  width: 20%;
  background-color: white;
  border-radius: 5px;
}

th{
  padding-left: 20px;
  padding-top: 8px;
  padding-bottom: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}
td {
  padding-left: 20px;
  padding-top: 8px;
  padding-bottom: 8px;
  text-align: center;
  border-bottom: 1px solid #ddd;
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
.btn {
	margin-top: 10px;
	font-size: 13px;
	color: #142d4c;
	text-align: center;
	width: 17%;
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
	width: 40%;
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
}
</style>
</html>