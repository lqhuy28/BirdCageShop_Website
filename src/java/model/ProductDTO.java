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
    private String ProductID;
    private String ProductName;
    private String ProductDetails;
    private double ProductPrice;
    private String ProductImage;
    private int Quantity;
    private String ProductStatus;

    public ProductDTO() {
    }

    public ProductDTO(String ProductID, String ProductName, String ProductDetails, double ProductPrice, String ProductImage, int Quantity, String ProductStatus) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.ProductDetails = ProductDetails;
        this.ProductPrice = ProductPrice;
        this.ProductImage = ProductImage;
        this.Quantity = Quantity;
        this.ProductStatus = ProductStatus;
    }

    public String getProductID() {
        return ProductID;
    }

    public void setProductID(String ProductID) {
        this.ProductID = ProductID;
    }


    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public String getProductDetails() {
        return ProductDetails;
    }

    public void setProductDetails(String ProductDetails) {
        this.ProductDetails = ProductDetails;
    }

    public double getProductPrice() {
        return ProductPrice;
    }

    public void setProductPrice(double ProductPrice) {
        this.ProductPrice = ProductPrice;
    }

    public String getProductImage() {
        return ProductImage;
    }

    public void setProductImage(String ProductImage) {
        this.ProductImage = ProductImage;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public String getProductStatus() {
        return ProductStatus;
    }

    public void setProductStatus(String ProductStatus) {
        this.ProductStatus = ProductStatus;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "ProductID=" + ProductID + ", ProductName=" + ProductName + ", ProductDetails=" + ProductDetails + ", ProductPrice=" + ProductPrice + ", ProductImage=" + ProductImage + ", Quantity=" + Quantity + ", ProductStatus=" + ProductStatus + '}';
    }
    
    
}
