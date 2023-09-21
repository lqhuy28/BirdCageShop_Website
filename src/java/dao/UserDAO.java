/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class UserDAO {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        private static final String UPDATEUSER="UPDATE tblUsers set fullName=?, password=?, phone=?, email=?, address=?, roleID=? WHERE userID=?";
        private static final String LOGIN = "SELECT FullName, Phone, Email, Address, RoleID FROM tblUsers WHERE UserID=? AND Password=? ";
        private static final String searchUser = "select * from tblUsers where fullname like ?";
        private static final String listUser = "select * from tblUsers";
        private static final String DELETEUSER = "delete from tblUsers where userID = ?";
        private static final String getUserByuserID = "select UserID, FullName, Password, Phone, Email, Address, RoleID FROM tblUsers where userID like ?";
        public List<User> SearchUser(String search) throws SQLException{
        List<User> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = new DBUtils().getConnection();
            if (conn != null) {
            ptm = conn.prepareStatement(searchUser);
            ptm.setString(1, "%" + search + "%");
            rs = ptm.executeQuery();
            while(rs.next()){
                String userID= rs.getString("userID");
                String fullName= rs.getString("fullName");
                String password= rs.getString("password");
                String phone= rs.getString("phone");
                String email= rs.getString("email");
                String address= rs.getString("address");
                String roleID= rs.getString("roleID");
                list.add(new User(userID, fullName, password, phone, email, address, roleID));
            }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }        
    public void deleteUser(String userID){
        try {
            conn = new DBUtils().getConnection();
            ptm = conn.prepareStatement(DELETEUSER);
            ptm.setString(1, userID);
            ptm.executeUpdate();
        } catch (Exception e) {
        }
    }
    public User getUserByuserID(String userID){
        try {
            conn = new DBUtils().getConnection();
            ptm = conn.prepareStatement(getUserByuserID);
            ptm.setString(1, userID);
            rs = ptm.executeQuery();
            while(rs.next()){
                return new User(rs.getString(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getString(4), 
                        rs.getString(5), 
                        rs.getString(6),
                        rs.getString(7));
            }
        } catch (Exception e) {
        }
        return null;
    }
public void updateUser(String userID, String fullName, String password, String phone,
        String email, String address, String roleID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
                ptm = conn.prepareStatement(UPDATEUSER);
                ptm.setString(1, fullName);
                ptm.setString(2, password);
                ptm.setString(3, phone);
                ptm.setString(4, email);
                ptm.setString(5, address);
                ptm.setString(6, roleID);
                ptm.setString(7, userID);
                ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
   
}
