<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% if (session.getAttribute("user-type").toString().equals("admin")){%>
		<a id = "${s1}" href = "./adminOptions.jsp">
		  <input class="submitButton" type="submit" value="admin options" onclick="myFunction()">
		</a>
		
	<%}else{%>
		<H1>You are not an admin go back to login</H1>
	<a href = "./Login.jsp">
		<input class="submitButton" type="button" value="Back To Login" />
	</a>

	<%} %>

</body>
</html>