<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta>
<title>Menu Item List Customer</title>
<link rel="stylesheet" href="style/style.css">
<link rel="javascript" href="script.js">

</head>
<body>

	<header>
		<div id="head">
			<div id="col1">
				<img src="images/truyum.png.png" height="33px" width="128px">
				<a href="cart.html" id="col2">Cart</a> <a
					href="menu-item-list-customer.html" id="col2">Menu</a>
			</div>
		</div>
	</header>

	<div id="body">
		<div id="title">
			<h2>Cart</h2>
		</div>

		<table>
			<tr>
				<th>Name</th>
				<th>Free Delivery</th>
				<th>Price</th>
			</tr>
			<c:forEach var="product" items="${cart}">
				<tr>
					<td>${product.name}</td>
					<td><c:choose>
							<c:when test="${menuItem.freeDelivery}">Yes</c:when>
							<c:otherwise>No</c:otherwise>
						</c:choose></td>
					<td>${product.price}</td>
					<td><a href="/remove-cart-item?menuItemId=${product.id}">Delete</a></td>
				</tr>

			</c:forEach>
			<tr>

			</tr>

		</table>
	</div>
	<footer>
		<div class="copyright">Copyright &copy; 2019</div>
	</footer>
</body>
</html>
