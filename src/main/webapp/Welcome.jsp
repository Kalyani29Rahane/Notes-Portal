<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome - Notes Portal</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('<%=request.getContextPath()%>/welcome.jpeg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        
        .container {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.2);
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        .btn {
            display: inline-block;
            margin: 10px;
            padding: 12px 25px;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            color: white;
            border-radius: 8px;
            transition: 0.3s ease;
        }
        .login {
            background-color: #007bff;
        }
        .login:hover {
            background-color: #0056b3;
        }
        .register {
            background-color: #28a745;
        }
        .register:hover {
            background-color: #1e7e34;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Notes Portal</h1>
        <p>Manage your notes easily with Login and Registration.</p>
        
        <a href="login.jsp" class="btn login">Login</a>
        <a href="reg.jsp" class="btn register">Register</a>
    </div>
</body>
</html>
