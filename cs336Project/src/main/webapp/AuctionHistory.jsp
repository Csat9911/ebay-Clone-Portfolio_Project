<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Auction history</title>
<link href="./css/Auctions.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="imgcontainer">
    	<img src="images/BuyMe-logos_transparent.png" alt="Avatar" class="avatar">
  	</div>
  	<br>
  	<br>
<%

		String st = request.getParameter("uID");
		String userID = st.split(" ")[0];
		List<String> list = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationConnection db = new ApplicationConnection();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			PreparedStatement str = con.prepareStatement("SELECT c.category, a.currMaxBid, a.closeDateTime FROM clothing c, auctions a where a.userID = ? AND a.itemID = c.itemID;");
			str.setString(1, userID);
			ResultSet result = str.executeQuery();
			
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
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("category"));
				out.print("</td>");
				out.print("<td>");
				//Print out current beer name:
				out.print(result.getString("currMaxBid"));
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				out.print(result.getString("closeDateTime"));
				out.print("</td>");
				out.print("</tr>");

			}
			out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) {
			out.print(e);
		}
		
			%>

</body>
</html>