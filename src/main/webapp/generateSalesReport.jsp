<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% try {
	
			//Get the database connection
			ApplicationConnection db = new ApplicationConnection();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			String entity = request.getParameter("command");
			if(entity.equals("total earnings")){
				String str = "SELECT SUM(a.currMaxBID) AS earnings FROM auctions a WHERE a.currMaxBid >= a.secretMin AND a.closeDateTime <= NOW()";
				ResultSet result = stmt.executeQuery(str);
				out.print("earnings");
				%>
				<a href = "./SalesReport.jsp">
				<input class="submitButton" type="button" value="Back To Sales Report" />
				</a>
			<% 
			//close the connection.
			db.closeConnection(con);
			}
			else if(entity.equals("earnings per item")){
				String str = "SELECT c.itemID, SUM(a.currMaxBid) AS earnings FROM clothing c, auctions a WHERE c.itemID = a.itemID AND a.closeDateTime < NOW() AND a.currMaxBid >= a.secretMin GROUP BY itemID ORDER BY earnings DESC";
				ResultSet result = stmt.executeQuery(str);
				out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("itemID");
			out.print("</td>");
			//make a column
			out.print("<td>");
			//depending on the radio button selection make a column header for Manufacturer if the beers table was selected and Address if the bars table was selected
			out.print("earnings");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(result.getString("itemID"));
				out.print("</td>");
				out.print("<td>");
				//Print out current bar/beer additional info: Manf or Address
				out.print(result.getString("earnings"));
				out.print("</td>");
				out.print("</tr>");

			}
			out.print("</table>");
			%>
			<a href = "./SalesReport.jsp">
			<input class="submitButton" type="button" value="Back To Sales Report" />
			</a>
		<% 
			//close the connection.
			db.closeConnection(con);
			}
			else if(entity.equals("earnings per item type")){
				String str = "SELECT c.category, SUM(a.currMaxBid) AS earnings FROM clothing c, auctions a WHERE c.itemID = a.itemID AND a.closeDateTime < NOW() AND a.currMaxBid >= a.secretMin GROUP BY category ORDER BY earnings DESC";
				ResultSet result = stmt.executeQuery(str);
				out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("item type");
			out.print("</td>");
			//make a column
			out.print("<td>");
			//depending on the radio button selection make a column header for Manufacturer if the beers table was selected and Address if the bars table was selected
			out.print("earnings");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(result.getString("category"));
				out.print("</td>");
				out.print("<td>");
				//Print out current bar/beer additional info: Manf or Address
				out.print(result.getString("earnings"));
				out.print("</td>");
				out.print("</tr>");

			}
			out.print("</table>");
			%>
			<a href = "./SalesReport.jsp">
			<input class="submitButton" type="button" value="Back To Sales Report" />
			</a>
		<% 
			//close the connection.
			db.closeConnection(con);
			}
			else if(entity.equals("earnings per end-user")){
				String str = "SELECT e.userID AS userID, SUM(a.currMaxBid) AS earnings FROM endUsers e, auctions a WHERE e.userID = a.userID AND a.closeDateTime < NOW() AND a.currMaxBid >= a.secretMin GROUP BY userID ORDER BY earnings DESC";
				ResultSet result = stmt.executeQuery(str);
				out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("endUser");
			out.print("</td>");
			//make a column
			out.print("<td>");
			//depending on the radio button selection make a column header for Manufacturer if the beers table was selected and Address if the bars table was selected
			out.print("earnings");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(result.getString("userID"));
				out.print("</td>");
				out.print("<td>");
				//Print out current bar/beer additional info: Manf or Address
				out.print(result.getString("earnings"));
				out.print("</td>");
				out.print("</tr>");

			}
			out.print("</table>");
			%>
			<a href = "./SalesReport.jsp">
			<input class="submitButton" type="button" value="Back To Sales Report" />
			</a>
		<% 
			//close the connection.
			db.closeConnection(con);
			}
			else if(entity.equals("best-selling items")){
				String str = "SELECT c.itemID, SUM(a.currMaxBid) AS earnings FROM clothing c, auctions a WHERE c.itemID = a.itemID AND a.closeDateTime < NOW() AND a.currMaxBid >= a.secretMin GROUP BY itemID ORDER BY earnings DESC LIMIT 5";
				ResultSet result = stmt.executeQuery(str);
				out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("item");
			out.print("</td>");
			//make a column
			out.print("<td>");
			//depending on the radio button selection make a column header for Manufacturer if the beers table was selected and Address if the bars table was selected
			out.print("earnings");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(result.getString("itemID"));
				out.print("</td>");
				out.print("<td>");
				//Print out current bar/beer additional info: Manf or Address
				out.print(result.getString("earnings"));
				out.print("</td>");
				out.print("</tr>");

			}
			out.print("</table>");
			%>
			<a href = "./SalesReport.jsp">
			<input class="submitButton" type="button" value="Back To Sales Report" />
			</a>
		<% 
			//close the connection.
			db.closeConnection(con);
			}else{
				String str = "SELECT e.userID, SUM(a.currMaxBid) AS money FROM auctions a, endusers e WHERE e.userID = a.userID AND a.closeDateTime < NOW() AND a.currMaxBid >= a.secretMin GROUP BY userID ORDER BY money DESC LIMIT 5";
				ResultSet result = stmt.executeQuery(str);
				out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("buyer");
			out.print("</td>");
			//make a column
			out.print("<td>");
			//depending on the radio button selection make a column header for Manufacturer if the beers table was selected and Address if the bars table was selected
			out.print("money spent");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(result.getString("userID"));
				out.print("</td>");
				out.print("<td>");
				//Print out current bar/beer additional info: Manf or Address
				out.print(result.getString("money"));
				out.print("</td>");
				out.print("</tr>");

			}
			out.print("</table>");
			%>
	<a href = "./SalesReport.jsp">
	<input class="submitButton" type="button" value="Back To Sales Report" />
	</a>
<% 

			//close the connection.
			db.closeConnection(con);
		}
			
			
	 }catch(Exception e){
			out.print(e);
			}%>
</body>
</html>