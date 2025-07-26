<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Select Student Year</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #667eea, #764ba2);
            color: white;
            text-align: center;
            padding: 100px;
        }

        h1 {
            margin-bottom: 40px;
        }

        .btn-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 40px;
        }

        .year-btn, .home-btn {
            background-color: #4CAF50;
            padding: 15px 30px;
            font-size: 18px;
            border: none;
            border-radius: 8px;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
            text-decoration: none;
        }

        .year-btn:hover, .home-btn:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>
    <h1>Select Student Year</h1>

    <div class="btn-container">
        <a href="/year/1" class="year-btn">First Year</a>
        <a href="/year/2" class="year-btn">Second Year</a>
        <a href="/year/3" class="year-btn">Third Year</a>
        <a href="/year/4" class="year-btn">Fourth Year</a>
    </div>

    <a href="/home" class="home-btn">Home</a>
</body>
</html>
