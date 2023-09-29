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
                        rs.getString(4), 
                        rs.getDouble(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9), 
                        rs.getString(10), 
                        rs.getString(11), 
                        rs.getString(12)));
            }
        }   catch (Exception e){
        }
        return list;
    }
    
    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        List<ProductDTO> list = dao.getAllProductDTO();
        for (ProductDTO o : list){
            System.out.println(o);
        }
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
                    String CategoryID = rs.getString("CategoryID");
                    String ProductName = rs.getString("ProductName");
                    String ProductDetails = rs.getString("ProductDetails");
                    Double ProductPriceNew = rs.getDouble("ProductPriceNew");
                    Double ProductPriceOld = rs.getDouble("ProductPriceOld");
                    String ProductImage = rs.getString("ProductImage");
                    int Quantity = rs.getInt("Quantity");
                    String ProductStatus = rs.getString("ProductStatus");
                    String ProductType = rs.getString("ProductType");
                    String ProductMaterial = rs.getString("ProductMaterial");
                    String OtherRequest = rs.getString("OtherRequest");
                    list.add(new ProductDTO(ProductID, CategoryID, ProductName, ProductDetails, ProductPriceNew, ProductPriceOld, ProductImage, Quantity, ProductStatus, ProductType, ProductMaterial, OtherRequest));
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
    public void insertProduct(String ProductID, String CategoryID, String ProductName, String ProductDetails, double ProductPriceNew, double ProductPriceOld, String ProductImage, int Quantity, String ProductStatus, String ProductType, String ProductMaterial, String OtherRequest){
        String query = "insert into tblProducts\n"
                + "values(?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, ProductID);
            ps.setString(2, CategoryID);
            ps.setString(3, ProductName);
            ps.setString(4, ProductDetails);
            ps.setDouble(5, ProductPriceNew);
            ps.setDouble(6, ProductPriceOld);
            ps.setString(7, ProductImage);
            ps.setInt(8, Quantity);
            ps.setString(9, ProductStatus);
            ps.setString(10, ProductType);
            ps.setString(11, ProductMaterial);
            ps.setString(12, OtherRequest);
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
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12));
            }
        } catch (Exception e) {
        }
        return null;
    }
    public void updateProduct(String ProductID, String CategoryID, String ProductName, String ProductDetails, double ProductPriceNew, double ProductPriceOld, String ProductImage, int Quantity, String ProductStatus, String ProductType, String ProductMaterial, String OtherRequest){
        String query ="update tblProducts\n" 
                + "set [CategoryID] = ?,\n" 
                + "ProductName = ?,\n" 
                + "ProductDetails = ?,\n" 
                + "ProductPriceNew = ?,\n" 
                + "ProductPriceOld = ?,\n" 
                + "ProductImage = ?,\n" 
                + "Quantity = ?,\n" 
                + "ProductStatus = ?,\n" 
                + "ProductType = ?,\n" 
                + "ProductMaterial = ?,\n" 
                + "OtherRequest = ?\n" 
                + "where ProductID = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, CategoryID);
            ps.setString(2, ProductName);
            ps.setString(3, ProductDetails);
            ps.setDouble(4, ProductPriceNew);
            ps.setDouble(5, ProductPriceOld);
            ps.setString(6, ProductImage);
            ps.setInt(7, Quantity);
            ps.setString(8, ProductStatus);
            ps.setString(9, ProductType);
            ps.setString(10, ProductMaterial);
            ps.setString(11, OtherRequest);
            ps.setString(12, ProductID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
}


