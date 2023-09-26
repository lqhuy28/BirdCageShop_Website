/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.ProductDTO;
import utils.DBUtils;

public class ShoppingDAO {
    Connection conn = null;
    PreparedStatement ptm = null;
    ResultSet rs = null;
     public List<ProductDTO> getAllProductDTO(){
        List<ProductDTO> list = new ArrayList<>();
        String query = "select * from tblProducts";
        try {
            conn = new DBUtils().getConnection();
            ptm = conn.prepareStatement(query);
            rs = ptm.executeQuery();
            while(rs.next()){
                list.add(new ProductDTO(rs.getString(1),
                        rs.getString(2), 
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getBoolean(8), 
                        rs.getString(9), 
                        rs.getString(10), 
                        rs.getString(11)));
            }
        }   catch (Exception e){
        }
        return list;
    }
}
