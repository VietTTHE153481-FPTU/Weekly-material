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
public class Delivery {
    private int ShipInfoID;
    private int UserId;
    private int ShipStatus;

    public Delivery() {
    }

    public Delivery(int ShipInfoID, int UserId, int ShipStatus) {
        this.ShipInfoID = ShipInfoID;
        this.UserId = UserId;
        this.ShipStatus = ShipStatus;
    }

    public int getShipInfoID() {
        return ShipInfoID;
    }

    public void setShipInfoID(int ShipInfoID) {
        this.ShipInfoID = ShipInfoID;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int UserId) {
        this.UserId = UserId;
    }

    public int getShipStatus() {
        return ShipStatus;
    }

    public void setShipStatus(int ShipStatus) {
        this.ShipStatus = ShipStatus;
    }

    public int getShipInfo() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
