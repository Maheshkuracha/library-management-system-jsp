<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register | Library Management System</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<h2>Student Registration</h2>

<form action="registerProcess.jsp" method="post">

Name:
<input type="text" name="name" required>

<br><br>

Email:
<input type="email" name="email" required>

<br><br>

Password:
<input type="password" name="password" required>

<br><br>

<input type="submit" value="Register">

</form>

<br>

<a href="login.jsp">Already have account? Login</a>

</body>
</html>