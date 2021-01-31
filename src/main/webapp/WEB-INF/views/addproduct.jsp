<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
th, td,.panel-heading, .panel-footer, .panel-body {
		font-size: 14px;
		text-align : center;
	}
</style>
<body>

	<div class ="container">
	  <div class="panel-group">
	<div class="panel panel-default">
	
	
			
			<div class="panel-heading"> Enter The Product (admin only!)
			</div>
			 <div class="panel-body">
			 	<form method="post" >
		 	Product Name : <input type = "text" name ="productName" required>
			<br/>
			<label for ="productCategory">Product Category</label>
			<select id ="productCategory" name = "productCategory" required>
			<option value ="instrument">Instrument</option>
			<option value ="record">Record</option>
			<option value ="musiccomposition">MusicComposition</option>
			</select>
		<!-- 	Product Category : <input type ="text" name ="productCategory" required> -->
			<br/>
			<label for ="productCondition">Product Condition</label>
			<select id ="producCondition" name="productCondition" required>
			<option value ="New">New</option>
			<option value ="Excellent">Excellent</option>
			<option value ="Good">Good</option>
			<option value ="Poor">Poor</option>
			</select>
			
			<!-- Product Condition : <input type ="text" name ="productCondition" required> -->
			<br/>
			Product Price : <input type = "number"  step="0.01" name ="productPrice"  required>
			<br/>
			Product PhotoUrl : <input type = "text" name ="photoUrl" required>
			<br/>
			</div>
			<div class="panel-footer">
			<button class="btn btn-warning"type="button" name="back" onclick="history.back()">Click to Go Back</button>
				<button class ="btn btn-success" type ="submit">Register the product</button>
			</div>
		</form>
		</div>
		</div>
		</div>
	
</body>
</html>