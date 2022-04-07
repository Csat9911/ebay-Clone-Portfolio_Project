<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- This is the reference to the CSS style used for Login.jsp -->
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="./css/Login.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- TODO: Use action="filename.jsp" to link front-end form submit to back-end -->
	<!-- On button press from form submit whatever file is in the action will be invoked a-->
	 <div class="imgcontainer">
    	<img src="images/BuyMe-logos_transparent.png" alt="Avatar" class="avatar">
  	</div>
	
  	<a href = "http://localhost:8080/cs336Project/Register.jsp">
			<button>Register</button>
	</a>
	
	<div class="Form_Layout">
	<h2> Login Form </h2>
	<form method="Post" action="NewFile.jsp">
		  <h1>Please Enter UserID and Password Below</h1>
		  <label><b>UserID</b></label>
		  <br>
		  <input class="textButton" type="text" name="Login-UserID" placeholder="UserID" required/>
		  <br>
		  <br>
		  <label><b>Password</b></label>
		  <br>
		  <input class="textButton" type="text" name="Login-Password" placeholder="Password" required/>
			<br>
			<br>
		  <input class="submitButton" type="submit" value="submit" />
		</form>
	</div>
</body>
</html>
