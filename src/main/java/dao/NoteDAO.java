
package dao;

import model.Note;
import java.sql.DriverManager;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NoteDAO {

    private static final String INSERT_SQL =
            "INSERT INTO notes (user_id, title, content) VALUES (?, ?, ?)";

    private static final String UPDATE_SQL =
            "UPDATE notes SET title = ?, content = ? WHERE id = ? AND user_id = ?";

    private static final String DELETE_SQL =
            "DELETE FROM notes WHERE id = ? AND user_id = ?";

    private static final String SELECT_BY_ID_SQL =
            "SELECT id, user_id, title, content, created_at FROM notes WHERE id = ? AND user_id = ?";

    private static final String SELECT_BY_USER_SQL =
            "SELECT id, user_id, title, content, created_at FROM notes WHERE user_id = ? ORDER BY created_at DESC";

    /** Create (returns generated note id) */
    public int addNote(Note note) {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/notes_portal","root","Wj28@krhps");
             PreparedStatement ps = conn.prepareStatement(INSERT_SQL, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, note.getUserId());
            ps.setString(2, note.getTitle());
            ps.setString(3, note.getContent());

            int affected = ps.executeUpdate();
            if (affected == 0) return -1;

            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
            return -1;
        } catch (SQLException e) {
            e.printStackTrace(); // log properly in real apps
            return -1;
        }
    }

    /** Read (single) */
    public Note getNoteById(int id, int userId) {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/notes_portal","root","Wj28@krhps");
             PreparedStatement ps = conn.prepareStatement(SELECT_BY_ID_SQL)) {

            ps.setInt(1, id);
            ps.setInt(2, userId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /** Read (all for a user) */
    public List<Note> getNotesByUserId(int userId) {
        List<Note> notes = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/notes_portal","root","Wj28@krhps");
             PreparedStatement ps = conn.prepareStatement(SELECT_BY_USER_SQL)) {

            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    notes.add(mapRow(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notes;
    }

    /** Update */
    public boolean updateNote(Note note) {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/notes_portal","root","Wj28@krhps");
             PreparedStatement ps = conn.prepareStatement(UPDATE_SQL)) {

            ps.setString(1, note.getTitle());
            ps.setString(2, note.getContent());
            ps.setInt(3, note.getId());
            ps.setInt(4, note.getUserId());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /** Delete */
    public boolean deleteNote(int id, int userId) {
        try (Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/notes_portal","root","Wj28@krhps");
             PreparedStatement ps = conn.prepareStatement(DELETE_SQL)) {

            ps.setInt(1, id);
            ps.setInt(2, userId);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /* ------------ Helpers ------------ */

    private Note mapRow(ResultSet rs) throws SQLException {
        Note n = new Note();
        n.setId(rs.getInt("id"));
        n.setUserId(rs.getInt("user_id"));
        n.setTitle(rs.getString("title"));
        n.setContent(rs.getString("content"));
        n.setCreatedAt(rs.getTimestamp("created_at"));
        return n;
    }
}
