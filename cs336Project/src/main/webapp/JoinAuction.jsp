<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- This is the reference to the CSS style used for Account.jsp -->
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
	<h2> Auction details </h2>
	
	
	<form method="Post" >
	
	<label for="maxBid">Enter maximum current bidding price:</label>
	<br>
	<br>
	
	<input type="number" id="secretMin" name="maxCurr" />
		
	<br>
	<br>
	
	<h3>Choose item category</h3>
	<input type="radio" name="clothing" value="Hat"/> : Hat<br />
	<input type="radio" name="clothing" value="Shoe" /> : Shoe<br />
	<input type="radio" name="clothing" value="Shirt"/> : Shirt<br />
	

	<h3>Choose item characteristics</h3>
	<label for="brand">Brand:</label>
	<select name="brand" id="brand">
  <option value="nike">Nike</option>
  <option value="adidas">Adidas</option>
  <option value="puma">Puma</option>
  <option value="underArmor">Under Armor</option>
  </select>
  
  <label for="size">Size:</label>
	<select name="size" id="size">
  <option value="small">Small</option>
  <option value="medium">Medium</option>
  <option value="large">Large</option>
  <option value="extraLarge">Extra-large</option>
  </select>
  
  
  <label for="style">Style:</label>
	<select name="style" id="style">
  <option value="slimFit">Slim fit</option>
  <option value="regular">Regular</option>
  <option value="wide">Wide</option>
  <option value="short">Short</option>
  </select>
  
  
  <label for="color">Color:</label>
	<select name="color" id="color">
  <option value="black">Black</option>
  <option value="white">White</option>
  <option value="brown">Brown</option>
  <option value="blue">Blue</option>
  </select>
  
  
    <br>
	<br>
	

	<input class="submitButton" type="submit" value="search item" formaction="AuctionSearch.jsp" />
		  
	<br>
	<br>
	
	<input class="submitButton" type="submit" value="Set alert for item" formaction="Alerts.jsp"/>
		  
	<br>
	<br>
	</form>
	<form method="Post" action="AllAuctions.jsp">
			  <input class="submitButton" type="submit" value="see all auctions" />
		
	</form>
	</div>
</body>