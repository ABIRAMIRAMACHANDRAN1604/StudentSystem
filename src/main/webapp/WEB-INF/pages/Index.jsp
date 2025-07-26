<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #74ebd5, #ACB6E5);
            padding: 50px;
        }

        .container {
            background-color: white;
            max-width: 500px;
            margin: auto;
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

        input[type="text"],
        input[type="email"],
        input[type="tel"] {
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
            background-color: #2980b9;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #21618c;
        }

        .view-btn {
            background-color: #27ae60;
        }

        .view-btn:hover {
            background-color: #1e8449;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add Student</h2>

        <form action="/add" method="post">
            <label for="name">Name</label>
            <input type="text" name="name" required>

            <label for="rollNumber">Roll Number</label>
            <input type="text" name="rollNumber" required>

            <label for="department">Department</label>
            <input type="text" name="department" required>

            <label for="email">Email</label>
            <input type="email" name="email" required>

            <label for="contactNumber">Contact Number</label>
            <input type="tel" name="contactNumber" required>
            
            <label for="cgpa">CGPA</label>
            <input type="text" name="cgpa" required>
            
            <label for="interestedRole">Interested Role</label>
            <input type="text" name="interestedRole" required>

            <button type="submit" class="submit-btn">Submit</button>
        </form>

        <form action="view" method="get">
            <button type="submit" class="view-btn">View Students</button>
        
    </div>
</body>
</html>
