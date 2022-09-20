<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Portal</title>
</head>
<style>

body{
  background-image:url("data:image/jpeg;base64,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");
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;
  color:white;
  font-family: sans-serif;
}

.header{
backgroud-color: grey;
float:top;
color:black;
}

.sidenav {
  height: flexible;
  width: 160px;
  position: fixed;
  z-index: 1;
  top: 80px;
  left: 50px;
  background-color: #111;
  overflow-x: hidden;
}

.sidenav a, .dropdown-btn {
padding-left: 10px;
  text-decoration: none;
  font-size: 16px;
  color: #818181;
  display: block;
  border: none;
  background: none;
  width: 100%;
  text-align: left;
  cursor: pointer;
  outline: none;
}

.dropdown-btn:hover{
  color: orange;
}
.sidenav a:hover{
  color: orange;
}
.topnav{
position:fix;
float:right;
}

.iframe_a{
margin-left: 160px;
border:none;
margin:center;
padding-left: 200px;
}

.dropdown-container {
  display: none;
  background-color: #262626;
  padding-left: 8px;
}


</style>
<body>
<div class='header'>
<h1><center><a href="CustomerPage.jsp">Customer Portal</a></center></h1>
</div>

<div class ='topnav'>
	<form onsubmit='return checkForm();' action='SearchBook.jsp' target="iframe_a">
   <input type="text" placeholder="Search Book.." name="search" id="search">
   <button type="submit"><i class="fa fa-search">Search</i></button>
	</form>
	
</div>
<div class="sidenav">

	<a href="ViewBookPage.jsp" target=iframe_a style="padding-top:10px;">View Books</a><hr>
	<a href="PurchaseBookPage.jsp" target=iframe_a >Purchase Books</a><hr>
	<a href="TransactionHistory.jsp" target=iframe_a >Transaction History</a><hr>
	
	<button class="dropdown-btn">Book Categories 	
    <i class="fa fa-caret-down"></i>
  	</button>
  	<div class="dropdown-container">
    <a href="ViewRomance.jsp" target="iframe_a">Romance</a>
    <a href="ViewHorror.jsp" target="iframe_a">Horror</a>
    <a href="ViewFiction.jsp" target="iframe_a">Fiction</a>
    <a href="ViewFantasy.jsp" target="iframe_a">Fantasy</a>
    <a href="ViewPoetry.jsp" target="iframe_a">Poetry</a>
  	</div><hr>
	<a href="OBSHomePage.jsp" style="padding-bottom:10px;">Log out</a>
</div>

<div class="iframe_a" >
<iframe src="CustomerPageBG.jsp" name="iframe_a" height="780px" width="1000px" title="iframe" frameBorder="0"></iframe>
</div>

<script>
if (top.location.href != self.location.href)
   top.location.href = self.location.href;

var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var dropdownContent = this.nextElementSibling;
    if (dropdownContent.style.display === "block") {
      dropdownContent.style.display = "none";
    } else {
      dropdownContent.style.display = "block";
    }
  });
}

function checkForm(){
	var text = document.getElementById("search");	
	
	if(text.value.length == 0){
	alert("Please Enter Book Name");
	return false;
	}
}
</script>



</body>
</html>