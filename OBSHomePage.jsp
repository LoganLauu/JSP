<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>

.topnav {
  position: relative;
  overflow: hidden;
  background-color: #333;
  height: 50px;
}

.topnav-center a {
  float: none;
  position: absolute;
  color: #f2f2f2;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-family: sans-serif;
  
}
.topnav-aboutus a {
  float: none;
  position: absolute;
  color: #f2f2f2;
  top: 50%;
  left: 60%;
  transform: translate(-50%, -50%);
  font-family: sans-serif;
}
.topnav-contactus a {
  float: none;
  position: absolute;
  color: #f2f2f2;
  top: 50%;
  left: 65%;
  transform: translate(-50%, -50%);
  font-family: sans-serif;
}

iframe {
    background-color: #DBF9FC;
    display: block;
    margin: 0 auto;
}

div.iframe-container {
    dsiplay : flex;
    justify-content : center;
}
body{
text-align:center;
}
</style>


<div class="topnav">
<div class="topnav-center">
<a href="OBSLogin.jsp" target="iframe_a">Login</a>
</div>
<div class="topnav-aboutus">
<a href="AboutUsPage.jsp" target="iframe_a">About Us</a>
</div>
<div class="topnav-contactus"> 
<a href="ContactUsPage.jsp" target="iframe_a">Contact Us</a>
</div>
</div>



<body>
<div class="iframe_a">
<center><iframe src="HomePageBG.jsp" name="iframe_a" height="800px" width="1250px" title="iframe"frameBorder="0"></iframe></center>
</div>

</body>

</html>