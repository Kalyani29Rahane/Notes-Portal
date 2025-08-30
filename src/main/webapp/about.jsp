<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About - Notes Portal</title>

<!-- Font Awesome CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background: url('<%=request.getContextPath()%>/about1.jpeg') no-repeat
		center center fixed;
	background-size: cover;
}

/* Navbar */
.navbar {
	background: #2c2c2c;
	overflow: hidden;
	padding: 12px 20px;
	text-align: center; /* center the contents */
}

.navbar a {
	display: inline-block; /* inline links so they stay centered */
	color: white;
	text-align: center;
	padding: 12px 16px;
	text-decoration: none;
	font-size: 16px;
	transition: 0.3s;
}

.navbar a:hover {
	background: #575757;
	border-radius: 6px;
}

.navbar a.active {
	background: #007bff;
	border-radius: 6px;
}

/* Container */
.container {
	background: rgba(255, 255, 255, 0.95);
	max-width: 700px;
	margin: 60px auto;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 8px 18px rgba(0, 0, 0, 0.25);
	text-align: center;
}

h2 {
	color: rgb(204, 0, 102);
	margin-bottom: 10px;
	font-size: 24px;
}

h2 i {
	color:rgb(204, 0, 102);
	margin-right: 8px;
}

h3 {
	color: #333;
	margin-top: 20px;
}

ul {
	text-align: left;
	list-style: none;
	padding: 0;
}

ul li {
	font-size: 16px;
	margin: 8px 0;
	display: flex;
	align-items: center;
}

ul li i {
	margin-right: 10px;
	font-size: 18px;
}

/* Icon colors */
.icon-user {
	color: #007bff;
}

.icon-notes {
	color: #28a745;
}

.icon-lock {
	color: #ff5722;
}

.icon-check {
	color: #17a2b8;
}

.icon-ui {
	color: #6f42c1;
}

/* Footer */
.footer {
	text-align: center;
	padding: 12px;
	background: rgba(44, 44, 44, 0.9);
	color: white;
	position: fixed;
	bottom: 0;
	width: 100%;
	font-size: 14px;
}
</style>
</head>
<body>

	<!-- Navbar -->
	<!-- Navbar -->
	<div class="navbar">
		<a class="active" href="about.jsp"><i class="fas fa-info-circle"></i>
			About</a> <a href="addNote.jsp"><i class="fas fa-plus"></i> Add Note</a>
		<a href="viewNotes.jsp"><i class="fas fa-book"></i> View Notes</a> <a
			href="updateNote.jsp"><i class="fas fa-edit"></i> Update Note</a> <a
			href="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
	</div>

	<!-- Content -->
	<div class="container">
		<h2>
			<i class="fas fa-book-open"></i> About Notes Portal
		</h2>
		<p>
			Welcome to the <b>Notes Portal!</b> This project is designed to help
			users easily create, manage, and organize their personal and academic
			notes online.
		</p>

		<h3>Key Features:</h3>
		<ul>
			<li><i class="fas fa-user icon-user"></i> User Registration &
				Login</li>
			<li><i class="fas fa-file-alt icon-notes"></i> Create, Read,
				Edit, Delete Notes</li>
			<li><i class="fas fa-lock icon-lock"></i> Secure Authentication</li>
			<li><i class="fas fa-check-circle icon-check"></i> Secure
				Validation</li>
			<li><i class="fas fa-desktop icon-ui"></i> Simple &
				User-friendly UI</li>
		</ul>

		<h3>Project Info:</h3>
		<p>
			<b>Developer:</b> Kalyani Rahane
		</p>
		<p>
			<b>Purpose:</b> Academic learning & practice of Core Java + Web
			Technologies
		</p>
		<p>
			This project was developed as a <b>Mini Project in Java</b> using
			JSP, Servlets, JDBC, and MySQL Database.
		</p>
	</div>

	<!-- Footer -->
	<div class="footer">© 2025 Notes Portal | Developed using JSP,
		Servlets, JDBC & MySQL</div>

</body>
</html>
