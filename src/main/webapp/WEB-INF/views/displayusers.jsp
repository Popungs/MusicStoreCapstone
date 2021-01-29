<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.jml.model.User,com.jml.model.Product" %>
    <%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet" />
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
  <!-- MDB -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.1.0/mdb.min.css" rel="stylesheet" />
   <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<style>
	th, td,.panel-heading {
		font-size: 14px;
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
 <div class="panel panel-default">
 <div class="panel-heading" >List of Users (Admin only view)</div>
 	<div class="panel-body">
	<table class ="table table-striped table-hover">
		<thead>
			<tr>
				<th>ID</th>
				<th>Username </th>
				<th>password</th>
				<th>role</th>
				<th>Orders</th>
				<th>CreditCards</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items ="${userlist}" var="users">
				<tr>
					<td>${users.id }</td>
				 	<td>${users.username }</td>
				 	<td>${users.password }</td>
				 	<td>${users.role }</td>
				 	<td>${users.orders } </td>
				 	<td>${users.cards } </td>
				 	<td>
				 	<a href = "/edituser?id=${users.id}"><span class="glyphicon glyphicon-pencil"></span></a>
				 	<a href = "/deleteuser?id=${users.id}"><span class="glyphicon glyphicon-remove"></span></a>
				 	</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
	
</div>


</body>
</html>