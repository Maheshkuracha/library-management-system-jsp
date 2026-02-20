<%@ page import="java.sql.*"%>
<%@ page import="com.library.util.DBConnection"%>

<%

if (session.getAttribute("user_id") == null) {
	response.sendRedirect("login.jsp");
	return;
}

int book_id = Integer.parseInt(request.getParameter("id"));

Connection con = null;
PreparedStatement ps = null;

try {

	con = DBConnection.getConnection();

	ps = con.prepareStatement(
	"UPDATE books SET available = available + 1 WHERE id=?");

	ps.setInt(1, book_id);
	ps.executeUpdate();

	ps = con.prepareStatement(
	"UPDATE borrow SET status='returned' WHERE book_id=? AND status='borrowed'");

	ps.setInt(1, book_id);
	ps.executeUpdate();

	session.setAttribute("msg", "Book Returned Successfully!");

	response.sendRedirect("mybooks.jsp");

}
catch(Exception e){

	out.println("Error: " + e);

}
finally{

	if(ps!=null) ps.close();
	if(con!=null) con.close();

}

%>