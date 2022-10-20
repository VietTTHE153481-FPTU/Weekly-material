/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Objects;

/**
 *
 * @author Duy Manh
 */
public class Cart {
    private int ProductID;
    private String ProductName;
    private int amount;
    private int SellPrice;
    private String ProductImg;

    public Cart() {
    }

    public Cart(int ProductID, String ProductName, int amount, int SellPrice, String ProductImg) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.amount = amount;
        this.SellPrice = SellPrice;
        this.ProductImg = ProductImg;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getSellPrice() {
        return SellPrice;
    }

    public void setSellPrice(int SellPrice) {
        this.SellPrice = SellPrice;
    }

    public String getProductImg() {
        return ProductImg;
    }

    public void setProductImg(String ProductImg) {
        this.ProductImg = ProductImg;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Cart other = (Cart) obj;
        if (this.ProductID != other.ProductID) {
            return false;
        }
        if (this.amount != other.amount) {
            return false;
        }
        if (this.SellPrice != other.SellPrice) {
            return false;
        }
        if (!Objects.equals(this.ProductName, other.ProductName)) {
            return false;
        }
        if (!Objects.equals(this.ProductImg, other.ProductImg)) {
            return false;
        }
        return true;
    }
    
}

