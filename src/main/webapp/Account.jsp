<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*, java.time.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Account</title>
<link href="./css/Account.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- TODO: Use action="filename.jsp" to link front-end form submit to back-end -->
	<!-- On button press from form submit whatever file is in the action will be invoked a-->
	 <div class="imgcontainer">
    	<img src="images/BuyMe-logos_transparent.png" alt="Avatar" class="avatar">
  	</div>
	
	
	<div class="Form_Layout">
	<h2> Account </h2>
	<form method="Post" action="Login.jsp">
		  <h1 >
		  	<%String name=session.getAttribute("userId").toString(); out.print("Welcome " + name + "!");  session.setAttribute("userID", name);%>
		  </h1>
	</form>
	<form method="Post" action="Auction.jsp">
		<input class="submitButton" type="submit" value="create auction" />
	</form>
	
	<form method="Post" action="JoinAuction.jsp">
		<input class="submitButton" type="submit" value="join auction" />
	</form>
	<form method="Post" action="MyAuctions.jsp">
		<input class="submitButton" type="submit" value="my auctions" />
	</form>
	<form method="Post" action="Alerts.jsp">
		<input class="submitButton" type="submit" value="alerts" />
	</form>
	<form method="Post" action="Login.jsp">
		  <input class="submitButton" type="submit" value="logout" />
		</form>
	<a href = "./MessageBoard.jsp">
		  <input class="submitButton" type="submit" value="Message Board"/>
		</a>
	<%if(session.getAttribute("user-type").toString().equals("rep")){  %>
		<a href = "./repAccountManagement.jsp">
		  <input class="submitButton" type="submit" value="Edit/Delete End_Users"/>
		</a>
		<a href = "./repBids.jsp">
		  <input class="submitButton" type="submit" value="Remove Bids"/>
		</a>
		<a href = "./repAuctions.jsp">
		  <input class="submitButton" type="submit" value="Remove Auctions"/>
		</a>
	<%} %>
	<%if(session.getAttribute("user-type").toString().equals("admin")){  %>
		<a href = "./adminOptions.jsp">
		  <input class="submitButton" type="submit" value="Admin Options"/>
		</a>
		<%} %>
	<%try{ 
		
		ApplicationConnection db = new ApplicationConnection();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		PreparedStatement str = con.prepareStatement("SELECT b.bidAmt,b.bidID, b.boolVal, b.increment, b.upperLim, a.currMaxBid, b.userID, a.aucID from bids b, auctions a where b.aucID = a.aucID AND b.boolVal = false");
		
		
		Random rnd = new Random();
		ResultSet result = str.executeQuery();
		while(result.next()){
			
			int bidID = rnd.nextInt();
			if (Boolean.parseBoolean(result.getString("boolVal")) == false && Integer.parseInt(result.getString("currMaxBid")) < Integer.parseInt(result.getString("upperLim") )&& Integer.parseInt(result.getString("currMaxBid")) != Integer.parseInt(result.getString("bidAmt")) 
					&& Integer.parseInt(result.getString("increment")) > 0 && Integer.parseInt(result.getString("upperLim")) > 0){
				
				int bidAmt = Integer.parseInt(result.getString("currMaxBid")) + Integer.parseInt(result.getString("increment"));
			
				out.print(Integer.parseInt(result.getString("currMaxBid")));
				out.print("___");
				out.print(Integer.parseInt(result.getString("increment")));
				out.print("----");
				out.print(bidAmt);
				out.print("--0--");
				PreparedStatement maxUpdate = con.prepareStatement("UPDATE auctions set currMaxBid = ? where aucID = ?;");
				maxUpdate.setInt(1,bidAmt);
				maxUpdate.setInt(2, Integer.parseInt(result.getString("aucID")));
				maxUpdate.executeUpdate();
				
				PreparedStatement boolUpdate = con.prepareStatement("UPDATE bids set boolVal = ? where bidID = ?");
				boolUpdate.setBoolean(1, true);
				boolUpdate.setInt(2, Integer.parseInt(result.getString("bidID")));
				boolUpdate.executeUpdate();
				
				if(bidAmt > Integer.parseInt(result.getString("upperLim"))){ bidAmt = Integer.parseInt(result.getString("upperLim"));}
				PreparedStatement newBid = con.prepareStatement("INSERT INTO bids(bidID, aucID, userID, upperLim, increment, bidAmt, boolVal) " + 
						"VALUES (?,?,?,?,?,?,?)");
				newBid.setInt(1,bidID);
				newBid.setInt(2, Integer.parseInt(result.getString("aucID")));
				newBid.setString(3,result.getString("userID"));
				newBid.setInt(4, Integer.parseInt(result.getString("upperLim")));
				newBid.setInt(5, Integer.parseInt(result.getString("increment")));
				newBid.setInt(6, bidAmt);
				newBid.setBoolean(7, false);
				newBid.executeUpdate();
				
				
			}
		}
		con.close();
		}catch(Exception e){
		out.print(e);
		
		
		
	}
	%>
	
	
</body>

</html>

