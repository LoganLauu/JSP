<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.File" %>
<%@page import="javax.servlet.annotation.MultipartConfig"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<%

File image = new File ("C:/Users/Administrator/Downloads/Images/"+request.getParameter("img"));
InputStream is = new FileInputStream(image);
byte[] targetArray = new byte[is.available()];
ByteArrayOutputStream os = new ByteArrayOutputStream();
byte[] buffer = new byte[1024];
int len;
while ((len = is.read(buffer)) != -1) {
    os.write(buffer, 0, len);
}

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "dbuser", "dbuser");

PreparedStatement adding = conn.prepareStatement("insert into books values (book_seq.nextval,?,?,?,?,?,?)");
adding.setString(1, request.getParameter("bookname"));
adding.setString(2, request.getParameter("author"));
adding.setInt(3,Integer.parseInt(request.getParameter("stock")));
adding.setDouble(4, Double.parseDouble(request.getParameter("price")));
adding.setString(5, request.getParameter("category"));
adding.setBytes(6, os.toByteArray());

int addbook = adding.executeUpdate();

if(addbook > 0 ){
	RequestDispatcher rd = request
			.getRequestDispatcher("AddBookPage.jsp");
	rd.include(request, response);
	out.println("<h2><center><font color='lightgreen'>Book Added Successfully!</font></center></h2>");

}else{
	RequestDispatcher rd = request
			.getRequestDispatcher("OBSLogin.jsp");
	rd.include(request, response);
	out.println("<h2><center><font color='tomato'>Login Failed..</font></center></h2>");
}

%>
</body>
</html>