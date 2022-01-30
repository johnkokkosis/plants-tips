package omadiki_classes;

import java.sql.*;

public class UserDAO {

    public User authenticate(String username, String password) throws Exception{
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM users WHERE username=? AND user_password=?;";

        try{
            con = db.getConnection();
            stmt = con.prepareStatement(sql);

            // Set parameters in the query
            stmt.setString(1, username);
            stmt.setString(2, password);

            rs = stmt.executeQuery();

            if (!rs.next()){
                throw new Exception("Wrong username or password. Please try again.");
            }

            User user = new User(
                    rs.getString("users.first_name"),
                    rs.getString("users.last_name"),
                    rs.getString("users.username"),
                    rs.getString("users.email"),
                    rs.getString("users.phone"),
                    rs.getString("users.user_password")
            );

            rs.close();
            stmt.close();
            db.close();

            return user;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception ignore){

            }
        }
    }

    public void registerUser(User user) throws Exception {
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        String sqlCheckUser = "SELECT * FROM users WHERE users.email=?;";

        String sql = "INSERT INTO users (users.first_name, users.last_name, users.username, users.email, users.phone, users.user_password) "
                + " VALUES (?, ?, ?, ?, ?, ?);";

        try {
            con = db.getConnection();

            stmt = con.prepareStatement(sqlCheckUser);

            stmt.setString(1, user.getEmail());

            rs = stmt.executeQuery();

            if ( rs.next() ) {
                rs.close();
                stmt.close();
                throw new Exception("Sorry, this email address is already in use. Please select another one.");
            }

            stmt = con.prepareStatement(sql);

            stmt.setString(1, user.getFirstName());
            stmt.setString(2, user.getLastName());
            stmt.setString(3, user.getUsername());
            stmt.setString(4, user.getEmail());
            stmt.setString(5, user.getPhone());
            stmt.setString(6, user.getPassword());

            stmt.executeUpdate();
            db.close();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception ignored) {

            }
        }
    }

    public int getUserIdByEmail(String email) throws Exception {
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int userId = 0;

        String sqlFindUser = "SELECT * from users WHERE users.email=?";

        try {
            con = db.getConnection();

            stmt = con.prepareStatement(sqlFindUser);
            // setting parameters
            stmt.setString(1, email);

            rs = stmt.executeQuery();

            if ( !rs.next() ) {
                rs.close();
                stmt.close();
                throw new Exception("Sorry. There is no user with this email.");
            }

            userId = rs.getInt("users.user_id");

            rs.close();
            stmt.close();
            db.close();
            return userId;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception ignored){

            }
        }
    }

    public String getUsernameById(int userId) throws Exception {
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String username = null;

        String sqlFindUser = "SELECT * from users WHERE users.user_id=?";

        try {
            con = db.getConnection();

            stmt = con.prepareStatement(sqlFindUser);
            // setting parameters
            stmt.setInt(1, userId);

            rs = stmt.executeQuery();

            if ( !rs.next() ) {
                rs.close();
                stmt.close();
                throw new Exception("Sorry. There is no user with this email.");
            }

            username = rs.getString("users.username");

            rs.close();
            stmt.close();
            db.close();
            return username;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception ignored){

            }
        }
    }
}
