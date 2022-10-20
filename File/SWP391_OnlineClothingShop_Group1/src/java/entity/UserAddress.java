/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author SAKURA
 */
public class UserAddress {
    private int id;
    private int UserID;
    private String ShipName;
    private String ShipAddress;
    private int ShipCityID;
    private String PhoneNum;

    public UserAddress() {
    }

    public UserAddress(int id, int UserID, String ShipName, String ShipAddress, int ShipCityID, String PhoneNum) {
        this.id = id;
        this.UserID = UserID;
        this.ShipName = ShipName;
        this.ShipAddress = ShipAddress;
        this.ShipCityID = ShipCityID;
        this.PhoneNum = PhoneNum;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getShipName() {
        return ShipName;
    }

    public void setShipName(String ShipName) {
        this.ShipName = ShipName;
    }

    public String getShipAddress() {
        return ShipAddress;
    }

    public void setShipAddress(String ShipAddress) {
        this.ShipAddress = ShipAddress;
    }

    public int getShipCityID() {
        return ShipCityID;
    }

    public void setShipCityID(int ShipCityID) {
        this.ShipCityID = ShipCityID;
    }

    public String getPhoneNum() {
        return PhoneNum;
    }

    public void setPhoneNum(String PhoneNum) {
        this.PhoneNum = PhoneNum;
    }

    
    
}
