<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1> Post A Message to Ask</h1>
<form method="Post" action="MessagePostRequest.jsp">
	<textarea name = "Reply-Area" placeholder="Ask Here" cols= "50" rows= "5" required></textarea>
	<input class="submitButton" type="submit" value="submit" />
</form>
</body>
</html>