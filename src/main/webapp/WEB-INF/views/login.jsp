<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
  <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<style>
h3 {
	text-align: center;
}

div {
	text-align: center;
}

p {
	color: red;
}
</style>

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
<title>Please Login here</title>
</head>
<style>
	th, td,.panel-heading, .panel-body,.panel-footer {
		text-align:center;
		font-size: 14px;
	}
</style>

<body>
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
			<div class="panel-heading">Please enter user information to
				Sign in</div>

			<form method="post">
					<c:if test="${not empty error}">
						<p>Error: ${error}</p>
					</c:if>

				<div class="panel-body">
					Name : <input type="text" name="uname" required> <br />
					Password: <input type="password" name="pass" required> <br />
				</div>

				<div class="panel-footer">
					<button class="btn btn-success" type="submit">Login</button>
					<a type="button" class="btn btn-success" href="/register">Click
						here to register</a>
				</div>
				<!-- <input type ="submit" class="btn btn-warning"  type="submit" formaction="edit" value="Click here to Edit"> -->


			</form>
		</div>
	</div>
</body>
</html>