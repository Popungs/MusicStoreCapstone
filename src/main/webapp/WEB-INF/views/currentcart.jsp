<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ page
	import="com.jml.model.User,com.jml.model.Product,java.util.List,java.math.*"%>

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
th, td, .panel-heading {
	font-size: 14px;
}

img {
	border: 1px solid #ddd;
	border-radius: 4px;
	padding: 5px;
	width: 150px;
}

a {
	justify-content: right;
	align-items: right;
}

#last {
	font-size: 14px;
}
</style>
<body>
	<%
	User u = (User) request.getSession().getAttribute("user");
	%>
	<%
	List<Product> currCart = (List<Product>) request.getSession().getAttribute("cart");
	%>
	<%
	if (currCart != null) {
	%>
	<%

	%>


	<%
	Double totalPrice = 0.0;
	%>
	<%
	int quantity = currCart.size();
	%>
	<%
	int index = 0;
	%>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">Your Order in your cart</div>
			<div class="panel-body">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Product Photo</th>
							<th>Product Name</th>
							<th>Product Condition</th>
							<th>Product Category</th>
							<th>Product Price</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<%
						for (Product p : currCart) {
						%>

						<tr>

							<td><img src=<%out.println(p.getPhotoUrl());%>></td>
							<td>
								<%
								out.println(p.getProductName());
								%>
							</td>
							<td>
								<%
								out.println(p.getProductCondition());
								%>
							</td>
							<td>
								<%
								out.println(p.getProductCategory());
								%>
							</td>
							<td>$
								<%
								out.println(p.getProductPrice());
								%>
							</td>

							<td><a href="/deletefromcart?id=<%out.println(index++);%>"><span
									class="glyphicon glyphicon-remove"></span></a></td>
						</tr>
						<%
						totalPrice += p.getProductPrice();
						%>

						<%
						}
						%>
					</tbody>
					<tfoot>

					</tfoot>

				</table>

				<b><p id="last" align="right">
						Quantity :
						<%
				out.println(quantity);
				%>Total Price : $
				<%totalPrice = Math.round(totalPrice * 100.0) / 100.0;out.println(totalPrice);
				%>
					</p></b>


				<% if (quantity > 0) { %>
				<p align="right">
					<a type="button" class="btn btn-primary" href="/checkoutpage">Checkout</a>
				</p>

				<% } %>
			</div>
		</div>
		<a type="button" class="btn btn-primary" href="/displayproducts">Go
			back to productlist</a>
	</div>




	<%
	}
	%>


</body>
</html>