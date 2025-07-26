<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Subject List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #667eea, #764ba2);
            color: white;
            text-align: center;
            padding: 50px;
        }

        h1 {
            margin-bottom: 30px;
        }

        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background-color: #ffffff;
            color: #333;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .edit-btn, .action-btn {
            padding: 6px 12px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
        }

        .edit-btn {
            background-color: #f39c12;
        }

        .edit-btn:hover {
            background-color: #d68910;
        }

        .action-btn {
            background-color: #e74c3c;
        }

        .action-btn:hover {
            background-color: #c0392b;
        }

        .back-btn {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            margin: 20px 10px 0;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .back-btn:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

    <h1>Subject List for Roll Number: ${rollNumber}</h1>

    <table>
        <tr>
            <th>ID</th>
            <th>Subject Name</th>
            <th>Grade</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="subject" items="${subjects}">
            <tr>
                <td>${subject.id}</td>
                <td>${subject.subjectName}</td>
                <td>${subject.grade}</td>
                <td>
                    <a href="/subject/edit/${subject.id}">
                        <button class="edit-btn">Edit</button>
                    </a>
                    <a href="/subject/delete/${subject.id}" onclick="return confirm('Are you sure you want to delete this subject?')">
                        <button class="action-btn">Delete</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>

   
    <a href="/home">
        <button class="back-btn">Home</button>
    </a>

</body>
</html>
