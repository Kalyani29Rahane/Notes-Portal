
package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateNote")
public class UpdateNoteServlet extends HttpServlet {

    private static final String JDBC_URL  = "jdbc:mysql://localhost:3306/notes_portal";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "Wj28@krhps";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String userEmail = (String) session.getAttribute("userEmail");

        String idStr   = request.getParameter("id");
        String title   = request.getParameter("title");
        String content = request.getParameter("content");

        if (idStr == null || title == null || content == null) {
            // Bad request – redirect back (you can also show a friendly error)
            response.sendRedirect("viewNotes.jsp");
            return;
        }

        try {
            int noteId = Integer.parseInt(idStr);

            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
                 PreparedStatement ps = con.prepareStatement(
                         "UPDATE notes SET title = ?, content = ? WHERE id = ? AND user_email = ?")) {

                ps.setString(1, title);
                ps.setString(2, content);
                ps.setInt(3, noteId);
                ps.setString(4, userEmail);

                ps.executeUpdate();
            }

            response.sendRedirect("viewNotes.jsp");

        } catch (NumberFormatException e) {
            // invalid id
            response.sendRedirect("viewNotes.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("viewNotes.jsp");
        }
    }
}
