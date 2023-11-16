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
import model.Category;

/**
 *
 * @author Acer
 */
public class ProductDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private static final String SearchProduct = "select * from tblCage where CageName like ? AND Quantity > 0";

    public List<ProductDTO> getAllProductDTO() {
        List<ProductDTO> list = new ArrayList<>();
        String query = "select * from tblCage where Quantity > 0 ORDER BY CategoryID ASC";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ProductDTO(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<ProductDTO> getAllProductDTOExcept(String ID) {
        List<ProductDTO> list = new ArrayList<>();
        String query = "select * from tblCage where CageID <> ? and Quantity > 0 ";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, ID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ProductDTO(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<ProductDTO> getProductByCategoryID(String cid) {
        List<ProductDTO> list = new ArrayList<>();
        String query = "select * from tblCage\n"
                + "where CategoryID = ? AND Quantity > 0";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ProductDTO(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    
    
    public List<Category> getAllCategory() {
        List<Category> listC = new ArrayList<>();
        String query = "select * from tblCategory WHERE CategoryName <> ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "Lồng Yêu Cầu");
            rs = ps.executeQuery();
            while (rs.next()) {
                listC.add(new Category(rs.getString(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return listC;
    }

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        List<ProductDTO> list = dao.getAllProductDTO();
        for (ProductDTO o : list) {
            System.out.println(o);
        }
    }

    public List<ProductDTO> SearchProduct(String search) throws SQLException {
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
                    String CageID = rs.getString("CageID");
                    String CategoryID = rs.getString("CategoryID");
                    String CageName = rs.getString("CageName");
                    String CageDetails = rs.getString("CageDetails");
                    Double PriceNew = rs.getDouble("PriceNew");
                    Double PriceOld = rs.getDouble("PriceOld");
                    String Image = rs.getString("Image");
                    int Quantity = rs.getInt("Quantity");
                    String Status = rs.getString("Status");
                    list.add(new ProductDTO(CageID, CategoryID, CageName, CageDetails, PriceNew, PriceOld, Image, Quantity, Status));
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

    public void deleteProduct(String id) {
        String query = "UPDATE tblCage \n"
                + "SET Status = CASE\n"
                + "WHEN Status = '0' THEN '1'\n"
                + "WHEN Status = '1' THEN '0'\n"
                + "ELSE Status\n"
                + "end\n"
                + "where CageID = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertProduct(String CageID, String CategoryID, String CageName, String CageDetails, double PriceNew, double PriceOld, String Image, int Quantity, String Status) {
        String query = "insert into tblCage\n"
                + "values(?,?,?,?,?,?,?,?,?)";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, CageID);
            ps.setString(2, CategoryID);
            ps.setString(3, CageName);
            ps.setString(4, CageDetails);
            ps.setDouble(5, PriceNew);
            ps.setDouble(6, PriceOld);
            ps.setString(7, Image);
            ps.setInt(8, Quantity);
            ps.setString(9, Status);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertProductRequest(String CageID, String CategoryID, String CageName, String CageDetails, double PriceNew, double PriceOld, String Image, int Quantity, String Status) {
        String query = "insert into tblCage\n"
                + "values(?,?,?,?,?,?,?,?,?)";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, CageID);
            ps.setString(2, CategoryID);
            ps.setString(3, CageName);
            ps.setString(4, CageDetails);
            ps.setDouble(5, PriceNew);
            ps.setDouble(6, PriceOld);
            ps.setString(7, Image);
            ps.setInt(8, Quantity);
            ps.setString(9, Status);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertMaterialRequest(String CageID, String MaterialID, int Quantity, String Description) {
        String query = "insert into tblCageMaterial\n"
                + "values(?,?,?,?)";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, CageID);
            ps.setString(2, MaterialID);
            ps.setInt(3, Quantity);
            ps.setString(4, Description);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public ProductDTO getProductByID(String ProductID) {
        String query = "select * from tblCage\n"
                + "where CageID = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, ProductID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new ProductDTO(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void updateProduct(String CageID, String CategoryID, String CageName, String CageDetails, double PriceNew, double PriceOld, String Image, int Quantity, String Status) {
        String query = "update tblCage\n"
                + "set [CategoryID] = ?,\n"
                + "CageName = ?,\n"
                + "CageDetails = ?,\n"
                + "PriceNew = ?,\n"
                + "PriceOld = ?,\n"
                + "Image = ?,\n"
                + "Quantity = ?,\n"
                + "Status = ?\n"
                + "where CageID = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, CategoryID);
            ps.setString(2, CageName);
            ps.setString(3, CageDetails);
            ps.setDouble(4, PriceNew);
            ps.setDouble(5, PriceOld);
            ps.setString(6, Image);
            ps.setInt(7, Quantity);
            ps.setString(8, Status);
            ps.setString(9, CageID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateQuantityProduct(String CageID, int Quantity) {
        String query = "update tblCage\n"
                + "set Quantity = ?\n"
                + "where CageID = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, Quantity);
            ps.setString(2, CageID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<ProductDTO> getProductByPriceRange(double minPrice, double maxPrice){
        List<ProductDTO> filterProduct = new ArrayList<>();
        String query = "SELECT * FROM tblCage WHERE PriceNew >= ? AND PriceNew <= ? AND Quantity > 0 ORDER BY PriceNew ASC";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setDouble(1, minPrice);
            ps.setDouble(2, maxPrice);
            rs = ps.executeQuery();
            while (rs.next()) {
                filterProduct.add(new ProductDTO(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9)));
            }
        } catch (Exception e) {
        }
        return filterProduct;
    }
    
}
