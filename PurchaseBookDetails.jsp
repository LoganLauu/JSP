<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>

</head>
<style>

body{
color:white;
text-align:center;
font-family: sans-serif;

}
table, th, td{
border:1px solid black;
}
.table th,
.table td {
    padding: 12px 15px;
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

.space{
  width:20px;
  height:auto;
  display:inline-block;
}
</style>
<body>


<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "dbuser", "dbuser");
int book_id = Integer.parseInt(request.getParameter("bookid"));
PreparedStatement previewbook = conn.prepareStatement("select * from books where book_id =?");
previewbook.setInt(1,book_id);

ResultSet viewbooks = previewbook.executeQuery();

if(viewbooks.next()){
	out.println("<center><h2>Book Details</center></h2>");
	out.println("<hr><br>");
	out.println("<div class='table' id='top'><form onsubmit='return checkForm()' action='PO.jsp'>");
	out.println("<center><table style='width:75%'>");
	out.println("<tr bgcolor='black' style='text-align:center'><th>Book Name</th> <th>Book Author</th><th>Stock</th><th>Price</th></tr>");
	out.println("<th>"+viewbooks.getString(2)+"</th> <th>"+viewbooks.getString(3)+"</th><th>"+viewbooks.getInt(4)+"</th><th>$"+viewbooks.getFloat(5)+"</th></tr></table><br><br>");
}else{
	out.println("<h2><center><font color='tomato'>No Book Found..</font></center></h2>");
}

int bookid = Integer.parseInt(request.getParameter("bookid"));
out.println("<input type='hidden' id='bookid' name='bookid' value="+bookid+">");

out.println("<div><label>Quantity</label><div class='space'></div><input type='number' id='quantity' name='quantity' min='1' max='"+viewbooks.getInt(4)+"'><br><br>");
out.println("<input class='update' type='submit' value='Purchase'></form></div>");

%>

<script>

function checkForm(){
	var quantity = document.getElementById("quantity");

	if(quantity.value.length ==0 ){
		alert("Please Enter The Quantity");
		return false;
	}

}
</script>









</body>
</html>