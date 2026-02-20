<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login | Library Management System</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<h2>Student Login</h2>

<%
String msg = request.getParameter("msg");

if(msg != null){
%>

<h3 style="color: green;">
<%=msg%>
</h3>

<%
}
%>

<form action="loginProcess.jsp" method="post">

Email:
<input type="email" name="email" required>

<br><br>

Password:
<input type="password" name="password" required>

<br><br>

<input type="submit" value="Login">

</form>

<br>

<a href="register.jsp">New User? Register</a>

</body>
</html>