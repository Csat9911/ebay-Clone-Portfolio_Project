<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- This is the reference to the CSS style used for Login.jsp -->
<html>
<head>
<meta charset="UTF-8">
<title>Rep Functions</title>
<link href="./css/repAccountManagement.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div>
	<h1> Manage End-Users Accounts </h1>
		<h3> To Edit Account Click the Action You Want</h3>
		<div>
		
		<form method="Post" action="EditAccount.jsp">
			<br>
		  <input type="radio" name="command" value="Edit Password" required/> Edit Password
		  <input type="radio" name="command" value="Edit Username" required/> Edit User-Name
		  <input type="radio" name="command" value="Edit Email" required/> Edit Email
		  
		  <br>
		<input class="submitButton" type="submit" value="Continue To Edit Account" />
		</form>
		</div>
</div>
	
	
</body>
</html>