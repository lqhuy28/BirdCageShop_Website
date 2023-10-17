/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Material;
import utils.DBUtils;

/**
 *
 * @author trand
 */
public class MaterialDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<Material> getAllMaterial() {
        List<Material> list = new ArrayList<>();
        String query = "select * from tblMaterial";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Material(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }
}
