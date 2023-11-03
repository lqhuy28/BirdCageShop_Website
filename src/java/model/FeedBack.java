/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author QUANHONG
 */
public class FeedBack {
    private int feedbackId;
    private Date feedbackDate;
    private String userID;
    private String orderId;
    private String fullName;
    private String rating;
    private String comment;

    public FeedBack(String userID, String orderId, String fullName, String rating, String comment) {
        this.userID = userID;
        this.orderId = orderId;
        this.fullName = fullName;
        this.rating = rating;
        this.comment = comment;
    }

    public FeedBack(Date feedbackDate, String userID, String orderId, String fullName, String rating, String comment) {
        this.feedbackDate = feedbackDate;
        this.userID = userID;
        this.orderId = orderId;
        this.fullName = fullName;
        this.rating = rating;
        this.comment = comment;
    }

    public FeedBack(int feedbackId, Date feedbackDate, String userID, String orderId, String fullName, String rating, String comment) {
        this.feedbackId = feedbackId;
        this.feedbackDate = feedbackDate;
        this.userID = userID;
        this.orderId = orderId;
        this.fullName = fullName;
        this.rating = rating;
        this.comment = comment;
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }
    

    public Date getFeedbackDate() {
        return feedbackDate;
    }

    public void setFeedbackDate(Date feedbackDate) {
        this.feedbackDate = feedbackDate;
    }
    
    

    public FeedBack() {
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    
    public String getRating() {
        return rating;
    }
    
    public void setRating(String rating) {
        this.rating = rating;
    }
    
    public String getComment() {
        return comment;
    }
    
    public void setComment(String comment) {
        this.comment = comment;
    }
    
    
}
