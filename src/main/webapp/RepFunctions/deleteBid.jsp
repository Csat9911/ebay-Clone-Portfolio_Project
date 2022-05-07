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
String bidID = request.getParameter("BidID");
out.println(bidID);
ApplicationConnection db = new ApplicationConnection();	
Connection con = db.getConnection();	

//Create a SQL statement
Statement stmt = con.createStatement();


String str = "DELETE FROM Bids b WHERE b.bidID = " + "\""+ bidID + "\"" +";";
//Run the query against the database.
out.println(str);

stmt.executeUpdate(str);


con.close();

	String redirectURL = "../Account.jsp";
	response.sendRedirect(redirectURL);
	
}
catch (SQLException e){
	String bidID = request.getParameter("BidID");
	out.println(bidID);
	out.println("error");
}

%>
</body>
</html>