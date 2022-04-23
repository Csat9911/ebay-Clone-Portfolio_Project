<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Auction search</title>
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
  	<h2>Click to join auction</h2>
	<h3>Auction ID, current max bid, item description, user, auction close date</h3>
	<%try {
		//Get the database connection
		ApplicationConnection db = new ApplicationConnection();	
		Connection con = db.getConnection();	
		//Create a SQL statement
		Statement stmt = con.createStatement();
		String maxCurr = request.getParameter("maxCurr") ;
		String category =  request.getParameter("clothing");
		String brand = request.getParameter("brand");
		String size = request.getParameter("size");
		String style = request.getParameter("style");
		String color = request.getParameter("color");
		PreparedStatement str = 
		con.prepareStatement("SELECT a.aucID, a.currMaxBid, s.category, s.brand, s.size, s.style, s.color,a.userID, a.closeDateTime from clothing s, auctions a where s.itemID = a.itemID AND a.currMaxBid <= ? AND s.size = ? AND s.category = ? AND s.brand = ? AND s.style = ? AND s.color = ? order by a.closeDateTime desc;");
		str.setString(1, maxCurr);
		str.setString(2, size);
		str.setString(3,category);
		str.setString(4, brand);
		str.setString(5,style);
		str.setString(6,color);
		ResultSet result = str.executeQuery();
	
	%>
	<% while (result.next()){ %>
	<form method="Post" action="Bid.jsp">
	<input class="submitButton" type="submit" value=<%=result.getString("aucID") + "--"+ result.getString("currMaxBid") +"--" + result.getString("category")+"--"+ result.getString("brand")+ "--"+ result.getString("size")+"--"+ result.getString("style")+"--"
	+ result.getString("color") + "--" +result.getString("userID") + "--" + result.getString("closeDateTime")%> 
	name="aucID" />
	
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