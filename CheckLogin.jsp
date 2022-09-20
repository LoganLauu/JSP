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
String name = request.getParameter("uid");

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "dbuser", "dbuser");
PreparedStatement login = conn.prepareStatement("select * from obsuser where user_id=? and user_pwd =?");
login.setString(1, request.getParameter("uid"));
login.setString(2, request.getParameter("pwd"));


if(request.getParameter("usertype").equalsIgnoreCase("customer")){

ResultSet checkLoginCustomer = login.executeQuery();
if(checkLoginCustomer.next()){
	if(checkLoginCustomer.getString(3).equalsIgnoreCase("customer")){
		session.setAttribute("loggedin", name);
		response.sendRedirect("CustomerPage.jsp");
	}else{
		RequestDispatcher rd = request
				.getRequestDispatcher("OBSLogin.jsp");
		rd.include(request, response);
		out.println("<h2><center><font color='tomato'>Wrong Account Type..</font></center></h2>");
	}
}else{
	RequestDispatcher rd = request
			.getRequestDispatcher("OBSLogin.jsp");
	rd.include(request, response);
	out.println("<h2><center><font color='tomato'>Login Failed..</font></center></h2>");
}
}

if(request.getParameter("usertype").equalsIgnoreCase("admin")){

ResultSet checkLogin = login.executeQuery();

if(checkLogin.next()){
	if(checkLogin.getString(3).equalsIgnoreCase("admin")){
		ServletContext sc = getServletContext();
		sc.setAttribute("uid", request.getAttribute("uid"));
		response.sendRedirect("AdminPage.jsp");	
	}else{
		RequestDispatcher rd = request
				.getRequestDispatcher("OBSLogin.jsp");
		rd.include(request, response);
		out.println("<h2><center><font color='tomato'>Wrong Account Type..</font></center></h2>");
	}
	}else{
		RequestDispatcher rd = request
			.getRequestDispatcher("OBSLogin.jsp");
		rd.include(request, response);
		out.println("<h2><center><font color='tomato'>Login Failed..</font></center></h2>");
	}
}

%>



</body>
</html>