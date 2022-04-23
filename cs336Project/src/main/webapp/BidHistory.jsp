<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Bid history</title>
<link href="./css/Auctions.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="imgcontainer">
    	<img src="images/BuyMe-logos_transparent.png" alt="Avatar" class="avatar">
  	</div>
  	<br>
  	<br>
<%

		String st = request.getParameter("aucID");
		String aucID = st.split(" ")[0];
		List<String> list = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationConnection db = new ApplicationConnection();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			PreparedStatement str = con.prepareStatement("SELECT b.userID,b.bidAmt FROM bids b where b.aucID = ? order by b.bidAmt desc;");
			str.setString(1, aucID);
			ResultSet result = str.executeQuery();
			
			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("User ID");
			out.print("</td>");
		
			//make a column
			out.print("<td>");
			out.print("Bid amount");
			out.print("</td>");
			out.print("</tr>");
			
			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("userID"));
				out.print("</td>");
				out.print("<td>");
				//Print out c
				//Print out current price
				out.print(result.getString("bidAmt"));
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