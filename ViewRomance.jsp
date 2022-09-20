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
text-align:center;
color:white;
}	

.table th,
.table td {
    padding: 12px 15px;
	font-family: sans-serif;
}
</style>
<body>

<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "dbuser", "dbuser");
PreparedStatement search = conn.prepareStatement("select * from books where lower(book_cat)='romance'");

ResultSet searchResult = search.executeQuery();

if(searchResult.next()){
	Base64.Encoder encoder = Base64.getEncoder();
	String img = encoder.encodeToString(searchResult.getBytes(7));
	
	out.println("<html> <style>table, th, td {border:1px solid black;}</style><body><center><h2>Romance Books</center></h2>");
	out.println("<hr><br>");
	out.println("<div class='table'>");
	out.println("<center><table style='width:100%'>");
	out.println("<tr bgcolor='black' style='text-align:center'><th>Book id</th><th>Book Name</th><th>Book Author</th><th>Category</th><th>Book Stock</th><th>Price</th><th>Image</th></tr>");
	
	out.println("<tr style='text-align:center'><th>"+searchResult.getInt(1)+"</th> <th>"+searchResult.getString(2)+"</th> <th>"+searchResult.getString(3)+"</th><th>"+searchResult.getString(6)+"<th>"+searchResult.getInt(4)+"</th><th>$"+searchResult.getFloat(5)+"</th><th><img src='data:image/png;base64,"+img+"'width='100px' height='130px'></th></tr>");
	
	while(searchResult.next()){
		img = encoder.encodeToString(searchResult.getBytes(7));
		out.println("<tr style='text-align:center'><th>"+searchResult.getInt(1)+"</th> <th>"+searchResult.getString(2)+"</th> <th>"+searchResult.getString(3)+"</th><th>"+searchResult.getString(6)+"<th>"+searchResult.getInt(4)+"</th><th>$"+searchResult.getFloat(5)+"</th><th><img src='data:image/png;base64,"+img+"'width='100px' height='130px'></th></tr>");
	}
	
}else{
	out.println("<h2><center><font color='tomato'>No Book Found..</font></center></h2>");
}
out.println("</table></center>");

conn.close();
%>
</body>
</html>