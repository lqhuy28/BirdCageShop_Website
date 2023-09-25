/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import utils.DBUtils;
import model.ProductDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Acer
 */
public class ProductDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    private static final String SearchProduct = "select * from tblProducts where ProductName like ?";
    
    public List<ProductDTO> getAllProductDTO(){
        List<ProductDTO> list = new ArrayList<>();
        String query = "select * from tblProducts";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
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
    public List<ProductDTO> SearchProduct(String search)throws SQLException{
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = new DBUtils().getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(SearchProduct);
                ps.setString(1, "%" + search + "%");
                rs = ps.executeQuery();
                while (rs.next()) {
                    String ProductID = rs.getString("ProductID");
                    String ProductName = rs.getString("ProductName");
                    String ProductDetails = rs.getString("ProductDetails");
                    Double ProductPriceNew = rs.getDouble("ProductPriceNew");
                    Double ProductPriceOld = rs.getDouble("ProductPriceOld");
                    String ProductImage = rs.getString("ProductImage");
                    int Quantity = rs.getInt("Quantity");
                    boolean ProductStatus = rs.getBoolean("ProductStatus");
                    String ProductType = rs.getString("ProductType");
                    String ProductMaterial = rs.getString("ProductMaterial");
                    String OtherRequest = rs.getString("OtherRequest");
                    list.add(new ProductDTO(ProductID, ProductName, ProductDetails, ProductPriceNew, ProductPriceOld, ProductImage, Quantity, ProductStatus, ProductType, ProductMaterial, OtherRequest));
                }                    
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    } 
        
    
    
    public void deleteProduct(String id){
        String query = "delete from tblProducts\n" 
                + "where ProductID = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void insertProduct(String ProductID, String ProductName, String ProductDetails, String ProductPriceNew, String ProductPriceOld, String ProductImage, String Quantity, String ProductStatus, String ProductType, String ProductMaterial, String OtherRequest){
        String query = "insert into tblProducts\n"
                + "values(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, ProductID);
            ps.setString(2, ProductName);
            ps.setString(3, ProductDetails);
            ps.setString(4, ProductPriceNew);
            ps.setString(5, ProductPriceOld);
            ps.setString(6, ProductImage);
            ps.setString(7, Quantity);
            ps.setString(8, ProductStatus);
            ps.setString(9, ProductType);
            ps.setString(10, ProductMaterial);
            ps.setString(11, OtherRequest);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public ProductDTO getProductByID(String ProductID){
        String query = "select * from tblProducts\n"
                + "where ProductID = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, ProductID);
            rs = ps.executeQuery();
            while(rs.next()){
                return new ProductDTO(rs.getString(1),
                        rs.getString(2), 
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getBoolean(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11));
            }
        } catch (Exception e) {
        }
        return null;
    }
    public void updateProduct(String ProductID, String ProductName, String ProductDetails, String ProductPriceNew, String ProductPriceOld, String ProductImage, String Quantity, String ProductStatus, String ProductType, String ProductMaterial, String OtherRequest){
        String query ="update tblProducts\n" 
                +"set [ProductName] = ?,\n" 
                +"ProductDetails = ?,\n" 
                +"ProductPriceNew = ?,\n" 
                +"ProductPriceOld = ?,\n" 
                +"ProductImage = ?,\n" 
                +"Quantity = ?,\n" 
                +"ProductStatus = ?,\n" 
                +"ProductType = ?,\n" 
                +"ProductMaterial = ?,\n" 
                +"OtherRequest = ?\n" 
                +"where ProductID = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, ProductName);
            ps.setString(2, ProductDetails);
            ps.setString(3, ProductPriceNew);
            ps.setString(4, ProductPriceOld);
            ps.setString(5, ProductImage);
            ps.setString(6, Quantity);
            ps.setString(7, ProductStatus);
            ps.setString(8, ProductType);
            ps.setString(9, ProductMaterial);
            ps.setString(10, OtherRequest);
            ps.setString(11, ProductID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
}


