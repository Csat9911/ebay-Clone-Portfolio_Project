<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.lang.*, java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Customer Representative Account</title>
</head>
<body>
	<div class="Form_Layout">
	<h2> Register Form</h2>
	<form method="Post" action="custRepAcctCreation.jsp">
		<h1>Complete the form below to register a Customer Representative</h1>
		<br>
		<label><b>repID</b></label>
		<br>
		<input class="textButton" type="text" name="Register-repID" placeholder="RepID" required/>
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