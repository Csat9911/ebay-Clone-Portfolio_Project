<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Message Board Search</title>
<link href="./css/MessageBoard.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- TODO: Use action="filename.jsp" to link front-end form submit to back-end -->
	<!-- On button press from form submit whatever file is in the action will be invoked a-->
	 <div class="imgcontainer">
    	<img src="images/BuyMe-logos_transparent.png" alt="Avatar" class="avatar">
  	</div>
  	<br>
  	<br>
  	<h2>Click to Search Message Board</h2>
	<h3>MessageID, userID, TimeStamp, Message</h3>
	<%try {
		//Get the database connection
		ApplicationConnection db = new ApplicationConnection();	
		Connection con = db.getConnection();	
		//Create a SQL statement
		Statement stmt = con.createStatement();
		String MessageID = request.getParameter("MessageID") ;
		String userID =  request.getParameter("userID");
		String TimeStamp = request.getParameter("TimeStamp");
		String Message = request.getParameter("Message");
		PreparedStatement str = 
		con.prepareStatement("SELECT m.MessageID, m.userID, m.TimeStamp, m.Message FROM messageboard m WHERE CONTAINS (m.Message,?) ORDER BY m.TimeStamp desc;");
		str.setString(1, MessageID);
		str.setString(2, userID);
		str.setString(3,TimeStamp);
		str.setString(4, Message);
		ResultSet result = str.executeQuery();
	
	%>
	<% while (result.next()){ %>
	<form method="Post" action="MessageBoard.jsp">
	<input class="submitButton" type="submit" value=<%=result.getString("MessageID") + "--"+ result.getString("userID") +"--" + result.getString("TimeStamp")+"--"+ result.getString("Message")%> 
	name="MessageID" />
	
	<br>
  	<br>
  	
	<%}
		db.closeConnection(con);
		%>
	</form>
	<%}
	catch(Exception e){
		out.print(e);
	}
	%>

</body>
</html>