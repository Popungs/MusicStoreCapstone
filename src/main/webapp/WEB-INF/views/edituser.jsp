<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>     
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
<title>Displaying task details</title>
</head>
<style>
	h1,h2,div {
		text-align :center;
	}
		.panel-heading,.panel-body,.panel-footer {
		text-align:center;
		font-size: 14px;
	}
</style>
<body>


<div class ="container">

<div class="panel panel-default">
<div class="panel-heading"> User Edit Form </div>


	
<div class="panel-body">
<form:form method ="post" modelAttribute ="user"> 
	<td>Current User ID: ${user.id} </td>
	<td> <form:hidden path="id"/> </td>
	<br/>
	<td>Current User Name : </td>
	<td>${user.username} </td>
	<br/>
	<td>new user name :  </td>
	<td><form:input path="username" type ="text" required="required"/></td>
	<br/>
	
	<td>Current User Password : </td>
	<td>${user.password } </td>
	<br/>
	<td>new password :  </td>
	<td><form:input path="password" type ="password" required="required"/></td>
	<br/>
	
	<td>Current User Role : </td>
	<td>${user.role } </td>
	<br/>
	<td>new role :  </td>
	<td><form:input path="role" type ="text" required="required"/></td>
	<br/>
	
	<td>Current User Cards : </td>
	<td>${user.cards } </td>
	<br/>

	<td>add cards ? : </td>
	<td><input name ="card" type ="number"/></td>
	<br/>
	
	</div>
	
	<div class="panel-footer">
	<button class="btn btn-warning"type="button" name="back" onclick="history.back()">Click to Go Back</button>
		<input type ="submit" class="btn btn-warning"  type="submit" formaction="edit" value="Click here to Edit">
		
	</div>
	</form:form>
	</div>
	
	
</div>

</body>
</html>