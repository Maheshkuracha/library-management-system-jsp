<%@ page import="java.sql.*"%>
<%@ page import="com.library.util.DBConnection"%>

<%

String email = request.getParameter("email");
String password = request.getParameter("password");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {

	con = DBConnection.getConnection();

	ps = con.prepareStatement(
	"SELECT id, name FROM users WHERE email=? AND password=?");

	ps.setString(1, email);
	ps.setString(2, password);

	rs = ps.executeQuery();

	if (rs.next()) {

		session.setAttribute("user_id", rs.getInt("id"));
		session.setAttribute("name", rs.getString("name"));

		response.sendRedirect("dashboard.jsp");

	}
	else {

		response.sendRedirect("login.jsp?msg=Invalid Email or Password");

	}

}
catch (Exception e) {

	out.println("Database Error: " + e.getMessage());

}
finally {

	if(rs!=null) rs.close();
	if(ps!=null) ps.close();
	if(con!=null) con.close();

}

%>