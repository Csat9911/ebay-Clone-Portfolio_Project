<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
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
		//INSERT INTO `admin` VALUES ('adminUser1','adminPassWord!');
		//Get the database connection
		ApplicationConnection db = new ApplicationConnection();	
		Connection con = db.getConnection();
		String userName = request.getParameter("UserNameField"); 
		String NewuserName = request.getParameter("New_Username"); 
		//Create a SQL statement
		Statement stmt = con.createStatement();
		String str1 = "UPDATE endUsers e SET userID = " + "\"" + NewuserName + "\"" + " WHERE e.userID = " + "\"" + userName + "\"" + ";";
		out.println(str1);
		//Make an insert statement for the Sells table:
		//String str = "SELECT * FROM admin a WHERE a.adminID = " + "\""+ newUserID + "\"" + " AND a.password = " + "\"" + newPassword + "\"" + ";";
	    String str = "SELECT * FROM endUsers e WHERE e.userID = " + "\""+ userName + "\"" +";";
	    out.println(str);
		//String str3 = "SELECT * FROM customerReps c WHERE c.repID = " + "\""+ newUserID + "\"" + " AND c.password = " + "\"" + newPassword + "\"" + ";";
		//Run the query against the database.

		ResultSet result = stmt.executeQuery(str);
		

		if(result.next()){
			Statement stmt1 = con.createStatement();
			stmt1.executeUpdate(str1);
			
		}

		else {
			out.println("Error");
		}

			//out.println("There was an error trying to Login to your account, Please Click Login To Try Again <a href='Login.jsp'>Login</a>");
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		String redirectURL = "../Account.jsp";
		response.sendRedirect(redirectURL);
		
	} catch (SQLException e) {
			//out.print("Error trying to Login try again <a href='Account.jsp'>My Account</a>");
		String redirectURL = "../ErrorPage.jsp";
		response.sendRedirect(redirectURL);
		
	}
%>
</body>
</html>