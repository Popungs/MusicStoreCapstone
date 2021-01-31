<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<style>
div {
	text-align: center;
}
p {
	font-size: 14px;
}
img {
	  border: 1px solid #ddd;
	  border-radius: 4px;
	  padding: 5px;
	  width: 300px;
	}
	#b {
		text-align : left;
		font-size:20px;
	}
.button {

font-size:20px;
}
</style>

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Displaying task details</title>
</head>
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
  
        
       
        
              
        <% if (u != null) {   %>
         
        <% if (currCart != null) { %>
         <li class="nav-item">
          <a class="nav-link " href= "/currentcart"> Go to your shopping cart </a>
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
    
     <div class="container-fluid">
          <div class="row">
            <div class="col-sm d-flex">
              <div class="card card-body flex-fill">
              <h5 class="card-title">Product Photo</h5> 
               <p class="card-text"> 
                <img src = ${product.photoUrl }>
                </p>
              </div>
            </div>
            <div class="col-sm d-flex">
              <div class="card card-body flex-fill">
              <h5 class="card-title">Product Details</h5> 
                 <p class="card-text"> 
                              <b>Product ID</b> : ${product.id }
                            <br>
							<b>Product Name</b> : ${product.productName}
							 <br>
							<b>Product Condition</b> : ${product.productCondition }
							 <br>
							<b>Product Category</b> : ${product.productCategory }
							 <br>
							<b>Product Price</b> : ${product.productPrice}
							 <br>
                        </p> 
            </div>
          
          </div>
        </div>
        
        </div>
    <div class ="container-fluid" id ="b">
    <button class="btn btn-warning"type="button" name="back" onclick="history.back()">Click to Go Back</button>
    </div>
    
    
</body>
</html>