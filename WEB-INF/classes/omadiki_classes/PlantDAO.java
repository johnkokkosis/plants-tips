package omadiki_classes;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class PlantDAO {

    public List<Plant> getAllPlants() throws Exception{
        List<Plant> plants = new ArrayList<>();
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM plants;";

        try {
            con = db.getConnection();
            stmt = con.prepareStatement(sql);

            rs = stmt.executeQuery();

            while (rs.next()){
                plants.add(
                        new Plant(
                                rs.getString("plants.plant_id"),
                                rs.getString("plants.plant_name"),
                                rs.getString("plants.plant_small_description"),
                                rs.getString("plants.plant_full_description"),
                                rs.getString("plants.plant_price"),
                                rs.getString("plants.plant_availability")
                        )
                );
            }

            rs.close();
            stmt.close();
            db.close();

            return plants;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            }catch (Exception ignore){

            }
        }
    }

    public Plant getPlantByID(String plantId) throws Exception{
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt1 = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM plants WHERE plants.plant_id=?;";

        try {
            con = db.getConnection();
            stmt1 = con.prepareStatement(sql);

            stmt1.setString(1, plantId);

            rs = stmt1.executeQuery();

            if (!rs.next()){
                rs.close();
                stmt1.close();
                throw new Exception("There is no plant with id: " + plantId);
            }

            Plant plant = new Plant(
                    rs.getString("plants.plant_id"),
                    rs.getString("plants.plant_name"),
                    rs.getString("plants.plant_small_description"),
                    rs.getString("plants.plant_full_description"),
                    rs.getString("plants.plant_price"),
                    rs.getString("plants.plant_availability")
            );

            rs.close();
            stmt1.close();
            db.close();

            return plant;
        }catch (Exception e){
            throw new Exception(e.getMessage());
        } finally {
            try{
                db.close();
            }catch (Exception ignore){

            }
        }
    }
}
