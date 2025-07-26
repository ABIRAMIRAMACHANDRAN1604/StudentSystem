<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #74ebd5, #ACB6E5);
            padding: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background-color: white;
            max-width: 400px;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin-top: 15px;
            color: #555;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        button {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            background-color: #27ae60;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #1e8449;
        }

        .error {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Student Login</h2>

        <!-- Error message -->
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>

        <form action="/studentlogin" method="post">
            <label for="rollnumber">Roll Number</label>
            <input type="text" name="rollnumber" id="rollnumber" required>

            <label for="password">Password</label>
            <input type="text" name="password" id="password" required>

            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>
