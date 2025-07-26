<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Subject</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            padding: 40px;
        }

        .form-box {
            background: #fff;
            padding: 20px 30px;
            border-radius: 8px;
            max-width: 500px;
            margin: auto;
            box-shadow: 0 0 10px #ccc;
        }

        input[type="text"], select {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        h2 {
            text-align: center;
            color: #333;
        }
    </style>
</head>
<body>

<div class="form-box">
    <h2>Add Subject</h2>

    <form:form action="${pageContext.request.contextPath}/student/${subject.student.id}/addsubject" method="post" modelAttribute="subject">
        <label>Subject Name:</label>
        <form:input path="subjectName" />

        <label>Grade:</label>
        <form:input path="grade" />

        <!-- Hidden input for student reference (not editable by user) -->
        <form:hidden path="student.id" />

        <input type="submit" value="Add Subject" />
    </form:form>
</div>

</body>
</html>
