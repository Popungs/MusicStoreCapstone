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
.navbar {
	font-size: 14px;
}

li, a {
	color: white;
}

.carousel-inner {
	height: 800px;
	object-fit: cover;
}
.card {
	
	color:white;
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
  		
   		 <% if (u!= null) { %>
        
        <% if (u.getRole().equalsIgnoreCase("admin")) { %>
           <li class="nav-item">
          <a class="nav-link " href= "/orderlist">View Order List(admin only)</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link " href= "/userlist">View User List(admin only)</a>
        </li>
        <%  } %>
        
        <% }  %>
              
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




	<div class="container ">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img
						src="https://static.gibson.com/product-images/Epiphone/EPIQ9C55/Natural/front-banner-1600_900.png"
						alt="Los Angeles" style="width: 100%;">
				</div>

				<div class="item">
					<img
						src="https://www.nonamehiding.com/wp-content/uploads/2020/08/What-Are-Violin-Strings-Made-Of.jpg"
						alt="Chicago" style="width: 100%;">
				</div>

				<div class="item">
					<img
						src="https://usa.yamaha.com/files/parts_viewer01_6df00f3c43e31f2af3424c2b00d8cbe1.jpg"
						alt="New york" style="width: 100%;">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>


</body>
</html>