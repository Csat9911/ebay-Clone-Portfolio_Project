<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Enter auction</title>
<link href="./css/Account.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- TODO: Use action="filename.jsp" to link front-end form submit to back-end -->
	<!-- On button press from form submit whatever file is in the action will be invoked a-->
	 <div class="imgcontainer">
    	<img src="images/BuyMe-logos_transparent.png" alt="Avatar" class="avatar">
  	</div>
	
	
	<div class="Form_Layout">
	<h2 > Bid details:  <%String name= request.getParameter("aucID"); out.print(name);%></h2>
	<form method="Post" action="PostBid.jsp" >
	<textarea name="aucID" readonly><%String str = request.getParameter("aucID"); out.print(str); %></textarea>
	
	<h3>Setup auto-bid</h3>
	<label for="increment">Enter increment amount:</label>
	
		<input type="number" id="increment" value= "0" min="0" name="increment" />
	
	<br>
	<br>
	<label for="increment">Enter upper limit:</label>
	<br>
	<br>
	
	<input type="number" id="upperLimit" value = "0" min="0" name="upperLimit" />
	<br>
	<br>
	
	
	<h3>Enter starting bid</h3>
	<label for="startingBid">Enter bid increment:</label>
	<br>
	<br>
	<input type="number" id="startingBid" name="startingBid" />
	<br>
	<br>
		

  
	
	<a href="Account.jsp">
		  <input class="submitButton" type="submit" value="Enter bid" />
		  </a>
	</form>
	<form method="Post" action="BidHistory.jsp">
	<input class="submitButton" type="submit" value="<%String st =str.split("--")[0]; out.print(st); %>  View bid history"  name="aucID"/>
	</form>
	
	<form method="Post" action="AuctionHistory.jsp">
	<input class="submitButton" type="submit" value="<%String st1 =str.split("--")[7]; out.print(st1); %> View user auction history" name="uID" />
	</form>
	
	<form method="Post" action="SimilarItems.jsp">
	<input class="submitButton" type="submit" value="<%out.print(st); %> View similar items"  name="itemType"/>
	</form>
	
	
	</div>
</body>