<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ page import = "java.util.*" %>
	<%@ page import="com.jml.model.User,com.jml.model.Product" %>
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







<div class="container">
<div class ="row">
<div class ="col-xs-12">


 <div class="panel panel-default ">

 <div class="panel-heading" >List of Products

 
 </div>
 	<div class="panel-body">
 	
<div id ="inputBox">
 <i><span class="glyphicon glyphicon-search
"></span></i><input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for name" title="Type in a name" >

 </div>
 	
 	
	<table class ="table table-striped table-hover " id ="myTable" >
		<thead>
			<tr>
				<th>Product ID</th>
				<th>Product Photo </th>
				<th>Product Name </th>
				<th>Product Condition</th>
				<th>Product Category</th>
				<th>Product Price</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items ="${productList}" var="product">
				<tr>
					<td>${product.id}</td>
				 	<td><img src =${product.photoUrl }></td>
				 	<td>${product.productName}</td>
				 	<td>${product.productCondition }</td>
				 	<td>${product.productCategory } </td>
				 	<td>${product.productPrice } </td>
				 	<td>
				 	<a href = "/productdetail?id=${product.id}"><span class="glyphicon glyphicon-zoom-in"></span></a>
				 	<% if (!role.equals("")) { %>
				 	<a href = "/addtocart?id=${product.id}"><span class="glyphicon glyphicon-shopping-cart"></span></a>
				 	<%	if (role.equalsIgnoreCase("admin")) {  %>
				 	<a href = "/editproduct?id=${product.id}"><span class="glyphicon glyphicon-pencil"></span></a>
				 	<a href = "/deleteproduct?id=${product.id}"><span class="glyphicon glyphicon-remove"></span></a>
				 	<%	} else { %>
				 		<%	}%>
 					<% } %>
				 	</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
</div>
 	</div>

 	<% if (!role.equals("")) { %>
 	<%	if (role.equalsIgnoreCase("admin")) {  %>
 			<a type ="button" class ="btn btn-primary" href ="/addproduct">Add Product(Admin only)</a> 
 	
 	<%	} else { %>
 			
 	<%	}%>
 	<% } %>
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