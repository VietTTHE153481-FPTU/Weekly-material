/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author BEAN
 */
public class OrderDetail extends ProductDetailImg {

    int orderID;
    String productName;
    int productPrice;
    int quantity;

    public OrderDetail() {
    }

    public OrderDetail(int orderID, int productID, String productName, int productPrice, int quantity) {
        this.orderID = orderID;
        this.productID = productID;
        this.productName = productName;
        this.productPrice = productPrice;
        this.quantity = quantity;
    }

    public OrderDetail(int productId, String productName, String productImgURL, int ProductPrice, int quantity) {
        this.productID=productId;
        this.productName = productName;
        this.productImgURL=productImgURL;
        this.productPrice=ProductPrice;
        this.quantity=quantity;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
