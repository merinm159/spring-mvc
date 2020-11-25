<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<!DOCTYPE html>
  <html >
    <head>
      <meta>
      <title>Menu Item List Admin Edit</title>
      <link rel="stylesheet" href="style/style.css">
      <link rel="javascript" href="script.js">
    </head>
    <body>
      <script src="script.js"> </script>
       <header>
         <div id="head">
           <div id="col1">
               <img src="images/truyum.png.png" height="33px" width="128px" >
               <a href="menu-item-list-admin.html" id="col2">Menu</a>
             </div>
         </div>
       </header>

       <div id="editbody">
          <div id="title">
            <h2>Edit Menu Items</h2>
          </div>
          <div id="adminedit">

          </div>
          <form id="form" action="index.html" method="post">

            <label for="title">Name</label><br>
            <input type="text" name="title" id="title" value="${menuItem.name}" minlength="2"
				maxlength="65" size="80" required><br><br><br>

            <label for="p">Price(Rs.)</label>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            <label for="act">Active</label>&emsp;&emsp;&emsp;&emsp;
            <label for="">Date of Launch</label>&emsp;&emsp;&emsp;
            <label for="category">Category</label><br>

            <input type="number" name="p" id="p" value="${menuItem.price}" required>&emsp;&emsp;
            <input type="radio" name="act" id="act" value="Yes" <c:if test="${menuItem.active}">checked</c:if>> Yes
            <input type="radio" name="act" id="act" value="No" <c:if test="${not menuItem.active}">checked</c:if>>No&emsp;&emsp;
            <input type="date" id="date" name="date" value="${menuItem.dateOfLaunch}" required>&emsp;&emsp;

            <select id="category" name="category" id="category"  required>
             <c:forEach var="x" items="${catogoryList}">
								<option value="${x}">${x}</option>
							</c:forEach>
            </select><br><br><br>


            <input type="checkbox" id="delivery" name="delivery" value="${menuItem.freeDelivery}" <c:if test="${menuItem.freeDelivery}">checked</c:if>>
            <label for="delivery">Free Delivery</label><br><br>
            <button type="button" id="submit" name="submit" onclick="save()">Save</button>
          </form>
          <br><br><br>

      </div>

      <footer>
        <div class="copyright">
          Copyright &copy; 2019
        </div>
      </footer>

  </body>
</html>
