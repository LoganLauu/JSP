<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>

body{
text-align:center;
background-color:black;
color:white;
}

.table{
  margin-left: auto;
  margin-right: auto;
}

</style>

</head>
<body>

<div id="googleMap" style="width:50%;height:400px;float:right;"></div><br><br>

<script>
function myMap() {
var mapProp= {
  center:new google.maps.LatLng(1.297513,103.853937),
  zoom:16,
};
var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
var marker = {
		color:'red',
		position:new google.maps.LatLng(1.297513, 103.853937),
		map:map,
}
}
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjabxUqsFcPWiF5WDsugWUQpIcDlovdnQ&callback=myMap"></script>

	<div id="paragraph1" style="font-size:20px;">
	<h3> OBS </h3>
	<p> To contact us </p>
	<p> Hotline: +65 99887766 </p>
	<p> Fax : +65 66778899
	<p> Email : OBSOfficial@obs.com </p>
	<p> Address : 100 Victoria St, Singapore 188064 </p>
	</div>
	<br><br><br><br><br><br><br><br>
	<form>
	
<table class="table">
	<caption style="font-size:200%;">Feedback<br><br></caption>
	<tr>
		<td><label for="name">Enter Name: </label></td>
		<td><input type="text" id="name" name="name" required></td>
	</tr>
	<tr>
		<td><label for="email">Enter your Email: </label></td>
		<td><input type="email" id="email" name="email" required></td>
	</tr>
	<tr>
		<td><label for="phone">Enter phone: </label></td>
		<td><input type="tel" id="phone" name="phone" required></td>
	</tr>
	<tr>
		<td colspan="2"><textarea name="feedback" rows="7" cols="50">Please Write Your feedback</textarea></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align:center"><input type="submit" value="Submit"></td>
	</tr>
</table>
</form>

</body>
</html>