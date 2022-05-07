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
<title>Remove Bids</title>
</head>
<body>
<%
	List<repAuctionList> ListAuctions = new ArrayList<>();
	
		try {
			ApplicationConnection db = new ApplicationConnection();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			String userName = request.getParameter("Auction_userName"); 
			
			
			String str = "SELECT * FROM Auctions a WHERE a.userID = " + "\""+ userName + "\"" +";";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			
			//parse out the results
			while (result.next()) {

				int aucID = result.getInt("aucID");
				String userName1 = result.getString("userID");
				String TimeStamp = result.getString("closeDateTime");
				int secret = result.getInt("secretMin");
				int itemID = result.getInt("itemID");
				int maxBid = result.getInt("currMaxBid");
				
			
				
				repAuctionList bidInfo= new repAuctionList(aucID,userName1,TimeStamp,secret,itemID,maxBid);
				
				ListAuctions.add(bidInfo);

			}
			
			con.close();

		} catch (Exception e) {
			//write something here to redirect
		}
	%>
	<div class = "MessageHome">
	<h1>
		Below is the List of Bids Made by the User
	</h1>
    <% for(int i = 0; i < ListAuctions.size();i++){ %>
    	<div class = "MessageContent">
    	<% int s = ListAuctions.get(i).getaucID();%>
    	<% String s1 = Integer.toString(s); out.println("Auction ID" + s1);%>
    	
    	<div>
    	<a id = "${s1}" href = "./deleteAuction.jsp?AucID=<%=s1%>">
		  <input name = "button1" class="submitButton" type="submit" value=<%= ("Remove #"+s).trim() %> placeholder = "Delete Auction">
		</a>
		<p>|AuctionID| &emsp;&emsp;&emsp; |UserID| &emsp;&emsp;&emsp;  |Close Date/Time| &emsp;&emsp;&emsp;  |Secret Min| &emsp;&emsp;&emsp;  |Item ID| &emsp;&emsp;&emsp;  |Max Bid| </p>
			<% out.println(ListAuctions.get(i).getaucID());%> &emsp;&ensp; <%out.println(ListAuctions.get(i).getUserID()); %> &emsp;&emsp;&emsp; <%out.println(ListAuctions.get(i).getTimeStamp()); %>  &emsp;&emsp;&emsp;&emsp;&emsp; <%out.println(ListAuctions.get(i).getSecret()); %>  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;  <%out.println(ListAuctions.get(i).getItem()); %> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;  <%out.println(ListAuctions.get(i).getMaxBid()); %> 
    	</div>
    	</div>
		<br>
  	<% } %>
  	</div>
	
</body>
</html>