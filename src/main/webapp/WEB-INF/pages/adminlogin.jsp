
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background: #2c3e50;
            color: white;
            text-align: center;
            padding: 100px;
        }

        form {
            display: inline-block;
            text-align: left;
            background: #34495e;
            padding: 30px;
            border-radius: 10px;
        }

        input {
            display: block;
            width: 250px;
            margin-bottom: 15px;
            padding: 10px;
        }

        button {
            background: #1abc9c;
            border: none;
            padding: 10px 20px;
            font-weight: bold;
            color: white;
            cursor: pointer;
        }
    </style>

</head>
<body>
<h2>Admin Login</h2>

<form action="adminlogin" method="post">
    <input type="text" name="username" placeholder="Admin Username" required>
    <input type="password" name="password" placeholder="Password" required>
    <button type="submit">Login</button>
</form>

</body>
</html>