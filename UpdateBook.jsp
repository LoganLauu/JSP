<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>

<%
int bookid = Integer.parseInt(request.getParameter("bookid"));
String selection = request.getParameter("updatetype");

	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "dbuser", "dbuser");

	if(selection.equalsIgnoreCase("stock")){
		int stock = Integer.parseInt(request.getParameter("stock"));
		PreparedStatement updatebook = conn.prepareStatement("update books set BOOK_STOCK =? where BOOK_ID =?");
		updatebook.setInt(1, stock);
		updatebook.setInt(2,bookid);
		
		int updatedbook = updatebook.executeUpdate();
		
		if(updatedbook > 0){
			RequestDispatcher rd = request
					.getRequestDispatcher("UpdateBookPage.jsp");
			rd.include(request, response);
			out.println("<h2><center><font color='lightgreen'>Book Updated Successfully!</font></center></h2>");
		}else{
			RequestDispatcher rd = request
					.getRequestDispatcher("UpdateBookPage.jsp");
			rd.include(request, response);
			out.println("<h2><center><font color='red'>Book Fail to Update!</font></center></h2>");
		}
		
	}else if(selection.equalsIgnoreCase("price")){
		
		float price = Float.parseFloat(request.getParameter("price"));
		PreparedStatement updatebook = conn.prepareStatement("update books set PRICE =? where BOOK_ID =?");
		updatebook.setFloat(1, price);
		updatebook.setInt(2,bookid);
		
		int updatedbook = updatebook.executeUpdate();
		
		if(updatedbook > 0){
			RequestDispatcher rd = request
					.getRequestDispatcher("UpdateBookPage.jsp");
			rd.include(request, response);
			out.println("<h2><center><font color='lightgreen'>Book Updated Successfully!</font></center></h2>");
		}else{
			RequestDispatcher rd = request
					.getRequestDispatcher("UpdateBookPage.jsp");
			rd.include(request, response);
			out.println("<h2><center><font color='red'>Book Fail to Update!</font></center></h2>");
		}
	}

%>
</body>
</html>