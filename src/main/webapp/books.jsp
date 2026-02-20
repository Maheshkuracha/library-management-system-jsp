<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="com.library.util.DBConnection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Books</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

	<h2>All Books</h2>

	<table border="1">

		<tr>
			<th>ID</th>
			<th>Title</th>
			<th>Author</th>
			<th>Available Copies</th>
			<th>Action</th>
		</tr>

		<%
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;

		try {

			con = DBConnection.getConnection();
			st = con.createStatement();
			rs = st.executeQuery("select * from books");

			while (rs.next()) {

				int available = rs.getInt("available");
		%>

		<tr>

			<td><%=rs.getInt("id")%></td>

			<td><%=rs.getString("title")%></td>

			<td><%=rs.getString("author")%></td>

			<td><%=available%></td>

			<td>
				<%
				if (available > 0) {
				%>
					<a href="borrow.jsp?id=<%=rs.getInt("id")%>">Borrow</a>
				<%
				} else {
				%>
					<span style="color: red;">Not Available</span>
				<%
				}
				%>
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
			if(st!=null) st.close();
			if(con!=null) con.close();
		}
		%>

	</table>

	<br>

	<a href="dashboard.jsp">Back to Dashboard</a>

</body>
</html>