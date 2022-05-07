<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>removeBids</title>
</head>
<body>
<h1> Remove a Bid</h1>
<h2>Please Type in the User-ID of the Bid you Would Like to Delete</h2>
		<br>
		<label><b>User-ID</b></label>
		<br>
		<form method="Post" action="./RepFunctions/removeBids.jsp">
			<input class="textButton" type="text" name="Bid_userName" placeholder="User-ID" required/>
			<input name = "button1" class="submitButton" type="submit" placeholder = "Find User's Bids">
		</form>
</body>
</html>