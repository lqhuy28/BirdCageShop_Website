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
    private double ProductPriceNew;
    private double ProductPriceOld;
    private String ProductImage;
    private int Quantity;
    private String ProductStatus;
    private String ProductType;
    private String ProductMaterial;
    private String OtherRequest;

    public ProductDTO() {
    }

    public ProductDTO(String ProductID, String ProductName, String ProductDetails, double ProductPriceNew, double ProductPriceOld, String ProductImage, int Quantity, String ProductStatus, String ProductType, String ProductMaterial, String OtherRequest) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.ProductDetails = ProductDetails;
        this.ProductPriceNew = ProductPriceNew;
        this.ProductPriceOld = ProductPriceOld;
        this.ProductImage = ProductImage;
        this.Quantity = Quantity;
        this.ProductStatus = ProductStatus;
        this.ProductType = ProductType;
        this.ProductMaterial = ProductMaterial;
        this.OtherRequest = OtherRequest;
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

    public double getProductPriceNew() {
        return ProductPriceNew;
    }

    public void setProductPriceNew(double ProductPriceNew) {
        this.ProductPriceNew = ProductPriceNew;
    }

    public double getProductPriceOld() {
        return ProductPriceOld;
    }

    public void setProductPriceOld(double ProductPriceOld) {
        this.ProductPriceOld = ProductPriceOld;
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

    public String getProductType() {
        return ProductType;
    }

    public void setProductType(String ProductType) {
        this.ProductType = ProductType;
    }

    public String getProductMaterial() {
        return ProductMaterial;
    }

    public void setProductMaterial(String ProductMaterial) {
        this.ProductMaterial = ProductMaterial;
    }

    public String getOtherRequest() {
        return OtherRequest;
    }

    public void setOtherRequest(String OtherRequest) {
        this.OtherRequest = OtherRequest;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "ProductID=" + ProductID + ", ProductName=" + ProductName + ", ProductDetails=" + ProductDetails + ", ProductPriceNew=" + ProductPriceNew + ", ProductPriceOld=" + ProductPriceOld + ", ProductImage=" + ProductImage + ", Quantity=" + Quantity + ", ProductStatus=" + ProductStatus + ", ProductType=" + ProductType + ", ProductMaterial=" + ProductMaterial + ", OtherRequest=" + OtherRequest + '}';
    }
}

    
    
