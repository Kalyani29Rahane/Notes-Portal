<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.sql.*"%>
<%
if (session == null || session.getAttribute("userEmail") == null) {
	response.sendRedirect("login.jsp");
	return;
}
String userEmail = (String) session.getAttribute("userEmail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Notes</title>
<link rel="stylesheet" href="style.css">
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f8f9fa;
	background: url('<%=request.getContextPath()%>/view.jpeg') no-repeat
		center center fixed;
	background-size: cover;
	margin: 0;
	padding: 0;
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
	text-align: center;
	padding: 50px;
}

h2 {
	color: #333;
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


	<div class="container">
		<h2>Your Notes</h2>
		<table>
			<tr>
				<th>Title</th>
				<th>Content</th>
				<th>Created At</th>
				<th>Actions</th>
			</tr>
			<%
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/notes_portal", "root", "Wj28@krhps");
				PreparedStatement ps = con.prepareStatement(
						"SELECT id, title, content, created_at FROM notes WHERE user_email = ? ORDER BY created_at DESC")) {

					ps.setString(1, userEmail);
					ResultSet rs = ps.executeQuery();
					boolean hasData = false;

					while (rs.next()) {
				hasData = true;
			%>
			<tr>
				<td><%=rs.getString("title")%></td>
				<td><%=rs.getString("content")%></td>
				<td><%=rs.getTimestamp("created_at")%></td>

				<td><a href="updateNote.jsp?id=<%=rs.getInt("id")%>"
					class="action-btn action-edit">Edit</a> <br>
				<br> <a href="deleteNote?id=<%=rs.getInt("id")%>"
					class="action-btn action-delete">Delete</a></td>

			</tr>

			<%
			}
			if (!hasData) {
			%>
			<tr>
				<td colspan="4" style="text-align: center;">No notes available.</td>
			</tr>
			<%
			}
			}
			} catch (Exception e) {
			out.println("<tr><td colspan='4' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
			}
			%>
		</table>
	</div>
</body>
</html>
