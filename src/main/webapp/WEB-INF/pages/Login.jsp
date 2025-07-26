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
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #43cea2, #185a9d);
            color: white;
            text-align: center;
            padding: 100px;
        }

        h1 {
            font-size: 40px;
        }

        .login-links {
            margin-top: 40px;
        }

        a {
            text-decoration: none;
            background-color: white;
            color: #185a9d;
            padding: 15px 30px;
            font-weight: bold;
            border-radius: 10px;
            margin: 0 20px;
            transition: 0.3s ease;
        }

        a:hover {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
 <h1>Login as</h1>

    <div class="login-links">
        <a href="adminlogin">Admin</a>
        <a href="studentlogin">Student</a>
    </div>
</body>
</html>