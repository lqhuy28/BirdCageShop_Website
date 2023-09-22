/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static com.sun.org.apache.xalan.internal.xsltc.compiler.util.Type.Int;
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
                        rs.getString(5),
                        rs.getInt(6), 
                        rs.getString(7)));
            }
        }   catch (Exception e){
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
    public void insertProduct(String ProductID, String ProductName, String ProductDetails, String ProductPrice, String ProductImage, String Quantity, String ProductStatus){
        String query = "insert into tblProducts\n"
                + "values(?,?,?,?,?,?,?)";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, ProductID);
            ps.setString(2, ProductName);
            ps.setString(3, ProductDetails);
            ps.setString(4, ProductPrice);
            ps.setString(5, ProductImage);
            ps.setString(6, Quantity);
            ps.setString(7, ProductStatus);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public ProductDTO getProductByID(String ID){
        String query = "select * from tblProducts\n"
                + "where ProductID = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, ID);
            rs = ps.executeQuery();
            while(rs.next()){
                return new ProductDTO(rs.getString(1),
                        rs.getString(2), 
                        rs.getString(3),
                        rs.getDouble(4), 
                        rs.getString(5),
                        rs.getInt(6), 
                        rs.getString(7));
            }
        } catch (Exception e) {
        }
        return null;
    }
    public void updateProduct(String ProductID, String ProductName, String ProductDetails, String ProductPrice, String ProductImage, String Quantity, String ProductStatus){
        String query ="update tblProducts\n"
                + "set [ProductName] = ?,\n" 
                + "ProductDetails = ?,\n" 
                + "ProductPrice = ?,\n" 
                + "ProductImage = ?,\n" 
                + "Quantity = ?,\n" 
                + "ProductStatus = ?\n" 
                + "where ProductID = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, ProductName);
            ps.setString(2, ProductDetails);
            ps.setString(3, ProductPrice);
            ps.setString(4, ProductImage);
            ps.setString(5, Quantity);
            ps.setString(6, ProductStatus);
            ps.setString(7, ProductID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
}


