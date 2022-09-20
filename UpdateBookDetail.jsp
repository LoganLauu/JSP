<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<style>

.main{
text-align:center;
color:white;
font-family: sans-serif;
}

.stockbox{
display:none;
}
.pricebox{
display:none;
}
.space{
  width:175px;
  height:auto;
  display:inline-block;
}
.spaceA{
  width:165px;
  height:auto;
  display:inline-block;
}

input {
  cursor: pointer;
  border: 0;
  border-radius: 4px;
  font-weight: 600;
  margin: 0 10px;
  width: 200px;
  padding: 10px 0;
  box-shadow: 0 0 20px rgba(104, 85, 224, 0.2);
  transition: 0.4s;
}

.update {
  color: purple;
  background-color: rgba(255, 255, 255, 1);
  border: 1px solid rgba(104, 85, 224, 1);
}

.update:hover {
  color: white;
  width:;
  box-shadow: 0 0 20px rgba(104, 85, 224, 0.6);
  background-color: lightgreen;
}

</style>
<body>
<%
int bookid = Integer.parseInt(request.getParameter("bookid"));
out.println("<form onsubmit='return checkForm();' action='UpdateBook.jsp'>");
out.println("<input type='hidden' id='bookid' name='bookid' value="+bookid+">");
%>

<div class="main">

<div class="updateType">
<label><center>Stock</label>
<div class='space'></div>
<label>Price</center></label>


<input type=radio name='updatetype' value='stock' onclick='showStockBox()'>

<input type=radio name='updatetype' value='price' onclick='showPriceBox()'>
<br><br><br>
</div>



<div class="stockbox" id="stockbox">
<label>Enter New Stock</label>
<input type="number" id="stock" name="stock"><br><br>
<input class="update" type="submit" value="Update">
</div>


	
<div class="pricebox" id="pricebox">
<label>Enter New Price</label>
<input type="number" id="price" step='0.01' name="price"><br><br>
<input class="update" type="submit" value="Update">
</div>

</form>
</div>


<script>
function showStockBox(){
	  document.getElementById("pricebox").style.display = "none";
	  document.getElementById("stockbox").style.display = "inline-block";
}

function showPriceBox(){
	  document.getElementById("stockbox").style.display = "none";
	  document.getElementById("pricebox").style.display = "inline-block";
}

function checkForm(){
	var stock = document.getElementById("stock");
	var price = document.getElementById("price");


	if(stock.value.length ==0 &&  price.value.length ==0){
		alert("Please Enter New Amount");
		return false;
	}
	
	return true;
}
</script>
</body>
</html>