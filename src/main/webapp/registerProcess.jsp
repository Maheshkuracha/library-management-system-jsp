<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="com.library.util.DBConnection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Process</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<%

String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("password");

Connection con = null;
PreparedStatement ps = null;

try {

	con = DBConnection.getConnection();

	ps = con.prepareStatement(
	"INSERT INTO users(name,email,password) VALUES(?,?,?)");

	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, password);

	ps.executeUpdate();

%>

<h3>Registration Successful!</h3>

<a href="login.jsp">Login Now</a>

<%

}
catch (Exception e) {

	out.println("Error: " + e);

}
finally {

	if(ps!=null) ps.close();
	if(con!=null) con.close();

}

%>

</body>
</html>