<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
  <html >
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
             <img src="images/truyum.png.png" height="33px" width="128px" >
             <a href="cart.html" id="col2" >Cart</a>
             <a href="menu-item-list-customer.html" id="col2" >Menu</a>
           </div>
       </div>
     </header>

       <div id="body">
          <div id="title">
            <h2>Menu Items</h2>
          </div>
              <table>
               <tr>
        			<th>Name</th>
        			<th>Free Delivery</th>
        			<th>Price</th>
        			<th>Category</th>
        			<th>Action</th>
        		</tr>
        		<c:forEach var="item" items="${menuItemListCustomer}">
        			<tr>
        				<td>${item.name}</td>
        				<td>${item.freeDelivery}</td>
        				<td>${item.price}</td>
        				<td>${item.category}</td>
        				<td><a href="/add-to-cart?menuItemId=${item.id}">Add to Cart</a></td>
        			</tr>
        		
        		</c:forEach>
                
              </table>
        </div>
      <footer>
        <div class="copyright">
          Copyright &copy; 2019
        </div>
      </footer>
    </body>
  </html>
