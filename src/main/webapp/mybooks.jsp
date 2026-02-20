<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="com.library.util.DBConnection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Books</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<%
if (session.getAttribute("user_id") == null) {
	response.sendRedirect("login.jsp");
	return;
}
%>

<h2>My Books</h2>

<table border="1">

<tr>
<th>Book</th>
<th>Author</th>
<th>Action</th>
</tr>

<%

int user_id = (Integer) session.getAttribute("user_id");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {

	con = DBConnection.getConnection();

	ps = con.prepareStatement(
	"SELECT b.id, b.title, b.author FROM books b, borrow br " +
	"WHERE b.id = br.book_id AND br.user_id = ? AND br.status='borrowed'");

	ps.setInt(1, user_id);

	rs = ps.executeQuery();

	while (rs.next()) {

%>

<tr>

<td><%=rs.getString("title")%></td>

<td><%=rs.getString("author")%></td>

<td>
<a href="return.jsp?id=<%=rs.getInt("id")%>">Return</a>
</td>

</tr>

<%
	}

}
catch(Exception e){

	out.println("Error: " + e);

}
finally{

	if(rs!=null) rs.close();
	if(ps!=null) ps.close();
	if(con!=null) con.close();

}

%>

</table>

<br>
<a href="dashboard.jsp">Back</a>

</body>
</html>