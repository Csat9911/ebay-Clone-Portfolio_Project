<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*, java.time.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% String functionType = request.getParameter("command"); out.println(functionType);%>
	
	
		<% if(functionType.equals("Edit Password")) {%>
			<div>
				<form method="Post" action="./RepFunctions/changePassword.jsp">
					<input type="text" name="UserNameField" placeholder = "User-Name" required/>
				  	<input type="text" name="New_Password" placeholder="New Password" required/>
					<input class="submitButton" type="submit" value="Submit Password Change" />
				</form>
			</div>
		
		<%} %>
		<% if(functionType.equals("Edit Username")) {%>
			<div>
				<form method="Post" action="./RepFunctions/changeUserName.jsp">
				<input type="text" name="UserNameField" placeholder = "User-Name" required/>
				  	<input type="text" name="New_Username" placeholder="New User-Name" required/>
					<input class="submitButton" type="submit" value="Submit User-Name Change" />
				</form>
			</div>
			
		
		
		<%} %>
		<% if(functionType.equals("Edit Email")) {%>
			<div>
				<form method="Post" action="./RepFunctions/changeEmail.jsp">
					<input type="text" name="EmailField" placeholder="Current Email" required/>
				  	<input type="text" name="New_Email" placeholder="New Email" required/>
					<input class="submitButton" type="submit" value="Submit Edit-Email Change" />
				</form>
			</div>
		
		<%} %>
		<% if(functionType.equals("Delete A User")) {%>
			<div>
				<form method="Post" action="./RepFunctions/deleteUser.jsp">
				  	<input type="text" name="User_Name" placeholder="User-Name" required/>
					<input class="submitButton" type="submit" value="Submit Delete User" />
				</form>
			</div>
		<%} %>
		<br>
		<a href = "./Account.jsp">
			<input name = "button1" class="submitButton" value="Back To Account Page" type="submit"> 
		</a>

</body>
</html>