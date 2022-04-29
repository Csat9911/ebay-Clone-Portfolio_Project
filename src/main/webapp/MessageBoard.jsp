<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="./css/MessageBoard.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Message Board</title>
</head>
<body>
	<% if (session.getAttribute("user-type").toString().equals("endUser")){%>
		<input class="submitButton" type="submit" value="Post A Question" onclick="myFunction()">
	<%}%>
	
<%
	List<MessageBoard> ListMessage = new ArrayList<>();
	List<MessageBoardReply> ListMessageReply = new ArrayList<>();	

		try {
			ApplicationConnection db = new ApplicationConnection();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT * FROM MessageBoard";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			
			Statement stmt1 = con.createStatement();
			//Get the combobox from the index.jsp
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str1 = "SELECT * FROM MessageBoardReplies";
			//Run the query against the database.
			ResultSet result1 = stmt1.executeQuery(str1);
			
			//parse out the results
			while (result.next()) {

				int id = result.getInt("MessageID");
				
				String userName = result.getString("userID");

				String date = result.getString("TimeStamp");
		
				String message = result.getString("Message");
				
				MessageBoard messageelm = new MessageBoard(id, userName, date, message);
				
				ListMessage.add(messageelm);

			}
			
			while (result1.next()) {

				int id = result1.getInt("MessageIDReply");
				
				String repID = result1.getString("repID");

				String TimeStamp = result1.getString("TimeStamp");
		
				String message = result1.getString("MessageReply");
				
				String ogID = result1.getString("OriginalQuestionID");
				
				MessageBoardReply messageelm = new MessageBoardReply(id, repID, TimeStamp, message, ogID);
				
				ListMessageReply.add(messageelm);
				
			}
			
			
			//close the connection.
			
			con.close();

		} catch (Exception e) {
		}
	%>
	<div class = "MessageHome">
	<h1>
		Message Board
	</h1>
    <% for(int i = 0; i < ListMessage.size();i++){ %>
    	<div class = "MessageContent">
    	<% int s = ListMessage.get(i).getId();%>
    	<% String s1 = Integer.toString(s);%>
    	<% if (session.getAttribute("user-type").toString().equals("rep")){%>
    	<a id = "${s1}" href = "./MessageBoardPost.jsp?MessageReplyID=<%=s1%>">
		  <input name = "button1" class="submitButton" type="submit" value=<%= ("Reply #"+s).trim() %> placeholder = "Reply">
		</a>
    		
    	<%} %>
    	<textarea class="userInput" cols= "50" rows= "5" disabled> <%= ListMessage.get(i).getMessage() %></textarea>
    	<div class = "publisherInfo">
    	<%= ListMessage.get(i).getUserID() %>
    	<br>
    	<%= ListMessage.get(i).getTimeStamp() %>
    	</div>
    	
    	 <% for(int x = 0; x < ListMessageReply.size();x++){ %>
    	 	<% if (s1.equals(ListMessageReply.get(x).getogId())){%>
    	 		<textarea class="repReply" cols= "50" rows= "5" disabled> <%= ListMessageReply.get(x).getMessage() %></textarea>
    	<% } %>
    	<% } %>
    	</div>
  	<% } %>
  	</div>
	
</body>
</html>