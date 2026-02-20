<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="com.library.util.DBConnection"%>

<%
if (session.getAttribute("user_id") == null) {
	response.sendRedirect("login.jsp");
	return;
}

int user_id = (Integer) session.getAttribute("user_id");
int book_id = Integer.parseInt(request.getParameter("id"));

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {

	con = DBConnection.getConnection();

	ps = con.prepareStatement("SELECT available FROM books WHERE id=?");
	ps.setInt(1, book_id);

	rs = ps.executeQuery();

	if (rs.next()) {

		int available = rs.getInt("available");

		if (available > 0) {

			ps = con.prepareStatement(
			"INSERT INTO borrow(user_id, book_id, status) VALUES(?,?,?)");

			ps.setInt(1, user_id);
			ps.setInt(2, book_id);
			ps.setString(3, "borrowed");

			ps.executeUpdate();

			ps = con.prepareStatement(
			"UPDATE books SET available = available - 1 WHERE id=?");

			ps.setInt(1, book_id);

			ps.executeUpdate();

			session.setAttribute("msg", "Book Borrowed Successfully!");

		} else {

			session.setAttribute("msg", "Book Not Available!");

		}

	}

	response.sendRedirect("books.jsp");

}
catch (Exception e) {
	out.println("Error: " + e);
}
finally {

	if (rs != null) rs.close();
	if (ps != null) ps.close();
	if (con != null) con.close();

}
%>