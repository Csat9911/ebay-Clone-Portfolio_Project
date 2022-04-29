<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*,java.sql.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<%
	
	try {
		//INSERT INTO `admin` VALUES ('adminUser1','adminPassWord!');
		//Get the database connection
		ApplicationConnection db = new ApplicationConnection();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		
		String name=session.getAttribute("userId").toString();
		out.println(name);
		String ogID=session.getAttribute("ogID").toString();
		String newReply = request.getParameter("Reply-Area");
		
		String insert = "INSERT INTO MessageBoardReplies(repID, TimeStamp, MessageReply, OriginalQuestionID)"
				+ "VALUES (?,?,?,?)";
		
		PreparedStatement ps = con.prepareStatement(insert);
		Calendar calendar = Calendar.getInstance();

		// get a java date (java.util.Date) from the Calendar instance.
		// this java date will represent the current date, or "now".
		java.util.Date currentDate = calendar.getTime();

		// now, create a java.sql.Date from the java.util.Date
		java.sql.Date date = new java.sql.Date(currentDate.getTime());
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself	
		ps.setString(1, name);
		ps.setDate(2, date);
		
		ps.setString(3, newReply);
		ps.setString(4, ogID);

		
		ps.executeUpdate();

			//out.println("There was an error trying to Login to your account, Please Click Login To Try Again <a href='Login.jsp'>Login</a>");
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
	 } catch( SQLException e ){
        e.printStackTrace();}
%>
</body>
</html>