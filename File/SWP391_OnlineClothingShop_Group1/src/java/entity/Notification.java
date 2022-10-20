/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;

/**
 *
 * @author SAKURA
 */
public class Notification {
    private int id;
    private int UserID;
    private int OrderID;
    private String content;
    private int status;
    private Date time;

    public Notification() {
    }

    public Notification(int id, int UserID, int OrderID, String content, int status, Date time) {
        this.id = id;
        this.UserID = UserID;
        this.OrderID = OrderID;
        this.content = content;
        this.status = status;
        this.time = time;
    }
    public Notification(int UserID, int OrderID, String content) {
        this.UserID = UserID;
        this.OrderID = OrderID;
        this.content = content;
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

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    
    
}
