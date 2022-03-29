<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- This is the reference to the CSS style used for Login.jsp -->
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link href="./css/Register.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- TODO: Use action="filename.jsp" to link front-end form submit to back-end see bardrinker example-->
	<!-- On button press from form submit whatever file is in the action will be invoked a-->
	 <div class="imgcontainer">
    	<img src="images/BuyMe-logos_transparent.png" alt="Avatar" class="avatar">
  	</div>
  	
	<div class="Form_Layout">
	<h2> Login Form </h2>
	<form method="Post" action="#">
		  <h1>Please Complete the Form Below to Register an Account</h1>
		  <br>
		  <label><b>Email Address</b></label>
		  <br>
		  <input class="textButton" type="text" name="Register-Email" placeholder="Email" required/>
			<br>
			<br>
		  <label><b>UserID</b></label>
		  <br>
		  <input class="textButton" type="text" name="Register-UserID" placeholder="UserID" required/>
		  <br>
		  <br>
		  <label><b>Password</b></label>
		  <br>
		  <input class="textButton" type="text" name="Register-Password" placeholder="Password" required/>
			<br>
			<br>
		  <input class="submitButton" type="submit" value="Create Account" />
		</form>
	</div>
</body>
</html>