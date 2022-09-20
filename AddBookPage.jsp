<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
.main{
text-align:center;
color:white;
font-family: sans-serif;

}

.spaceA{
width:35px;
height:auto;
display:inline-block;
}
.spaceB{
width:35px;
height:auto;
display:inline-block;
}
.spaceC{
width:44px;
height:auto;
display:inline-block;
}
.spaceD{
width:17px;
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
.button{
padding-left: 130px;
}
.add {
  color: purple;
  background-color: rgba(255, 255, 255, 1);
  border: 1px solid rgba(104, 85, 224, 1);
}

.add:hover {
  color: white;
  width:;
  box-shadow: 0 0 20px rgba(104, 85, 224, 0.6);
  background-color: lightgreen;
}

</style>
<body>

<div class="main">

<h2 style="text-align:center;">Add Books Form</h2>
<hr>
<br>

<form onsubmit='return checkForm();' action='AddBook.jsp' enctype="multipart/form-data">
<label>Enter Book Name</label>
<input type="text" id="bookname" name="bookname"><br><br>

<label>Enter Author</label>
<div class="spaceA"></div>
<input type="text" id="author" name="author"><br><br>

<label>Select Stock</label>
<div class="spaceB"></div>
<input type="number" id="stock" name="stock"><br><br>

<label>Enter Price</label>
<div class="spaceC"></div>
<input type="number" id="price" step='0.01' name="price"><br><br>

<label>Enter Category</label>
<div class="spaceD"></div>
<input type="text" id="category" name="category"><br><br>

<label for="img">Select image:</label>
<input type="file" id="img" name="img" accept="image/*" onchange="previewFile();">
<br>
<img src="" height="200" alt="Image preview...">
<br><br>

<div class='button'>
<input class='add' type="submit" value="Add">
</div>
</form>

</div>

<script>
function checkForm(){
	var bookname = document.getElementById("bookname");
	var author = document.getElementById("author");
	var stock = document.getElementById("stock");
	var price = document.getElementById("price");
	var category = document.getElementById("category");
    var img = document.getElementById("img");
    
	if(bookname.value.length == 0){
		alert("Enter Bookname");
		return false;
	}
	
	if(author.value.length == 0){
		alert("Enter Author");
		return false;
	}
	
	if(stock.value.length == 0){
		alert("Enter Stock");
		return false;
	}
	
	if(price.value.length == 0){
		alert("Enter Price");
		return false;
	}
	
	if(category.value.length == 0){
		alert("Enter Category");
		return false;
	}
	
	if(img.files.length == 0 ){
        alert("Pleae add Image");
        return false;
    } 
	
	return true;
}


function previewFile() {
	  var preview = document.querySelector('img');
	  var file    = document.querySelector('input[type=file]').files[0];
	  var reader  = new FileReader();

	  reader.onloadend = function () {
	    preview.src = reader.result;
	  };

	  if (file) {
	    reader.readAsDataURL(file);
	  } else {
	    preview.src = "";
	  }
	}
</script>


</body>
</html>