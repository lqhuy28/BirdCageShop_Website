/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import utils.DBUtils;

/**
 *
 * @author trand
 */
public class CartDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void insertOrder(String orderID, String orderDate, String delivery, String deliveryDate, String orderStatus, String orderBy, String discount) {
        String query = "insert into tblOrders\n"
                + "values(?,?,?,?,?,?)";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, orderID);
            ps.setString(2, orderDate);
            ps.setString(3, delivery);
            ps.setString(4, deliveryDate);
            ps.setString(5, orderStatus);
            ps.setString(6, orderBy);
            ps.setString(7, discount);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void getOrder(String orderID) {
        String query = "insert into tblOrders\n"
                + "values(?,?,?,?,?,?)";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, orderID);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
