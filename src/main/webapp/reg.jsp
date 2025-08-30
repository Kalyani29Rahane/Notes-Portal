<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <title>Notes Portal - Registration</title>
    <style>
        body {
        background-image:url("blueimg.jpg");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center center;
    background-attachment: fixed;
    background-color: #f0f0f0; 
  
        
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 90vh;
        }
        .form-container {
            background: #fff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 150px;
    margin-left: 550px;
    margin-right: auto;
    width: 45%; /* or adjust to your form width */
    padding: 20px;
}
    
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        input[type="text"], input[type="email"], input[type="password"], input[type="date"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        select {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            border: none;
            color: #fff;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Register</h2>
    <form action="register" method="post">
    <label>Name:</label><br>
        <input type="text" name="name" placeholder="Full Name" required>
         <label>Email:</label><br>
        <input type="email" name="email" placeholder="Email" required>
         <label>PassWord:</label><br>
        <input type="password" name="password" placeholder="Password" required>
         <label>PhoneNo:</label><br>
        <input type="text" name="phone" placeholder="Phone Number" required>
   
        <label>Gender:</label>
        <select name="gender" required>
            <option value="">Select Gender</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
        </select>
        <label>Date of Birth:</label>
        <input type="date" name="dob" required>
        <button type="submit">Register</button>
    </form>
</div>
</body>
</html>
    