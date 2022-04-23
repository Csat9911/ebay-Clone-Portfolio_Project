<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*, java.time.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	try {
	
		ApplicationConnection db = new ApplicationConnection();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		
		Random rnd = new Random();
		
		int bidID = rnd.nextInt();
		
		String auc_details = request.getParameter("aucID");
		int aucID = Integer.parseInt(auc_details.split("--")[0]);
		String userID = session.getAttribute("userID").toString();
	
		int firstBid = Integer.parseInt(request.getParameter("startingBid")) + Integer.parseInt(auc_details.split("--")[1]);
		out.print(firstBid);
		PreparedStatement str = con.prepareStatement("UPDATE auctions set currMaxBid = ? where aucID = ?;");
		str.setInt(1,firstBid);
		str.setInt(2,aucID);
		out.print(0);
		str.executeUpdate();
		out.print(1);
		String insertBid = "INSERT INTO bids(bidID, aucID, userID, upperLim, increment, bidAmt, boolVal) " + 
		"VALUES (?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(insertBid);
		ps.setInt(1, bidID);
		ps.setInt(2, aucID);
		ps.setString(3, userID);
		ps.setInt(4, 0);
		ps.setInt(5, 0);
		ps.setInt(6, firstBid);
		ps.setBoolean(7, true);
		out.print(1);
		ps.executeUpdate();
		out.println("Bid successfully placed! <a href= 'Account.jsp'> Account</a>");
		db.closeConnection(con);
	}catch(Exception ex) {
		out.println("Could not enter bid, try again! <a href= 'MyAuctions.jsp'>My auctions</a>");
	}
	%>
</body>
</html>