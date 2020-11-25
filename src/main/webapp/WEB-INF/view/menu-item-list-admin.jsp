<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta>
<title>Menu Item List Admin</title>
<link rel="stylesheet" href="style/style.css">
<link rel="javascript" href="script.js">
</head>
<body>

	<header>
		<div id="head">
			<div id="col1">
				<img src="images/truyum.png.png" height="33px" width="128px">
				<a href="menu-item-list-admin.html" id="col2">Menu</a>
			</div>
		</div>
	</header>

	<div id="body">
		<div id="title">
			<h2>Menu Items</h2>
		</div>
		<table>
			<tr>
				<th id="name">Name</th>
				<th id="price">Price</th>
				<th id="active">Active</th>
				<th id="dol">Date of Launch</th>
				<th id="category">Category</th>
				<th id="del">Free Delivery</th>
				<th id="action">Action</th>
			</tr>
			
			<c:forEach var="item" items="${menuItemListAdmin}">
				<tr>
        				<td>${item.name}</td>
        				<td>${item.price}</td>
        				<td>${item.active}</td>
        				<td>${item.dateOfLaunch}</td>
        				<td>${item.category}</td>
        				<td>${item.freeDelivery}</td>
        				<td><a href="/show-edit-menu-item?menuItemId=${item.id}">Edit</a></td>
        			</tr>
				</c:forEach>
			
		</table>

	</div>
	<footer>
		<div class="copyright">Copyright &copy; 2019</div>
	</footer>

</body>
</html>
