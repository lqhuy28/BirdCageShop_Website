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
    private static final String UPDATEUSER = "UPDATE tblUsers set fullName=?, password=?, phone=?, email=?, address=?, roleID=? WHERE userID=?";
    private static final String LOGIN = "SELECT FullName, Phone, Email, Address, RoleID, Status FROM tblUsers WHERE UserID=? AND Password=?";
    private static final String searchUser = "select * from tblUsers where (userID like ? or fullname like ?) AND RoleID <> 'Admin' ORDER BY RoleID ASC";
    private static final String listUser = "select * from tblUsers";
    private static final String DELETEUSER = "UPDATE tblUsers \n"
            + "SET Status = CASE\n"
            + "WHEN Status = '0' THEN '1'\n"
            + "WHEN Status = '1' THEN '0'\n"
            + "ELSE Status\n"
            + "end\n"
            + "where userID = ?";
    ;
    private static final String getUserByuserID = "select UserID, FullName, Password, Phone, Email, Address, RoleID,Status FROM tblUsers where userID like ?";
    private static final String UPDATE = "UPDATE tblUsers set fullName=?, password=?, phone=?, email=?, address=?, roleID=? WHERE userID=?";
    private static final String INSERT = "INSERT INTO tblUsers(UserID, FullName, Password, Phone, Email, Address, RoleID, Status) VALUES(?,?,?,?,?,?,?,?)";
    private static final String CHECK_DUPLICATE = "SELECT UserID FROM tblUsers ";

    public List<User> SearchUser(String search) throws SQLException {
        List<User> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = new DBUtils().getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(searchUser);
                ptm.setString(1, "%" + search + "%");
                ptm.setString(2, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String password = "*";
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    String address = rs.getString("address");
                    String roleID = rs.getString("roleID");
                    String status = rs.getString("status");
                    list.add(new User(userID, fullName, password, phone, email, address, roleID, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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

    public void deleteUser(String userID) {
        try {
            conn = new DBUtils().getConnection();
            ptm = conn.prepareStatement(DELETEUSER);
            ptm.setString(1, userID);
            ptm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public User getUserByuserID(String userID) {
        try {
            conn = new DBUtils().getConnection();
            ptm = conn.prepareStatement(getUserByuserID);
            ptm.setString(1, userID);
            rs = ptm.executeQuery();
            while (rs.next()) {
                return new User(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8));
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
    
    public void updatePasswordByEmail(String password,String email){
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "UPDATE tblUsers set password=? WHERE email=?";
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(sql);
            ptm.setString(1, password);
            ptm.setString(2, email);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public User checkLogin(String userID, String password) throws SQLException {
        User user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, userID);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    String address = rs.getString("address");
                    String roleID = rs.getString("roleID");
                    String status = rs.getString("status");
                    user = new User(userID, fullName, password, phone, email, address, roleID, status);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
        return user;
    }

    public boolean insert(User user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, user.getUserID());
                ptm.setString(2, user.getFullName());
                ptm.setString(3, user.getPassword());
                ptm.setString(4, user.getPhone());
                ptm.setString(5, user.getEmail());
                ptm.setString(6, user.getAddress());
                ptm.setString(7, user.getRoleID());
                ptm.setString(8, user.getStatus());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean checkDuplicate(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
        return check;
    }

    public boolean update(User user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, user.getFullName());
                ptm.setString(2, user.getPassword());
                ptm.setString(3, user.getPhone());
                ptm.setString(4, user.getEmail());
                ptm.setString(5, user.getAddress());
                ptm.setString(6, user.getRoleID());
                ptm.setString(7, user.getUserID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }
public int CountCage() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count'\n"
                + "  FROM tblCage";
        try {
            conn = new DBUtils().getConnection();
            ptm = conn.prepareStatement(sql);
            rs = ptm.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public int CountUser() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count'\n"
                + "  FROM tblUsers where RoleID = 'User' ";
        try {
            conn = new DBUtils().getConnection();
            ptm = conn.prepareStatement(sql);
            rs = ptm.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public int CountOrder() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count'\n"
                + "  FROM tblOrders";
        try {
            conn = new DBUtils().getConnection();
            ptm = conn.prepareStatement(sql);
            rs = ptm.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }
    public double CountOrderPrice(){
        double count = 0;
        String sql = "SELECT SUM(Total) AS tong_doanh_thu FROM tblOrders ";
        try {
            conn = new DBUtils().getConnection();
            ptm = conn.prepareStatement(sql);
            rs = ptm.executeQuery();
            while(rs.next()){
                count = rs. getDouble(1);
            }
        } catch (Exception e) {
        }
        return count;
    }
}
