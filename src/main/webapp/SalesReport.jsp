<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Generate Sales Report</title>
</head>
<body>
	Generate Sales Report for:
	<br>
	<form method="post" action="generateSalesReport.jsp">
		<input type="radio" name="command" value="total earnings"/>Total earnings
		<br>
		<input type="radio" name="command" value="earnings per item"/>Earnings per Item
		<br>
		<input type="radio" name="command" value="earnings per item type"/>Earnings per Item Type
		<br>
		<input type="radio" name="command" value="earnings per end-user"/>Earnings per end-user
		<br>
		<input type="radio" name="command" value="best-selling items"/>Best selling items
		<br>
		<input type="radio" name="command" value="best buyers"/>Best buyers
		<br>
		<input type="submit" value="submit"/>
	</form>
	<br>
		<a href = "./Account.jsp">
			<input name = "button1" class="submitButton" value="Back To Account Page" type="submit"> 
		</a>
</body>
</html>