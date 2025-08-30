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

@WebServlet("/deleteNote")
public class DeleteNoteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int noteId = Integer.parseInt(request.getParameter("id"));
        String userEmail = (String) session.getAttribute("userEmail");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/notes_portal", "root", "Wj28@krhps");

            PreparedStatement ps = con.prepareStatement(
                    "DELETE FROM notes WHERE id=? AND user_email=?");
            ps.setInt(1, noteId);
            ps.setString(2, userEmail);

            ps.executeUpdate();
            response.sendRedirect("viewNotes.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
