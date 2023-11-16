/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


public class CageMaterial {
    String cageId;
    String materialName;
    int quantity;
    String description;

    public CageMaterial() {
    }

    public CageMaterial(String cageId, String materialName, int quantity, String description) {
        this.cageId = cageId;
        this.materialName = materialName;
        this.quantity = quantity;
        this.description = description;
    }

    public CageMaterial(String materialName, int quantity) {
        this.materialName = materialName;
        this.quantity = quantity;
    }
    

    public String getCageId() {
        return cageId;
    }

    public void setCageId(String cageId) {
        this.cageId = cageId;
    }

    public String getMaterialName() {
        return materialName;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    
}
