<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- This is the reference to the CSS style used for Account.jsp -->
<html>
<head>
<meta charset="UTF-8">
<title>Account</title>
<link href="./css/Account.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- TODO: Use action="filename.jsp" to link front-end form submit to back-end -->
	<!-- On button press from form submit whatever file is in the action will be invoked a-->
	 <div class="imgcontainer">
    	<img src="images/BuyMe-logos_transparent.png" alt="Avatar" class="avatar">
  	</div>
	
	
	<div class="Form_Layout">
	<h2> Account </h2>
	<form method="Post" action="login.jsp">
		  <h1>
		  	<%String name=request.getParameter("Login-UserID"); out.print("Welcome " + name + "!"); %>
		  </h1>
		  
		  <input class="submitButton" type="submit" value="logout" />
		</form>
	</div>
</body>
</html>