<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
    
<%@ page import="java.io.*,java.jutil.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	//INSERT INTO `admin` VALUES ('adminUser1','adminPassWord!');
			//Get the database connection
			ApplicationConnection db = new ApplicationConnection();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Get parameters from the HTML form at the index.jsp
			String newEmail = request.getParameter("Register-Email");
			String newUserID = request.getParameter("Register-UserID");
			String newPassword = request.getParameter("Register-Password");

			//Make an insert statement for the Sells table:
			String insert = "INSERT INTO customerReps(email,userID,password)"
					+ "VALUES (?,?,?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself	
			ps.setString(1, newEmail);
			ps.setString(2, newUserID);
			ps.setString(3, newPassword);
			ps.executeUpdate();

			out.println("Thank you for registering ! Please <a href='Login.jsp'>Login</a> to continue.");
					
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
		} catch (Exception ex) {
			out.println("There was an error trying to create your account, Please Click Register To Try Again <a href='Register.jsp'>Register</a>");
		}
%>
</body>
</html>