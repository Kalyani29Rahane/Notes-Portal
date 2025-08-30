<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    if (session == null || session.getAttribute("userEmail") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String idParam = request.getParameter("id");
    if (idParam == null) {
        response.sendRedirect("viewNotes.jsp");
        return;
    }

    int noteId = Integer.parseInt(idParam);
    String title = "";
    String content = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/notes_portal", "root", "Wj28@krhps");
             PreparedStatement ps = con.prepareStatement(
                "SELECT title, content FROM notes WHERE id=? AND user_email=?")) {

            ps.setInt(1, noteId);
            ps.setString(2, (String) session.getAttribute("userEmail"));
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    title = rs.getString("title");
                    content = rs.getString("content");
                } else {
                    // If note not found, go back to viewNotes
                    response.sendRedirect("viewNotes.jsp");
                    return;
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("viewNotes.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Note</title>
    <link rel="stylesheet" href="style.css"><!-- Use centralized CSS -->
     <style>
        body {
         font-family: Arial, sans-serif;
            background: url('<%=request.getContextPath()%>/update.jpeg') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
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


    <!-- Update Note Form -->
    <div class="container">
        <h2>Update Note</h2>
        <form action="updateNote" method="post">
            <input type="hidden" name="id" value="<%= noteId %>">
            <input type="text" name="title" value="<%= title %>" required>
            <textarea name="content" rows="5" required><%= content %></textarea>
            <button type="submit">Update</button>
        </form>
    </div>
</body>
</html>
