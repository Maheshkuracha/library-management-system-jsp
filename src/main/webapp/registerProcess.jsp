<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("password");

Connection con = null;
PreparedStatement checkPs = null;
PreparedStatement insertPs = null;
ResultSet rs = null;

try {

	Class.forName("com.mysql.cj.jdbc.Driver");

	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/libraryjsp", "root", "root");

	checkPs = con.prepareStatement("SELECT * FROM users WHERE email=?");

	checkPs.setString(1, email);

	rs = checkPs.executeQuery();

	if (rs.next()) {

		response.sendRedirect("register.jsp?error=User already exists");

	} else {

		insertPs = con.prepareStatement("INSERT INTO users(name,email,password) VALUES(?,?,?)");

		insertPs.setString(1, name);
		insertPs.setString(2, email);
		insertPs.setString(3, password);

		insertPs.executeUpdate();

		response.sendRedirect("login.jsp?msg=Registration successful");
	}

} catch (Exception e) {

	e.printStackTrace();

	response.sendRedirect("register.jsp?error=Database error");

} finally {

	try {

		if (rs != null)
	rs.close();

		if (checkPs != null)
	checkPs.close();

		if (insertPs != null)
	insertPs.close();

		if (con != null)
	con.close();

	} catch (Exception e) {
		e.printStackTrace();
	}
}
%>