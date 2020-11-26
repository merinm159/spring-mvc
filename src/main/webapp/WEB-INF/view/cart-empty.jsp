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
	</div>

	<div>
		No items in cart. Use 'Add to Cart' option in <a
			href="/show-menu-list-customer">Menu Item List</a>
	</div>
	<footer>
		<div class="copyright">Copyright &copy; 2019</div>
	</footer>

</body>
</html>