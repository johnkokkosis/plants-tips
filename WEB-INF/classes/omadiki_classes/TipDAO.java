package omadiki_classes;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TipDAO {

    public void createNewTip(Tip tip) throws Exception {
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        String sql = "INSERT INTO tips (tips.tip_content, tips.tip_date, tips.user_id, tips.plant_id) "
                + " VALUES (?, ?, ?, ?)";


        try {

            con = db.getConnection();
            stmt = con.prepareStatement(sql);

            stmt.setString(1, tip.getTipContent());
            stmt.setString(2, tip.getTipDatePosted());
            stmt.setInt(3, tip.getUserPosted());
            stmt.setInt(4, tip.getForPlant());

            stmt.executeUpdate();
            stmt.close();
            db.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception ignore) {

            }
        }
    }

    public List<Tip> getTipsByPlantId(int plantId) throws Exception {
        List<Tip> tips = new ArrayList<>();
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt1 = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM tips WHERE tips.plant_id=?";

        try {
            con = db.getConnection();

            stmt1 = con.prepareStatement(sql);
            // setting parameters
            stmt1.setInt(1, plantId);

            rs = stmt1.executeQuery();

            if ( !rs.next() ) {
                rs.close();
                stmt1.close();
                throw new Exception("Something went wrong!");
            }

            tips.add(new Tip(
                    rs.getString("tips.tip_content"),
                    rs.getString("tips.tip_date"),
                    rs.getInt("tips.user_id"),
                    rs.getInt("tips.plant_id")
            ));

            return tips;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception ignore) {

            }
        }
    }

}
