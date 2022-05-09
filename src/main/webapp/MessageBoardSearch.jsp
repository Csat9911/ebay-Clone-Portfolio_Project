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
	<%
		List<String> ListMessage = new ArrayList<String>();
		
		String Keyword = session.getAttribute("search").toString();

		try {
			ApplicationConnection db = new ApplicationConnection();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT * FROM MessageBoard WHERE m.message LIKE " + """ + Keyword + """ + ";";;
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			//parse out the results
			while (result.next()) {
				
				String message = result.getString("Message");
				
				ListMessage.add(message);

			}			
			//close the connection.
			
			con.close();
			
		} catch (SQLException e) {
				//out.print("Error trying to Login try again <a href='Account.jsp'>My Account</a>");
			String redirectURL = "./ErrorPage.jsp";
			response.sendRedirect(redirectURL);
			
		}
	%>
	<% for(int i = 0; i < ListMessage.size();i++){ %>
    	<div class = "MessageContent">
    	    		
    	<%} %>
    	<textarea class="userInput" cols= "50" rows= "5" disabled> <%= ListMessage.get(i) %></textarea>

    	</div>
  	<% } %>
	
	

	
	<a href = "./MessageBoard.jsp">
	<input class="submitButton" type="button" value="Back To Message Boards" />
	</a>
	</form>
	</div>

</body>
</html>