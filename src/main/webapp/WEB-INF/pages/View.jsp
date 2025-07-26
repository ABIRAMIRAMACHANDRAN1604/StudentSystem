<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            padding: 40px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
        }

        h1 {
            color: #3b3b3b;
        }

        .top-buttons {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        button {
            padding: 8px 14px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            font-size: 14px;
        }

        .top-button {
            background-color: #2ecc71;
        }

        .top-button:hover {
            background-color: #27ae60;
        }

        .logout-btn {
            background-color: #e67e22;
        }

        .logout-btn:hover {
            background-color: #d35400;
        }

        .form-inline {
            display: flex;
            align-items: center;
        }

        .form-inline input {
            padding: 8px;
            font-size: 14px;
            border-radius: 4px;
            border: 1px solid #ccc;
            margin-right: 5px;
        }

        .form-inline button {
            background-color: #3498db;
        }

        .form-inline button:hover {
            background-color: #2980b9;
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

        a {
            text-decoration: none;
        }
    </style>
</head>
<body>

    <div class="header">
        <h1>Student List</h1>
        <div class="top-buttons">
            <a href="/home"><button class="top-button">Home</button></a>
            <a href="/login"><button class="logout-btn">Logout</button></a>
            <a href="/selectyear"><button class="logout-btn">Select Year</button></a>
            
            

            <form action="/redirect-to-subjects" method="get" class="form-inline">
                <input type="text" name="rollnumber" placeholder="Roll No - View" required />
                <button type="submit">View Subjects</button>
            </form>

            <form action="/redirect-to-addsubject" method="get" class="form-inline">
                <input type="text" name="rollnumber" placeholder="Roll No - Add" required />
                <button type="submit">Add Subject</button>
            </form>
        </div>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Roll Number</th>
            <th>Department</th>
            <th>Email</th>
            <th>Contact</th>
            <th>CGPA</th>
            <th>Interested Role</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach var="student" items="${students}">
            <tr>
                <td>${student.id}</td>
                <td>${student.name}</td>
                <td>${student.rollNumber}</td>
                <td>${student.department}</td>
                <td>${student.email}</td>
                <td>${student.contactNumber}</td>
                <td>${student.cgpa}</td>
                <td>${student.interestedRole}</td>
                <td>
                    <a href="/edit/${student.id}">
                        <button class="edit-btn">Edit</button>
                    </a>
                </td>
                <td>
                    <a href="/deletestudent/${student.id}" onclick="return confirm('Are you sure you want to delete this student?')">
                        <button class="delete-btn">Delete</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>

</body>
</html>
