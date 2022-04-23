<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>All Auctions</title>
<link href="./css/Auctions.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- TODO: Use action="filename.jsp" to link front-end form submit to back-end -->
	<!-- On button press from form submit whatever file is in the action will be invoked a-->
	 <div class="imgcontainer">
    	<img src="images/BuyMe-logos_transparent.png" alt="Avatar" class="avatar">
  	</div>
  	<br>
  	<br>
  	<h2>Auctions I'm bidding in</h2>
	<h3>Auction ID, current max bid, item description, user, auction close date</h3>
	<%
	List<String> list = new ArrayList<String>();
	try {
		//Get the database connection
		ApplicationConnection db = new ApplicationConnection();	
		Connection con = db.getConnection();	
		//Create a SQL statement
		Statement stmt = con.createStatement();
		String userID = session.getAttribute("userID").toString();
		
		PreparedStatement str = 
		con.prepareStatement("SELECT  DISTINCT a.aucID, a.currMaxBid, s.category, s.brand, s.size, s.style, s.color,a.userID, a.closeDateTime from clothing s, auctions a, bids b where s.itemID = a.itemID AND b.aucID = a.aucID AND b.userID = ? ");		
		str.setString(1,userID);
		ResultSet result = str.executeQuery();
	
	%>
	<% while (result.next()){ %>
	<form method="Post" action="MyBid.jsp">
	<input class="submitButton" type="submit" value=<%=result.getString("aucID") + "--"+ result.getString("currMaxBid") +"--" + result.getString("category")+"--"+ result.getString("brand")+ "--"+ result.getString("size")+"--"+ result.getString("style")+"--"
	+ result.getString("color") + "--" +result.getString("userID") + "--" + result.getString("closeDateTime")%> 
	name="aucID" />
	
	<br>
  	<br>
  	</form>
  	
  	
	<%}
		db.closeConnection(con);
		%>
	
	<%}
	catch(Exception e){
		out.print(e);
	}
	
	try{
		ApplicationConnection db = new ApplicationConnection();	
		Connection con = db.getConnection();	
		//Create a SQL statement
		Statement stmt = con.createStatement();
		String userID = session.getAttribute("userID").toString(); %>
		
		<h3>Auctions I created</h3>
	  
	  	
	  	 <% PreparedStatement pr = con.prepareStatement("SELECT c.category, a.currMaxBid, a.closeDateTime FROM clothing c, auctions a where a.userID = ? AND a.itemID = c.itemID;");
			pr.setString(1, userID);
			ResultSet result1 = pr.executeQuery();
			
			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Item category");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Max bid amount");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Close date");
			out.print("</td>");
			out.print("</tr>");
			
			//parse out the results
			while (result1.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result1.getString("category"));
				out.print("</td>");
				out.print("<td>");
				//Print out current beer name:
				out.print(result1.getString("currMaxBid"));
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				out.print(result1.getString("closeDateTime"));
				out.print("</td>");
				out.print("</tr>");

			}
			out.print("</table>"); %>
	<%
		db.closeConnection(con);
		%>
	
	<%}
	catch(Exception e){
		out.print(e);
	}%>

</body>
</html>