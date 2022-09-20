<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>


<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "dbuser", "dbuser");
		
		PreparedStatement checkUnique = conn.prepareStatement("select * from obsuser where user_id=?");
		checkUnique.setString(1, username);
		
		ResultSet checkUniqueid = checkUnique.executeQuery();
		
		if(checkUniqueid.next()){
			RequestDispatcher rd = request
					.getRequestDispatcher("RegisterUserPage.jsp");
			rd.include(request, response);%>
		<body onload="existID();"></body>
		
<%		}else{
			PreparedStatement updatebook = conn.prepareStatement("insert into obsuser values(?,?,'customer')");
			updatebook.setString(1, username);
			updatebook.setString(2,password);
			
			int updatedbook = updatebook.executeUpdate();
			
			if(updatedbook > 0){
				RequestDispatcher rd = request
						.getRequestDispatcher("RegisterUserPage.jsp");
				rd.include(request, response);
				out.println("<h2><center><font color='lightgreen'>Registered Successfully!</font></center></h2>");
			}else{
				RequestDispatcher rd = request
						.getRequestDispatcher("RegisterUserPage.jsp");
				rd.include(request, response);
				out.println("<h2><center><font color='red'>Register Failed!</font></center></h2>");
			}
		}

%>
<script>
function existID(){
	alert("UserId Exist!");
}
</script>
</body>
</html>