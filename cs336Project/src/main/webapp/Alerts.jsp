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
  	<br>
  	<br>
  	<form>
  	<%try{ 
		
		ApplicationConnection db = new ApplicationConnection();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		String userID = session.getAttribute("userID").toString();
		
		PreparedStatement str = 
		con.prepareStatement("SELECT  DISTINCT a.aucID, a.currMaxBid, s.category, s.brand, s.size, s.style, s.color,a.userID, a.closeDateTime from clothing s, auctions a, bids b where s.itemID = a.itemID AND b.aucID = a.aucID AND b.userID = ? ");		
		str.setString(1,userID);
		ResultSet result2 = str.executeQuery();
		
		PreparedStatement str1 = con.prepareStatement("SELECT aucID, userID, max(bidAmt) as maxBid from bids group by aucID, userID");
		ResultSet result3 = str1.executeQuery();
		

		while(result2.next()){
			while(result3.next()){
				if (result2.getString("aucID").equals(result3.getString("aucID")) && !userID.equals(result3.getString("userID"))
						&& Integer.parseInt(result2.getString("currMaxBid")) == Integer.parseInt(result3.getString("maxBid"))){
					out.print("There is a higher bid on auction: "+ result3.getString("aucID") + ". Current Bid price is : "+ result2.getString("currMaxBid"));
					%>
					<br>
					<br>
					<%
				}
			}
							
		}
		con.close();
		}catch(Exception e){
		out.print(e);
		
		
		
	}%>
	</form>
	<form>
	<%
	try{ 
		ApplicationConnection db = new ApplicationConnection();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		String userID = session.getAttribute("userID").toString();
		
		PreparedStatement str = 
		con.prepareStatement("SELECT  DISTINCT a.aucID,b.upperLim, a.currMaxBid, s.category, s.brand, s.size, s.style, s.color,a.userID, a.closeDateTime from clothing s, auctions a, bids b where s.itemID = a.itemID AND b.aucID = a.aucID AND b.userID = ? ");		
		str.setString(1,userID);
		ResultSet result2 = str.executeQuery();
		
		

		while(result2.next()){
				if (Integer.parseInt(result2.getString("upperLim")) > 0 && Integer.parseInt(result2.getString("upperLim")) < Integer.parseInt(result2.getString("currMaxBid"))){
					out.print("Upper limit for autobid on auction: "+ result2.getString("aucID") + " passed. Current Bid price is : "+ result2.getString("currMaxBid"));
					%>
					<br>
					<br>
					<%
				}
		}
							
		con.close();
		}catch(Exception e){
		out.print(e);
		}
		%>
	</form>
	
	<form>
		<%
	try{ 
		ApplicationConnection db = new ApplicationConnection();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		String userID = session.getAttribute("userID").toString();
		
		PreparedStatement str = 
		con.prepareStatement("SELECT  DISTINCT a.aucID, a.currMaxBid,a.secretMin,a.userID, a.closeDateTime from clothing s, auctions a, bids b where s.itemID = a.itemID AND b.aucID = a.aucID AND b.userID = ?  and a.closeDateTime < now() and   a.closeDateTime between date_sub(now(), interval 30 day) AND NOW();");		
		str.setString(1,userID);
		ResultSet result2 = str.executeQuery();
		
		

		while(result2.next()){
				if (Integer.parseInt(result2.getString("secretMin")) < Integer.parseInt(result2.getString("currMaxBid"))){
					out.print("You won auction: "+ result2.getString("aucID") + "!. Your final bid is : "+ result2.getString("currMaxBid"));
					%>
					<br>
					<br>
					<%
				}
		}
							
		con.close();
		}catch(Exception e){
		out.print(e);
		}
		%>
	</form>
	
		<form>
		<%
	try{ 
		ApplicationConnection db = new ApplicationConnection();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		String userID = session.getAttribute("userID").toString();
		
		PreparedStatement str = 
		con.prepareStatement("select a.aucID, a.closeDateTime, s.category, s.brand, s.size, s.style,a.currMaxBid ,s.color from auctions a, clothing s where a.itemID = s.itemID and a.closeDateTime > now()");
		ResultSet result2 = str.executeQuery();
		
		

		while(result2.next()){
				if ( request.getParameter("clothing") != null && request.getParameter("clothing").equals(result2.getString("category")) && request.getParameter("brand").equals(result2.getString("brand")) && request.getParameter("size").equals(result2.getString("size")) && request.getParameter("style").equals(result2.getString("style"))
						&& request.getParameter("color").equals(result2.getString("color"))){
					out.print("Requested item is available in: "+ result2.getString("aucID") + "!. Current max bid is: "+ result2.getString("currMaxBid"));
					%><br>
					<br>
					<%
				}else{
					
				}
		}
							
		con.close();
		}catch(Exception e){
		out.print(e);
		}
		%>
	</form>
	
	
</body>
</html>