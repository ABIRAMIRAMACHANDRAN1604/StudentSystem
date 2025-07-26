<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Management System</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
        }

        h1 {
            font-size: 48px;
            margin-bottom: 10px;
        }

        p {
            font-size: 20px;
            margin-bottom: 40px;
        }

        .button-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
            width: 100%;
            max-width: 400px;
        }

        a, button {
            text-decoration: none;
            background-color: white;
            color: #764ba2;
            padding: 14px 30px;
            border-radius: 10px;
            font-weight: bold;
            border: none;
            width: 100%;
            text-align: center;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        a:hover, button:hover {
            background-color: #f0f0f0;
            color: #5e3d91;
        }

        form {
            display: inline-block;
            margin: 10px;
        }

        form button {
            background-color: white;
            color: #764ba2;
            padding: 14px 30px;
            border-radius: 10px;
            font-weight: bold;
            border: none;
            transition: 0.3s ease;
            cursor: pointer;
        }

        form button:hover {
            background-color: #f0f0f0;
            color: #5e3d91;
        }

    </style>
</head>
<body>

    <h1>Welcome to Student Management System</h1>
    <p>Select an option below to get started</p>

    <div class="button-container">
        <!-- Navigation links -->
        
        <a href="login">Login</a>
        
        
    </div>

</body>
</html>
