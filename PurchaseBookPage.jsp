<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Base64" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<style>
body{
color:white;
text-align:center;
font-family: sans-serif;
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

.table, th, td{
	border:1px solid black;
	padding: 12px 15px;
 }
 
 .name-table, .author-table, .stock-table, .price-table{
 display:none;
 }
 
input[type=button]:hover{
background-color:grey;
color:white;
}
.purchase:hover{
background-color:lightgreen;
color:white;
}

</style>
<body>

<input type='button' value='Sort By Book Name' onclick='nametable();'>
<input type='button' value='Sort By Author' onclick='authortable();'>
<input type='button' value='Sort By Stock' onclick='stocktable();'>
<input type='button' value='Sort By Price' onclick='pricetable();'>

<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "dbuser", "dbuser");

PreparedStatement viewbook = conn.prepareStatement("select * from books ORDER BY BOOK_ID");
ResultSet viewbooks = viewbook.executeQuery();

if(viewbooks.next()){
	Base64.Encoder encoder = Base64.getEncoder();
	String img = encoder.encodeToString(viewbooks.getBytes(7));
	
	out.println("<center><h2>Purchase Books</center></h2>");
	out.println("<hr><br>");
	out.println("<div class='default-table' id='default-table'><form action='PurchaseBookDetails.jsp'>");
	out.println("<center><table style='width:100%'>");
	out.println("<tr bgcolor='black' style='text-align:center'><th>Purchase</th><th>Book id</th> <th>Book Name</th> <th>Book Author</th><th>Category</th><th>Book Stock</th><th>Price</th><th>Image</th></tr>");
	out.println("<tr><th><input type='radio' id='bookid' name='bookid' value='"+viewbooks.getInt(1)+"' checked></th>");
	out.println("<th>"+viewbooks.getInt(1)+"</th> <th>"+viewbooks.getString(2)+"</th><th>"+viewbooks.getString(3)+"</th><th>"+viewbooks.getString(6)+"</th><th>"+viewbooks.getInt(4)+"</th><th>$"+viewbooks.getFloat(5)+"</th><th><img src='data:image/png;base64,"+img+"'width='100px' height='130px'></th></tr>");

	while(viewbooks.next()){
		img = encoder.encodeToString(viewbooks.getBytes(7));
		out.println("<tr><th><input type='radio' id='bookid' name='bookid' value='"+viewbooks.getInt(1)+"'></th>");
		out.println("<th>"+viewbooks.getInt(1)+"</th> <th>"+viewbooks.getString(2)+"</th> <th>"+viewbooks.getString(3)+"</th><th>"+viewbooks.getString(6)+"</th><th>"+viewbooks.getInt(4)+"</th><th>$"+viewbooks.getFloat(5)+"</th><th><img src='data:image/png;base64,"+img+"'width='100px' height='130px'></th></tr>");
	}
	out.println("</tr></table><br><br>");
}else{
	out.println("<h2><center><font color='tomato'>No Book Found..</font></center></h2>");
}
out.println("<input class='purchase' type='submit' value='Purchase'></form></div>");

// ----------------------------------------------------------------------------------------------------------------------------
PreparedStatement viewbook_name = conn.prepareStatement("select * from books order by book_name");
ResultSet viewbooks_name = viewbook_name.executeQuery();

if(viewbooks_name.next()){
	Base64.Encoder encoder = Base64.getEncoder();
	String img = encoder.encodeToString(viewbooks_name.getBytes(7));
	
	out.println("<div class='name-table' id='name-table'><form action='PurchaseBookDetails.jsp'>");
	out.println("<center><table style='width:100%'>");
	out.println("<tr bgcolor='black' style='text-align:center'><th>Purchase</th><th>Book id</th> <th>Book Name</th> <th>Book Author</th><th>Category</th><th>Book Stock</th><th>Price</th><th>Image</th></tr>");
	out.println("<tr><th><input type='radio' id='bookid' name='bookid' value='"+viewbooks_name.getInt(1)+"' checked></th>");
	out.println("<th>"+viewbooks_name.getInt(1)+"</th> <th>"+viewbooks_name.getString(2)+"</th> <th>"+viewbooks_name.getString(3)+"</th><th>"+viewbooks_name.getString(6)+"</th><th>"+viewbooks_name.getInt(4)+"</th><th>$"+viewbooks_name.getFloat(5)+"</th><th><img src='data:image/png;base64,"+img+"'width='100px' height='130px'></th></tr>");

	while(viewbooks_name.next()){
		img = encoder.encodeToString(viewbooks_name.getBytes(7));

		out.println("<tr><th><input type='radio' id='bookid' name='bookid' value='"+viewbooks_name.getInt(1)+"'></th>");
		out.println("<th>"+viewbooks_name.getInt(1)+"</th> <th>"+viewbooks_name.getString(2)+"</th> <th>"+viewbooks_name.getString(3)+"</th><th>"+viewbooks_name.getString(6)+"</th><th>"+viewbooks_name.getInt(4)+"</th><th>$"+viewbooks_name.getFloat(5)+"</th><th><img src='data:image/png;base64,"+img+"'width='100px' height='130px'></th></tr>");	
	}
	out.println("</tr></table><br><br>");
}else{
	out.println("<h2><center><font color='tomato'>No Book Found..</font></center></h2>");
}
out.println("<input class='purchase' type='submit' value='Purchase'></form></div>");

//----------------------------------------------------------------------------------------------------------------------------

PreparedStatement viewbook_author = conn.prepareStatement("select * from books order by BOOK_AUTHOR");
ResultSet viewbooks_author = viewbook_author.executeQuery();

if(viewbooks_author.next()){
	Base64.Encoder encoder = Base64.getEncoder();
	String img = encoder.encodeToString(viewbooks_author.getBytes(7));
	
	out.println("<div class='author-table' id='author-table'><form action='PurchaseBookDetails.jsp'>");
	out.println("<center><table style='width:100%'>");
	out.println("<tr bgcolor='black' style='text-align:center'><th>Purchase</th><th>Book id</th> <th>Book Name</th> <th>Book Author</th><th>Category</th><th>Book Stock</th><th>Price</th><th>Image</th></tr>");
	out.println("<tr><th><input type='radio' id='bookid' name='bookid' value='"+viewbooks_author.getInt(1)+"' checked></th>");
	out.println("<th>"+viewbooks_author.getInt(1)+"</th> <th>"+viewbooks_author.getString(2)+"</th> <th>"+viewbooks_author.getString(3)+"</th><th>"+viewbooks_author.getString(6)+"</th><th>"+viewbooks_author.getInt(4)+"</th><th>$"+viewbooks_author.getFloat(5)+"</th><th><img src='data:image/png;base64,"+img+"'width='100px' height='130px'></th></tr>");

	while(viewbooks_author.next()){
		img = encoder.encodeToString(viewbooks_author.getBytes(7));

		out.println("<tr><th><input type='radio' id='bookid' name='bookid' value='"+viewbooks_author.getInt(1)+"'></th>");
		out.println("<th>"+viewbooks_author.getInt(1)+"</th> <th>"+viewbooks_author.getString(2)+"</th> <th>"+viewbooks_author.getString(3)+"</th><th>"+viewbooks_author.getString(6)+"</th><th>"+viewbooks_author.getInt(4)+"</th><th>$"+viewbooks_author.getFloat(5)+"</th><th><img src='data:image/png;base64,"+img+"'width='100px' height='130px'></th></tr>");	
	}
	out.println("</tr></table><br><br>");
}else{
	out.println("<h2><center><font color='tomato'>No Book Found..</font></center></h2>");
}
out.println("<input class='purchase' type='submit' value='Purchase'></form></div>");

//----------------------------------------------------------------------------------------------------------------------------

PreparedStatement viewbook_stock = conn.prepareStatement("select * from books order by BOOK_STOCK");
ResultSet viewbooks_stock = viewbook_stock.executeQuery();

if(viewbooks_stock.next()){
	Base64.Encoder encoder = Base64.getEncoder();
	String img = encoder.encodeToString(viewbooks_stock.getBytes(7));
	
	out.println("<div class='stock-table' id='stock-table'><form action='PurchaseBookDetails.jsp'>");
	out.println("<center><table style='width:100%'>");
	out.println("<tr bgcolor='black' style='text-align:center'><th>Purchase</th><th>Book id</th> <th>Book Name</th> <th>Book Author</th><th>Category</th><th>Book Stock</th><th>Price</th><th>Image</th></tr>");
	out.println("<tr><th><input type='radio' id='bookid' name='bookid' value='"+viewbooks_stock.getInt(1)+"' checked></th>");
	out.println("<th>"+viewbooks_stock.getInt(1)+"</th> <th>"+viewbooks_stock.getString(2)+"</th> <th>"+viewbooks_stock.getString(3)+"</th><th>"+viewbooks_stock.getString(6)+"</th><th>"+viewbooks_stock.getInt(4)+"</th><th>$"+viewbooks_stock.getFloat(5)+"</th><th><img src='data:image/png;base64,"+img+"'width='100px' height='130px'></th></tr>");

	while(viewbooks_stock.next()){
		img = encoder.encodeToString(viewbooks_stock.getBytes(7));

		out.println("<tr><th><input type='radio' id='bookid' name='bookid' value='"+viewbooks_stock.getInt(1)+"'></th>");
		out.println("<th>"+viewbooks_stock.getInt(1)+"</th> <th>"+viewbooks_stock.getString(2)+"</th> <th>"+viewbooks_stock.getString(3)+"</th><th>"+viewbooks_stock.getString(6)+"</th><th>"+viewbooks_stock.getInt(4)+"</th><th>$"+viewbooks_stock.getFloat(5)+"</th><th><img src='data:image/png;base64,"+img+"'width='100px' height='130px'></th></tr>");	
	}
	out.println("</tr></table><br><br>");
}else{
	out.println("<h2><center><font color='tomato'>No Book Found..</font></center></h2>");
}
out.println("<input class='purchase' type='submit' value='Purchase'></form></div>");

//----------------------------------------------------------------------------------------------------------------------------

PreparedStatement viewbook_price = conn.prepareStatement("select * from books order by price");
ResultSet viewbooks_price = viewbook_price.executeQuery();

if(viewbooks_price.next()){
	Base64.Encoder encoder = Base64.getEncoder();
	String img = encoder.encodeToString(viewbooks_price.getBytes(7));
	
	out.println("<div class='price-table' id='price-table'><form action='PurchaseBookDetails.jsp'>");
	out.println("<center><table style='width:100%'>");
	out.println("<tr bgcolor='black' style='text-align:center'><th>Purchase</th><th>Book id</th> <th>Book Name</th> <th>Book Author</th><th>Category</th><th>Book Stock</th><th>Price</th><th>Image</th></tr>");
	out.println("<tr><th><input type='radio' id='bookid' name='bookid' value='"+viewbooks_price.getInt(1)+"' checked></th>");
	out.println("<th>"+viewbooks_price.getInt(1)+"</th> <th>"+viewbooks_price.getString(2)+"</th> <th>"+viewbooks_price.getString(3)+"</th><th>"+viewbooks_price.getString(6)+"</th><th>"+viewbooks_price.getInt(4)+"</th><th>$"+viewbooks_price.getFloat(5)+"</th><th><img src='data:image/png;base64,"+img+"'width='100px' height='130px'></th></tr>");

	while(viewbooks_price.next()){
		img = encoder.encodeToString(viewbooks_price.getBytes(7));

		out.println("<tr><th><input type='radio' id='bookid' name='bookid' value='"+viewbooks_price.getInt(1)+"'></th>");
		out.println("<th>"+viewbooks_price.getInt(1)+"</th> <th>"+viewbooks_price.getString(2)+"</th> <th>"+viewbooks_price.getString(3)+"</th><th>"+viewbooks_price.getString(6)+"</th><th>"+viewbooks_price.getInt(4)+"</th><th>$"+viewbooks_price.getFloat(5)+"</th><th><img src='data:image/png;base64,"+img+"'width='100px' height='130px'></th></tr>");	
	}
	out.println("</tr></table><br><br>");
	
}else{
	out.println("<h2><center><font color='tomato'>No Book Found..</font></center></h2>");
}
out.println("<input class='purchase' type='submit' value='Purchase'></form></div>");


//----------------------------------------------------------------------------------------------------------------------------




conn.close();
%>


<script>

function nametable(){
	  document.getElementById("default-table").style.display = "none";
	  document.getElementById("author-table").style.display = "none";
	  document.getElementById("stock-table").style.display = "none";
	  document.getElementById("price-table").style.display = "none";
	  document.getElementById("name-table").style.display = "inline";

}
function authortable(){
	  document.getElementById("default-table").style.display = "none";
	  document.getElementById("stock-table").style.display = "none";
	  document.getElementById("price-table").style.display = "none";
	  document.getElementById("name-table").style.display = "none";
	  document.getElementById("author-table").style.display = "inline";

}
function pricetable(){
	  document.getElementById("default-table").style.display = "none";
	  document.getElementById("author-table").style.display = "none";
	  document.getElementById("stock-table").style.display = "none";
	  document.getElementById("name-table").style.display = "none";
	  document.getElementById("price-table").style.display = "inline";

}

function stocktable(){
	  document.getElementById("default-table").style.display = "none";
	  document.getElementById("author-table").style.display = "none";
	  document.getElementById("price-table").style.display = "none";
	  document.getElementById("name-table").style.display = "none";
	  document.getElementById("stock-table").style.display = "inline";

}

function cattable(){
	  document.getElementById("default-table").style.display = "none";
	  document.getElementById("author-table").style.display = "none";
	  document.getElementById("price-table").style.display = "none";
	  document.getElementById("name-table").style.display = "none";
	  document.getElementById("stock-table").style.display = "inline";

}

</script>


























</body>
</html>