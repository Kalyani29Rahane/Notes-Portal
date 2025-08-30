<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%
if (session == null || session.getAttribute("userName") == null) {
	response.sendRedirect("login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard - Notes Portal</title>
<link href="style.css" rel="stylesheet">
<style>
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

body {
	font-family: Arial, sans-serif;
	/* ✅ Background Image full page  */
	background: url('<%=request.getContextPath()%>/Dashboard_photo.jpeg')
		no-repeat center center fixed;
	background-size: cover;
}

.navbar {
	background-color: rgba(52, 58, 64, 0.9);
	padding: 15px;
	text-align: center;
}

.navbar a {
	color: white;
	margin: 0 15px;
	text-decoration: none;
	font-weight: bold;
}

.navbar a:hover {
	text-decoration: underline;
}

.container {
	text-align: center;
	padding: 40px;
	background-color: rgba(255, 255, 255, 0.85);
	border-radius: 10px;
	display: inline-block;
	margin-top: 80px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
}

h2 {
	color: #333;
}

.quote {
	margin-top: 20px;
	font-style: italic;
	color: #444;
	font-size: 18px;
	font-weight: 600;
	background: #f9f9f9;
	padding: 15px;
	border-radius: 8px;
	box-shadow: 0px 2px 5px rgba(0,0,0,0.2);
}
</style>
</head>
<body>
	<!-- Navigation Bar -->
	<div class="navbar">
		<a href="about.jsp">About</a>
		<a href="addNote.jsp">➕ Add Note</a>
		<a href="viewNotes.jsp">📄 View Notes</a>
		<a href="updateNote.jsp">✏️ Update Note</a>
		<a href="logout">🚪 Logout</a>
	</div>

	<!-- Welcome Section -->
	<div class="container">
		<h2>
			Welcome,
			<%=session.getAttribute("userName")%>!
		</h2>
		<p>Use the menu above to manage your notes.</p>
		
		<!-- 🌟 Motivational Quote -->
		<div class="quote">
			"Small notes can turn into big opportunities."🚀
		</div>
	</div>
</body>
</html>
