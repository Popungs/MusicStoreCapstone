<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
    <%@ page import="com.jml.model.User,com.jml.model.Product,java.util.*" %>
 
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
	th, td,.panel-heading,.panel-body,.panel-footer {
		
		font-size: 14px;
	}
	img {
	  border: 1px solid #ddd;
	  border-radius: 4px;
	  padding: 5px;
	  width: 150px;
	}
	a{
		justify-content: right;
		align-items : right;
	}
	#last {
		font-size:14px;
	}
	#err {
	color: red;
}
	
</style>
<body>
<% User u = (User) request.getSession().getAttribute("user"); %>
<% List<Product> currCart = new ArrayList<>(); %>
<% Double totalPrice = 0.0; %>
<% Date dt = new Date(); %>
<%Calendar c = Calendar.getInstance(); 
c.setTime(dt); 
c.add(Calendar.DATE, 2);
dt = c.getTime(); %>



<% int quantity = 0;  %>
<% int index = 0; %> 
<% if (u != null)  { %>
<% currCart = (List<Product>) request.getSession().getAttribute("cart"); %>
<% } %>
<% if (currCart != null) { %>
<% quantity = currCart.size(); %>


	<div class="container">
 <div class="panel panel-default">
 <div class="panel-heading" >List of Products in your cart</div>
 	<div class="panel-body">
	<table class ="table table-striped table-hover">
		<thead>
			<tr>
				<th>Product Photo </th>
				<th>Product Name </th>
				<th>Product Condition</th>
				<th>Product Category</th>
				<th>Product Price</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<% for (Product p : currCart) {  %>
			
				<tr>
			
				 	<td><img src = 
				 	<% out.println(p.getPhotoUrl()); %> 
				 	></td>
				 	<td> 
				 	<% out.println(p.getProductName()); %>
				 	</td>
				 	<td>
				 	<% out.println(p.getProductCondition()); %>
				 	</td>
				 	<td>
				 	<% out.println(p.getProductCategory()); %>
				 	</td>
				 	<td>$
				 	<% out.println(p.getProductPrice()); %> 
				 	</td>
				 	
				 	<td>
				 
				 	</td>
				</tr>
			<% totalPrice += p.getProductPrice(); %>
		
			<% }%>
				<%
				totalPrice = Math.round(totalPrice * 100.0) / 100.0;
			
				%>
		</tbody>
		<tfoot>
			
		</tfoot>
		
	</table>
		<b><p id = "last" align="right" > Quantity : 	<% out.println(quantity); %>  Total Price : $<% out.println(totalPrice); %></p></b>
	</div>
	</div>
	</div>
	
		<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">Fill out your order description</div>
			<form method="post" onsubmit="myfunction()" >
				<div class="panel-body">
					<c:if test="${not empty error}">
						<p id ="err">Error: ${error}</p>
					</c:if>
				
				
					Your Billing Address : <input  name="bAddress"  type ="text" required />
					<br/>
					Your Shipping Address : <input name ="sAddress" type ="text" required />
					<br/>
					Your Total Price : $<% out.println(totalPrice); %> <input type ="hidden" name="orderPrice" step ="0.01" value = "<% out.println(totalPrice); %>"/>
					<br/>
					Order Quantity : <%out.println(quantity); %> <input type = "hidden" name="orderQuantity" value=" <%out.println(quantity); %>"/>
					<br/>
					Expected Shipping Date : <%out.println(dt); %><input type ="hidden" name="shippingDate" value = " <%out.println(dt); %>"/>
					<br/>
					<input type ="hidden" name ="userId" value ="<% out.println(u.getId()); %>"/>
				</div>
				<div class ="panel-footer">
				<button class="btn btn-warning"type="button" name="back" onclick="history.back()">Click to Go Back to your cart</button>
					<button class="btn btn-success" type ="submit">Click Here to check out your order!</button>
				</div>
			</form>



		</div>
	</div>
	
	
	
<% } %>
<script>
function myfunction() {
	alert("Thank you for your order!")
}
</script>
</body>
</html>