<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
<style>
.footer {
    border-width: 0.3em;
	border-style: solid;
	border-color: black;
    background-color: #000000;
	width: 100%;
	height: 15%;
	
	font-style: oblique;
	text-align: center;
	font-size: 110%;
	color: #f2f2f2;
	position: relative;
	display: flex;
	bottom: 0;
}
.footer img{
	width: 15px;
	height: 15px;
}

#Mascotte  {
width: 7%;
height: 7%;
margin-left: 22%;
position: relative;
}

p {
margin: 3% 0% 0% 8%;
}

</style>
</head>
<body>

<div class="footer">
<img id="Mascotte" src="images/system/Mascotte.PNG" alt="Mascotte LG">
<p>
&copy; 2025, LimitedGames<br>
metodi di pagamento: <img src="images/imgCarte/logo-visa.jpg">  VISA
<img src="images/imgCarte/MasterCard_Logo.png"> MASTERCARD<br>
 chi siamo: GitHub </p>
 </div>
</body>
</html>