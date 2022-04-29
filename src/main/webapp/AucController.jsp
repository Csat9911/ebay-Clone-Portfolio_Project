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
		
		String aucDate =request.getParameter("closeDateTime");
		
		int secretMin = Integer.parseInt(request.getParameter("secretMin"));
		
		String userID = session.getAttribute("userId").toString();
		
		Random rnd = new Random();;
		int aucID = rnd.nextInt();
		int itemID = rnd.nextInt();
		
		String category= request.getParameter("category");
	
		String brand = request.getParameter("brand");
		String size = request.getParameter("size");
		String style = request.getParameter("style");
		String color = request.getParameter("color");
		
		String insertClothing = "INSERT INTO clothing(itemID, category, brand, size, style, color)" +
			"VALUES (?,?,?,?,?,?)";
		PreparedStatement psCl = con.prepareStatement(insertClothing);
		psCl.setInt(1, itemID);
		psCl.setString(2, category);
		psCl.setString(3, brand);
		psCl.setString(4, size);
		psCl.setString(5,style);
		psCl.setString(6,color);
	
		psCl.executeUpdate();
		
		String insertAuc = "INSERT INTO auctions(aucID,userID,closeDateTime,secretMin,itemID,currMaxBid)" +
				"VALUES (?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(insertAuc);
		ps.setInt(1,aucID);
		ps.setString(2,userID);
		ps.setString(3,aucDate);
		ps.setInt(4,secretMin);
		ps.setInt(5,itemID);
		ps.setInt(6, 0);
		
		ps.executeUpdate();
		out.println("Auction created successfully! <a href= 'Account.jsp'>My account</a>");
		con.close();
		
	}catch(Exception ex) {
		out.println("Could not create auction, try again! <a href= 'Auction.jsp'>Create auction</a>");
	}
	%>
	

</body>
</html>