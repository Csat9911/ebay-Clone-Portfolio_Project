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
		int upperLim = Integer.parseInt(request.getParameter("upperLimit"));
		int increment = Integer.parseInt(request.getParameter("increment"));
		int firstBid = Integer.parseInt(request.getParameter("startingBid")) + Integer.parseInt(auc_details.split("--")[1]);
		PreparedStatement str = con.prepareStatement("UPDATE auctions set currMaxBid = ? where aucID = ?;");
		str.setInt(1,firstBid);
		str.setInt(2,aucID);
		
		str.executeUpdate();
		String insertBid = "INSERT INTO bids(bidID, aucID, userID, upperLim, increment, bidAmt, boolVal) " + 
		"VALUES (?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(insertBid);
		ps.setInt(1, bidID);
		ps.setInt(2, aucID);
		ps.setString(3, userID);
		ps.setInt(4, upperLim);
		ps.setInt(5, increment);
		ps.setInt(6, firstBid);
		ps.setBoolean(7, false);
		ps.executeUpdate();
		out.println("Bid successfully placed! <a href= 'Account.jsp'> Account</a>");
		db.closeConnection(con);
	}catch(Exception ex) {
		out.println("Could not enter bid, try again! <a href= 'JoinAuction.jsp'>Join auction</a>");
	}
	%>
</body>
</html>