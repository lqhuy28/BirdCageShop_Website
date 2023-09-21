/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Admin
 */
public class User {
    private String userID;
    private String fullName;
    private String password;
    private String phone;
    private String email;
    private String address;
    private String roleID;

    public User() {
        
    }

    public User(String userID, String fullName, String password, String phone, String email, String address, String roleID) {
        this.userID = userID;
        this.fullName = fullName;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.roleID = roleID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    @Override
    public String toString() {
        return "userID=" + userID + ", fullName=" + fullName + ", password=" + password + ", phone=" + phone + ", email=" + email + ", address=" + address + ", roleID=" + roleID + '}';
    }

   
}
