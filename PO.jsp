<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
int bookid = Integer.parseInt(request.getParameter("bookid"));
int quantity = Integer.parseInt(request.getParameter("quantity"));
String username = (String)session.getAttribute("loggedin");

System.out.println(bookid);
System.out.println(quantity);
System.out.println(username);

	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "dbuser", "dbuser");
		
		PreparedStatement add_PO = conn.prepareStatement("insert into purchase_order values(po_seq.nextval,?,?,?)");
		PreparedStatement stockleft = conn.prepareStatement("update books set BOOK_STOCK = book_stock - ? where book_id = ?");
		stockleft.setInt(1, quantity);
		stockleft.setInt(2, bookid);
		
		add_PO.setInt(1, bookid);
		add_PO.setString(2,username);
		add_PO.setInt(3,quantity);
		
		int addPO = add_PO.executeUpdate();
		int stock_left = stockleft.executeUpdate();
		if(addPO > 0){
			RequestDispatcher rd = request
					.getRequestDispatcher("PurchaseBookDetails.jsp");
			rd.include(request, response);
			out.println("<h2><center><font color='Green'>Book Successfully Purchased!</font></center></h2>");
			
		}else{
			RequestDispatcher rd = request
					.getRequestDispatcher("PurchaseBookDetails.jsp");
			rd.include(request, response);
			out.println("<h2><center><font color='red'>Book Fail to Update!</font></center></h2>");
		}

%>





</body>
</html>