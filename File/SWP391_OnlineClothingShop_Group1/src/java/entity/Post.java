/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Admin
 */
public class Post {

    private int ID;
    private String Description;
    private int UserID;
    private String date;
    private int CategoryID;
    private String PostImgURL;

    public Post(int ID, String Description, int UserID, String date, int CategoryID, String PostImgURL) {
        this.ID = ID;
        this.Description = Description;
        this.UserID = UserID;
        this.date = date;
        this.CategoryID = CategoryID;
        this.PostImgURL = PostImgURL;
    }

    public Post() {
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getPostImgURL() {
        return PostImgURL;
    }

    public void setPostImgURL(String PostImgURL) {
        this.PostImgURL = PostImgURL;
    }
    @Override
    public String toString() {
        return "Post{" + "ID=" + ID +",Author="+UserID + ",description="+Description +",CategoryID: "+ CategoryID+ ",imagelink= "+PostImgURL+ '}' ;
    }
}
