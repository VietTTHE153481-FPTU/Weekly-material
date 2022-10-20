/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Duy Manh
 */
public class UserStatus {
    private int id;
    private String StatusName;

    public UserStatus() {
    }

    public UserStatus(int id, String StatusName) {
        this.id = id;
        this.StatusName = StatusName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatusName() {
        return StatusName;
    }

    public void setStatusName(String StatusName) {
        this.StatusName = StatusName;
    }

    @Override
    public String toString() {
        return "UserStatus{" + "id=" + id + ", StatusName=" + StatusName + '}';
    }
    
    
}
