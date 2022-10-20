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
public class Users {
    //Chỉnh sửa lại thuộc tính: LAMDTHE153097
    int userID;
    String userName;
    String password;
    String email;
    int roleID;
    int statusID;

    public Users() {
    }

    public Users(int userID, String userName, String password, String email, int roleID, int statusID) {
        this.userID = userID;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.roleID = roleID;
        this.statusID = statusID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getStatusID() {
        switch (statusID) {
            case 1:
                return "Active";
            case 2:
                return "Locked";
            case 3:
                return "Gmail Login";
            default:
                return "Unverified";
        }
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }

    @Override
    public String toString() {
        return "Users{" + "userID=" + userID + ", userName=" + userName + ", password=" + password + ", email=" + email + ", roleID=" + roleID + ", statusID=" + statusID + '}';
    }

}
