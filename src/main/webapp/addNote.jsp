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
<title>Add Note</title>
<link href="style.css" rel="stylesheet">
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f8f9fa;
	background: url('<%=request.getContextPath()%>/add_photo.jpeg')
		no-repeat center center fixed;
	background-size: cover;
}

.navbar {
	background-color: #343a40;
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
	background: #fff;
	margin: 50px auto;
	padding: 20px;
	border-radius: 8px;
	width: 400px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

input[type="text"], textarea {
	width: 100%;
	padding: 10px;
	margin: 8px 0;
	border: 1px solid #ccc;
	border-radius: 4px;
}

button {
	width: 100%;
	padding: 10px;
	background-color: #007bff;
	border: none;
	color: #fff;
	font-size: 16px;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<!-- Navigation Bar -->
	<div class="navbar">
		<a href="about.jsp">About</a> <a href="addNote.jsp">➕ Add Note</a> <a
			href="viewNotes.jsp">📄 View Notes</a> <a href="updateNote.jsp">✏️
			Update Note</a> <a href="logout">🚪 Logout</a>
	</div>


	<div class="container">
		<h2>Add a New Note</h2>
		<form action="addNote" method="post">
			<input type="text" name="title" placeholder="Enter Note Title"
				required>
			<textarea name="content" rows="5" placeholder="Enter Note Content"
				required></textarea>
			<button type="submit">Save Note</button>
		</form>
	</div>
</body>
</html>
