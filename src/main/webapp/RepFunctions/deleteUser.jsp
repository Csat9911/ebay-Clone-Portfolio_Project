<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	try {

		ApplicationConnection db = new ApplicationConnection();	
		Connection con = db.getConnection();
		String userName = request.getParameter("User_Name"); 

		
		Statement stmt = con.createStatement();
		String str1 = "DELETE FROM endUsers e WHERE e.userID = " + "\"" + userName + "\"" + ";";

		Statement stmt1 = con.createStatement();
		stmt1.executeUpdate(str1);
			
			
		con.close();
		
		String redirectURL = "../Account.jsp";
		response.sendRedirect(redirectURL);
		
	} catch (SQLException e) {
			//out.print("Error trying to Login try again <a href='Account.jsp'>My Account</a>");
		String redirectURL = "../ErrorPage.jsp";
		response.sendRedirect(redirectURL);
		
	}
%>
</body>
</html>