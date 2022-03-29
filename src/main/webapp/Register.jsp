<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- This is the reference to the CSS style used for Login.jsp -->
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link href="./css/Login.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- TODO: Use action="filename.jsp" to link front-end form submit to back-end -->
	<!-- On button press from form submit whatever file is in the action will be invoked -->
	<div class="page">
	 <div class="imgcontainer">
    	<img src="images/BuyMe-logos_transparent.png" alt="Avatar" class="avatar">
  	</div>
  	
	<div class="Form_Layout">
	<form method="post">
		  <h1>Please Enter UserID and Password Below</h1>
		  <br>
		  <label><b>UserID</b></label>
		  <br>
		  <input type="text" name="Login-UserID" placeholder="UserID" required/>
		  <br>
		  <label><b>Password</b></label>
		  <br>
		  <input type="text" name="Login-Password" placeholder="Password" required/>
		  <br>
		  <input class="button" type="submit" value="submit" />
		</form>
	</div>
	</div>
</body>
</html>