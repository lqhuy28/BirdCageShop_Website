/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.CageMaterial;
import model.Material;
import model.Order;
import model.OrderDetail;
import model.OrderSuccess;
import model.ProductDTO;
import utils.DBUtils;
/**
 *
 * @author Admin
 */
public class OrderDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void insertOrder(String orderID, String userID, String phone, String address, Date orderDate, String orderStatus, String discount, double ship, double totalPrice) {
        String query = "insert into tblOrders\n"
                + "values(?,?,?,?,?,?,?,?,?)";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, orderID);
            ps.setString(2, userID);
            ps.setString(3, phone);
            ps.setString(4, address);
            ps.setDate(5, orderDate);
            ps.setString(6, orderStatus);
            ps.setString(7, discount);
            ps.setDouble(8, ship);
            ps.setDouble(9, totalPrice);
            int rowInserted = ps.executeUpdate();

            if (rowInserted > 0) {
                System.out.println("ngu");
            } else {
                System.out.println("ngu");
            }
        } catch (Exception e) {
        }
    }

    public void insertOrderDetail(String orderID, String cageId, String cageName, double price, int quantity) {
        String query = "insert into tblOrderDetails\n"
                + "values(?,?,?,?,?)";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, orderID);
            ps.setString(2, cageId);
            ps.setString(3, cageName);
            ps.setDouble(4, price);
            ps.setInt(5, quantity);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Order> getOrder(String userID) {
        List<Order> list = new ArrayList<>();
        String query = "select o.OrderID, o.UserID, o.Phone, o.Address,o.OrderDate,o.ShippingCod, o.Total, o.OrderStatus from tblOrders o where o.UserID = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userID);
            ResultSet rs1 = ps.executeQuery();
            while (rs1.next()) {
                String query2 = "select od.CageName, od.CageID from tblOrderDetails od where od.OrderId = ?";
                ps = conn.prepareStatement(query2);
                ps.setString(1, rs1.getString(1));
                ResultSet rs2 = ps.executeQuery();
                String cageID = "";
                String cageName = "";
                while (rs2.next()) {
                    cageName = rs2.getString(1);
                    cageID = rs2.getString(2);
                }
                list.add(new Order(rs1.getString(1),
                        rs1.getString(2),
                        cageID,
                        cageName,
                        rs1.getString(3),
                        rs1.getString(4),
                        rs1.getDate(5),
                        rs1.getDouble(6),
                        rs1.getDouble(7),
                        rs1.getBoolean(8)));
            }
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return list;
    }

    public List<CageMaterial> getMaterialByCageId(String cageId) {
        List<CageMaterial> list = new ArrayList<>();
        String query = "select m.MaterialName, cm.Quantity from tblCageMaterial cm inner join tblMaterial m on cm.MaterialID = m.MaterialID where cm.CageID = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cageId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new CageMaterial(rs.getString(1),
                        rs.getInt(2)));
            }
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return list;
    }

    public List<Order> getOrder() {
        List<Order> list = new ArrayList<>();
        String query = "select o.OrderID, o.UserID, o.Phone, o.Address,o.OrderDate,o.ShippingCod, o.Total, o.OrderStatus from tblOrders o";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getDouble(6),
                        rs.getDouble(7),
                        rs.getBoolean(8)));
            }
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return list;
    }

    public List<OrderDetail> getOrderDetailById(String orderId) {
        List<OrderDetail> list = new ArrayList<>();
        String query = "SELECT od.CageName,od.Quantity,od.Price,c.Image\n"
                + "  FROM tblOrderDetails od inner join tblCage c on c.CageID = od.CageID\n"
                + "  where od.OrderID = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, orderId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(rs.getString(1),
                        rs.getInt(2),
                        rs.getDouble(3),
                        rs.getString(4)));
            }
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return list;
    }

    public List<Order> getOrderByID(String orderId) {
        List<Order> list = new ArrayList<>();
        String query = "select o.OrderID, o.UserID, o.Phone, o.Address,o.OrderDate,o.ShippingCod, o.Total, o.OrderStatus from tblOrders o\n"
                + "                where orderID like ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, orderId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getDouble(6),
                        rs.getDouble(7),
                        rs.getBoolean(8)));
            }
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return list;
    }

    public List<OrderSuccess> getOrderDetailSuccessById(String orderId) {
        List<OrderSuccess> list = new ArrayList<>();
        String query = "SELECT od.OrderID, o.OrderDate, od.CageName,od.Quantity,od.Price,o.ShippingCod\n"
                + "FROM tblOrderDetails od inner join tblCage c on c.CageID = od.CageID\n"
                + "inner join tblOrders o on o.OrderID = od.OrderID\n"
                + "where od.OrderID = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, orderId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderSuccess(rs.getString(1), rs.getString(3), rs.getDate(2), rs.getInt(4), rs.getDouble(5), rs.getDouble(6)));
            }
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return list;
    }

    public void deleteOrder(String orderId) {
        String query = "delete from tblOrderDetails where OrderID = ?\n"
                + "  delete from tblOrders where OrderID = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, orderId);
            ps.setString(2, orderId);
            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    public void changeOrderStatus(String orderId) {
        String query = "UPDATE tblOrders \n"
                + "SET OrderStatus = CASE\n"
                + "WHEN OrderStatus = '0' THEN '1'\n"
                + "WHEN OrderStatus = '1' THEN '0'\n"
                + "ELSE OrderStatus\n"
                + "end\n"
                + "where OrderID = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, orderId);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Order> getOrder(Date orderDate) {
        List<Order> list = new ArrayList<>();
        String query = "select o.OrderID, o.UserID, o.Phone, o.Address,o.OrderDate,o.ShippingCod, o.Total, o.OrderStatus from tblOrders o\n"
                + "                where o.OrderDate = ?";

        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setDate(1, orderDate);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getDouble(6),
                        rs.getDouble(7),
                        rs.getBoolean(8)));
            }
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return list;
    }

    public List<Order> searchOrder(String search) {
        List<Order> list = new ArrayList<>();
        String query = "select o.OrderID, o.UserID, o.Phone, o.Address,o.OrderDate,o.ShippingCod, o.Total, o.OrderStatus from tblOrders o\n"
                + "                where orderID like ?";
        try {
            conn = new DBUtils().getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(query);
                ps.setString(1, "%" + search + "%");
                rs = ps.executeQuery();
                while (rs.next()) {
                    list.add(new Order(rs.getString(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getDate(5),
                            rs.getDouble(6),
                            rs.getDouble(7),
                            rs.getBoolean(8)));
                }
            }
        } catch (Exception e) {
        }
        return list;
    }
}
