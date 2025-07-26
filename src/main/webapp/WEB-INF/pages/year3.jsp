<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Third Year Students</title>
   <style>
        body {
            font-family: Arial, sans-serif;
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            padding: 40px;
        }

        h2 {
            color: #3b3b3b;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 5px 12px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
        }

        th, td {
            border: 1px solid #dddddd;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        a {
            text-decoration: none;
            color: white;
        }

        .btn {
            padding: 8px 14px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            margin-right: 5px;
        }

        .edit-btn {
            background-color: #007bff;
        }

        .edit-btn:hover {
            background-color: #0069d9;
        }

        .delete-btn {
            background-color: #e74c3c;
        }

        .delete-btn:hover {
            background-color: #c0392b;
        }

        .subject-btn {
            background-color: #2ecc71;
        }

        .subject-btn:hover {
            background-color: #27ae60;
        }

        .back-btn {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            margin-top: 30px;
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
<h2>Third Year Students</h2>
<table>
    <tr>
        <th>Name</th>
        <th>Roll Number</th>
        <th>Department</th>
        <th>Email</th>
        <th>Contact</th>
        <th>CGPA</th>
        <th>Interested Role</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="student" items="${students}">
        <tr>
            <td>${student.name}</td>
            <td>${student.rollNumber}</td>
            <td>${student.department}</td>
            <td>${student.email}</td>
            <td>${student.contactNumber}</td>
            <td>${student.cgpa}</td>
            <td>${student.interestedRole}</td>
            <td>
                <a href="/edit/${student.id}" class="edit-btn btn">Edit</a>
                <a href="/deletestudent/${student.id}" class="delete-btn btn" onclick="return confirm('Are you sure you want to delete this student?');">Delete</a>
                <a href="/student/${student.id}/subjects" class="subject-btn btn">Subjects</a>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="/home">
        <button class="back-btn">Home</button>
    </a>
</body>
</html>
