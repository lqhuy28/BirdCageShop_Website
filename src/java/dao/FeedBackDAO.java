/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.CageMaterial;
import model.FeedBack;
import model.Reponse;
import utils.DBUtils;

/**
 *
 * @author QUANHONG
 */
public class FeedBackDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<FeedBack> getFeedbackByCageId(String cageId) {
        List<FeedBack> list = new ArrayList<>();
        String query = "select * from tblFeedback f inner join tblOrderDetails od on od.OrderID = f.OrderID where od.CageID = ?";

        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cageId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new FeedBack(rs.getInt(1),rs.getDate(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return list;
    }

    public String getOrderByCageId(String pid, String userID) {
        String userId = "";
        String query = "select top(1) o.UserID from tblOrders o inner join tblOrderDetails od on od.OrderID = o.OrderID where od.CageID = ? and o.UserID = ? order by o.OrderDate desc";

        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.setString(2, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                userId = rs.getString(1);
            }
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return userId;
    }

    public void createFeedbackByUserId(FeedBack f) {
        String query = "insert into tblFeedback\n"
                + "values(?,?,?,?,?,?)";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setDate(1, f.getFeedbackDate());
            ps.setString(2, f.getUserID());
            ps.setString(3, f.getOrderId());
            ps.setString(4, f.getFullName());
            ps.setString(5, f.getRating());
            ps.setString(6, f.getComment());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void createReplyFeedbackByUserId(int idF, String userId, String reply, Date date) {
        String query = "insert into Response\n"
                + "values(?,?,?,?)";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, idF);
            ps.setString(2, userId);
            ps.setString(3, reply);
            ps.setDate(4, date);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public List<Reponse> getReplyFeedbackByCageId() {
        List<Reponse> list = new ArrayList<>();
        String query = "select r.FeedbackID, u.FullName, r.Comment, r.FeedbackDate from Response r inner join tblUsers u on u.UserID = r.UserID";

        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Reponse(rs.getInt(1),rs.getString(2), rs.getString(3),
                        rs.getDate(4)));
            }
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return list;
    }

    public String getOrdeIdrByCageId(String id) {
        String orderId = "";
        String query = "select top(1) o.OrderID from tblOrders o inner join tblOrderDetails od on od.OrderID = o.OrderID where od.CageID = ? order by o.OrderDate desc";

        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                orderId = rs.getString(1);
            }
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return orderId;
    }

    public List<FeedBack> getAllFeedback() {
        List<FeedBack> list = new ArrayList<>();
        String query = "select * from tblFeedback";

        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new FeedBack(rs.getInt(1),rs.getDate(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return list;
    }
    public List<FeedBack> searchFeedback(String search){
        List<FeedBack> list = new ArrayList<>();
        String query = "select * from tblFeedback where fullName like ? or userID like ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + search + "%");
            ps.setString(2, "%" + search + "%");
            rs = ps.executeQuery();
            while(rs.next()){
                int feedbackId = rs.getInt("feedbackID");
                Date feedbackDate = rs.getDate("feedbackDate");
                String userID = rs.getString("userID");
                String orderId = rs.getString("orderId");
                String fullName = rs.getString("fullName");
                String rating = rs.getString("rating");
                String comment = rs.getString("comment");
                list.add(new FeedBack(feedbackId, feedbackDate, userID, orderId, fullName, rating, comment));
            }
        } catch (Exception e) {
        }
        return list;
    }
}
