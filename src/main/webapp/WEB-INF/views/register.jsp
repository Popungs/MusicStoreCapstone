<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
  <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>

<html>
<style>
.panel-body, .panel-heading, .panel-footer {
	font-size: 14px;
	text-align: center;
}

p {
	color: red;
}
</style>
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

<title>Register user</title>
</head>
<style>
th, td, .panel-heading, .panel-body, .panel-footer {
	text-align: center;
	font-size: 14px;
}
</style>
<body>
	<!-- <h3>Please enter user information to register</h3> -->

	<div class="card text-center">
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-12">
					<div class="card-header">
						<ul class="nav nav-tabs card-header-tabs">
							<li class="nav-item"><a class="nav-link" href="/">Home</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/displayproducts">Product List</a></li>



							<li class="nav-item"><a class="nav-link " href="/login">Login
									to shop</a></li>

							<li class="nav-item"><a class="nav-link " href="/register">Don't
									have an acccount? Register</a></li>

						</ul>
					</div>

				</div>
			</div>

		</div>
	</div>




	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">Please enter user information to register
			<br/>
			You will be logged out if you are already logged in and register a new user. 
			</div>
			<div class="panel-body">
				<form method="post">

					<c:if test="${not empty error}">
						<p>Error: ${error}</p>
					</c:if>





					Name : <input type="text" name="uname" required> <br />
					Password: <input type="password" name="pass" required> <br />
			</div>
			<div class="panel-footer">
				<button class="btn btn-success" type="submit">Register</button>
				<a type="button" class="btn btn-success" href="/login">Click
					here to login</a>
			</div>
			</form>
		</div>
	</div>


</body>
</html>