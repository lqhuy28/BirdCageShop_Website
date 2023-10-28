/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author QUANHONG
 */
public class UserError {

    private String userIDError;
    private String fullNameError;
    private String passwordError;
    private String phoneError;
    private String emailError;
    private String addressError;
    private String roleIDError;
    private String confirmError;
    private String statusError;

    public UserError() {
        this.userIDError = "";
        this.fullNameError = "";
        this.passwordError = "";
        this.phoneError = "";
        this.emailError = "";
        this.addressError = "";
        this.confirmError = "";
        this.roleIDError = "";
        this.statusError = "";
    }

    public UserError(String userIDError, String fullNameError, String passwordError, String phoneError, String emailError, String addressError, String roleIDError, String confirmError) {
        this.userIDError = userIDError;
        this.fullNameError = fullNameError;
        this.passwordError = passwordError;
        this.phoneError = phoneError;
        this.emailError = emailError;
        this.addressError = addressError;
        this.roleIDError = roleIDError;
        this.confirmError = confirmError;
        this.statusError = statusError;

    }

    public String getRoleIDError() {
        return roleIDError;
    }

    public void setRoleIDError(String roleIDError) {
        this.roleIDError = roleIDError;
    }

    public String getConfirmError() {
        return confirmError;
    }

    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getFullNameError() {
        return fullNameError;
    }

    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getPhoneError() {
        return phoneError;
    }

    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }

    public String getEmailError() {
        return emailError;
    }

    public void setemailError(String emailError) {
        this.emailError = emailError;
    }

    public String getAddressError() {
        return addressError;
    }

    public void setAddressError(String addressError) {
        this.addressError = addressError;
    }

    public String getStatusError() {
        return statusError;
    }

    public void setStatusError(String statusError) {
        this.statusError = statusError;
    }

}
