<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

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
table, th, td{
border:1px solid black;
}

.table th,
.table td {
    padding: 12px 15px;
}

</style>
<body>


<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "dbuser", "dbuser");
String username = (String)session.getAttribute("loggedin");
PreparedStatement ths = conn.prepareStatement
("SELECT po.order_id , b.book_name , po.quantity, po.quantity * b.price as total_price FROM purchase_order po left JOIN books b ON po.book_id = b.book_id right join obsuser u ON po.obsuser_id = u.user_id where obsuser_id = ? ORDER BY po.order_id");
ths.setString(1, username);

ResultSet user_ths = ths.executeQuery();
if(user_ths.next()){
	out.println("<center><h2>Transaction History</center></h2>");
	out.println("<hr><br>");
	
	out.println("<div class='table' id='top'>");
	out.println("<center><table style='width:100%'>");
	out.println("<tr bgcolor='black' style='text-align:center'><th>Purchase id</th> <th>Book Name</th><th>Quantity</th><th>Total Price</th></tr>");
	out.println("<th>"+user_ths.getInt(1)+"</th> <th>"+user_ths.getString(2)+"</th><th>"+user_ths.getInt(3)+"</th><th>$"+user_ths.getFloat(4)+"</th></tr><br><br>");
	
	while(user_ths.next()){
		out.println("<th>"+user_ths.getInt(1)+"</th> <th>"+user_ths.getString(2)+"</th><th>"+user_ths.getInt(3)+"</th><th>$"+user_ths.getFloat(4)+"</th></tr>");
	}
	
	out.println("</table>");
}else{
	out.println("<h2><center><font color='white'>No Transaction Found..</font></center></h2>");
}

%>

</body>
</html>