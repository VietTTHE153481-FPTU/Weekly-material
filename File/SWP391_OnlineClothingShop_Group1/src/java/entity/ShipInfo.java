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
public class ShipInfo {

    private int id;
    private int orderID;
    private String customerName;
    private String shippingAddress;
    private int shipCityID;
    private String phoneNum;
    private String note;

    public ShipInfo() {
    }
    public ShipInfo(int orderID, String customerName, String shippingAddress, int shipCityID, String phoneNum, String note) {
        this.orderID = orderID;
        this.customerName = customerName;
        this.shippingAddress = shippingAddress;
        this.shipCityID = shipCityID;
        this.phoneNum = phoneNum;
        this.note = note;
    }
    public ShipInfo(int id, int orderID, String customerName, String shippingAddress, int shipCityID, String phoneNum, String note) {
        this.id = id;
        this.orderID = orderID;
        this.customerName = customerName;
        this.shippingAddress = shippingAddress;
        this.shipCityID = shipCityID;
        this.phoneNum = phoneNum;
        this.note = note;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public int getShipCityID() {
        return shipCityID;
    }

    public void setShipCityID(int shipCityID) {
        this.shipCityID = shipCityID;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

}
