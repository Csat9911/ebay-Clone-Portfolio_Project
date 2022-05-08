<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try { 

ApplicationConnection db = new ApplicationConnection();	
Connection con = db.getConnection();	

//Create a SQL statement

	
String aucID = request.getParameter("AucID");

Statement stmt = con.createStatement();


String str = "DELETE FROM auctions a WHERE a.aucID = " + "\""+ aucID + "\"" +";";

out.println(str);
//Run the query against the database.
stmt.executeUpdate(str);


con.close();


	String redirectURL = "../Account.jsp";
	response.sendRedirect(redirectURL);
	
}
catch (SQLException e){
	out.println("error");
}

%>
</body>
</html>