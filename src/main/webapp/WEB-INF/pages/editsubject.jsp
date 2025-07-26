<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Subject</title>
    <style>
        body {
            font-family: Arial;
            background: #f5f5f5;
            padding: 50px;
            text-align: center;
        }

        form {
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            width: 400px;
            margin: auto;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        input[type="text"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
        }

        input[readonly] {
            background-color: #e9e9e9;
            color: #555;
        }

        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 10px;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>Edit Subject</h2>

    <form action="/subject/update/${subject.id}" method="post">
        <label>Subject Name:</label><br>
        <input type="text" name="subjectName" value="${subject.subjectName}" required><br>

        <label>Grade:</label><br>
        <input type="text" name="grade" value="${subject.grade}" required><br>

        <label>Student Year:</label><br>
        <input type="text" value="${subject.student.year}" readonly><br>

        <button type="submit">Update</button>
    </form>
</body>
</html>
