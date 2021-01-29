<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "java.util.*" %>
	<%@ page import="com.jml.model.User,com.jml.model.Product" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	rel="stylesheet" />
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet" />
<!-- MDB -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.1.0/mdb.min.css"
	rel="stylesheet" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<style>
	th, td,.panel-heading {
		text-align:center;
		font-size: 14px;
	}
	img {
	  border: 1px solid #ddd;
	  border-radius: 4px;
	  padding: 5px;
	  width: 150px;
	}
	button {
		font-size: 16px;
		 padding: 15px 32px;
	}
	#myInput {
		width:fit-content;
	}
	#inputBox {
		 text-align: center;
	}
</style>

<body>
<% User u = (User) request.getSession().getAttribute("user"); %>
<% List<Product> currCart =  (List<Product>) request.getSession().getAttribute("cart"); %>
<%
	String role = "";
	if (u != null) {
		 role = u.getRole();
	}
%>
<div class="card text-center">
    <div class="card-header">
      <ul class="nav nav-tabs card-header-tabs">
        <li class="nav-item">
          <a class="nav-link"  href="/">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/displayproducts">Product List</a>
        </li>
        
        
        
        <% if (u == null) { %>
        <li class="nav-item">
          <a class="nav-link " href= "/login">Login to shop</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link " href= "/register">Don't have an acccount? Register</a>
        </li>
        
        
       
        <% } %>
  
        
        <% if (u.getRole().equalsIgnoreCase("admin")) { %>
           <li class="nav-item">
          <a class="nav-link " href= "/orderlist">View Order List(admin only)</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link " href= "/userlist">View User List(admin only)</a>
        </li>
        <%  } %>
        
              
        <% if (u != null) {   %>
         
        <% if (currCart != null) { %>
         <li class="nav-item">
          <a class="nav-link " href= "/currentcart"> Go to your shopping cart </a>
        </li>
         
        
        <% } %>
        
        <li class="nav-item">
          <a class="nav-link " href= "#"> Hello! <% out.println(u.getUsername()); %></a>
        </li>
        
         <li class="nav-item">
          <a class="nav-link " href= "/login"> Wanna Logout?(shopping cart gets empty)</a>
        </li>
        
        
        <% } %>	
      </ul>
    </div>

  </div>





	<div class="container">
		<div class="row">
			<div class="col-xs-12">

				<div class="panel panel-default ">
					<div class="panel-heading">List of Orders Placed (admin only view)</div>
					<div class="panel-body">

						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>Order ID</th>
									<th>Order Quantity</th>
									<th>Order Price</th>
									<th>Order Billing Address</th>
									<th>Order Shipping Address</th>
									<th>Order User </th>
									<th>Order User Id</th>
									<th>Order User role</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${orderlist}" var="order">
									<tr>
										<td>${order.id}</td>
										<td>${order.orderQuantity}</td>
										<td>${order.orderPrice}</td>
										<td>${order.bAddress }</td>
										<td>${order.sAddress }</td>
										<td>${order.user.getUsername() }</td>
										<td>${order.user.getId() }</td>
										<td>${order.user.getRole() }</td>
										<td><a href = "/deleteorder?id=${order.id}"><span class="glyphicon glyphicon-remove"></span></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		
	</div>
	<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[2];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>

</body>
</html>