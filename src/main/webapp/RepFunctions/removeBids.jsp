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
	List<repBidList> ListBids = new ArrayList<>();
	
		try {
			ApplicationConnection db = new ApplicationConnection();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			String userName = request.getParameter("Bid_userName"); 
			
			
			String str = "SELECT * FROM Bids b WHERE b.userID = " + "\""+ userName + "\"" +";";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			
			//parse out the results
			while (result.next()) {

				int bidID = result.getInt("bidID");
				int aucID = result.getInt("aucID");
				String userName1 = result.getString("userID");
				int upLim = result.getInt("upperLim");
				int increment = result.getInt("increment");
				int bidAmt = result.getInt("bidAmt");
				
			
				
				repBidList bidInfo= new repBidList(bidID,aucID,userName1,upLim,increment,bidAmt);
				
				ListBids.add(bidInfo);

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
    <% for(int i = 0; i < ListBids.size();i++){ %>
    	<div class = "MessageContent">
    	<% int s = ListBids.get(i).getbidID();%>
    	<% String s1 = Integer.toString(s);%>
    	
    	<div>
    	<a id = "${s1}" href = "./deleteBid.jsp?BidID=<%=s1%>">
		  <input name = "button1" class="submitButton" type="submit" value=<%= ("Remove #"+s).trim() %> placeholder = "Delete Bid">
		</a>
		<p>|Bid ID| &emsp;&emsp;&emsp; |UserID| &emsp;&emsp;&emsp;  |AuctionID| &emsp;&emsp;&emsp;  |Bid Amount| &emsp;&emsp;&emsp;  |Upper Limit| </p>
			<% out.println(ListBids.get(i).getbidID());%> &emsp;&ensp; <%out.println(ListBids.get(i).getUserID()); %> &emsp;&emsp;&emsp; <%out.println(ListBids.get(i).getaucID()); %>  &emsp;&emsp;&emsp;&emsp;&emsp; <%out.println(ListBids.get(i).getbidAmt()); %>  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;  <%out.println(ListBids.get(i).getupLim()); %> 
    	</div>
    	</div>
		<br>
  	<% } %>
  	<br>
		<a href = "../Account.jsp">
			<input name = "button1" class="submitButton" value="Back To Account Page" type="submit"> 
		</a>
  	</div>
	
</body>
</html>