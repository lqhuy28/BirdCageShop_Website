/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Acer
 */
public class ProductDTO {
    private String CageID;
    private String CategoryID;
    private String CageName;
    private String CageDetails;
    private double PriceNew;
    private double PriceOld;
    private String Image;
    private int Quantity;
    private String Status;

    public ProductDTO() {
    }

    public ProductDTO(String CageID, String CategoryID, String CageName, String CageDetails, double PriceNew, double PriceOld, String Image, int Quantity, String Status) {
        this.CageID = CageID;
        this.CategoryID = CategoryID;
        this.CageName = CageName;
        this.CageDetails = CageDetails;
        this.PriceNew = PriceNew;
        this.PriceOld = PriceOld;
        this.Image = Image;
        this.Quantity = Quantity;
        this.Status = Status;
    }

    public String getCageID() {
        return CageID;
    }

    public void setCageID(String CageID) {
        this.CageID = CageID;
    }

    public String getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(String CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getCageName() {
        return CageName;
    }

    public void setCageName(String CageName) {
        this.CageName = CageName;
    }

    public String getCageDetails() {
        return CageDetails;
    }

    public void setCageDetails(String CageDetails) {
        this.CageDetails = CageDetails;
    }

    public double getPriceNew() {
        return PriceNew;
    }

    public void setPriceNew(double PriceNew) {
        this.PriceNew = PriceNew;
    }

    public double getPriceOld() {
        return PriceOld;
    }

    public void setPriceOld(double PriceOld) {
        this.PriceOld = PriceOld;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "CageID=" + CageID + ", CategoryID=" + CategoryID + ", CageName=" + CageName + ", CageDetails=" + CageDetails + ", PriceNew=" + PriceNew + ", PriceOld=" + PriceOld + ", Image=" + Image + ", Quantity=" + Quantity + ", Status=" + Status + '}';
    }

}