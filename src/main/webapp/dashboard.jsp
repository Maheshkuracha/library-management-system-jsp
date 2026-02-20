<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard | Library Management System</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<%
if(session.getAttribute("user_id")==null){
	response.sendRedirect("login.jsp");
	return;
}

String name = (String) session.getAttribute("name");
%>

<h1>Library Management System</h1>

<h2>Welcome, <%=name%></h2>

<p>Explore books and manage your library account easily.</p>

<br>

<a href="books.jsp">View Books</a> |
<a href="mybooks.jsp">My Books</a> |
<a href="logout.jsp">Logout</a>

</body>
</html>