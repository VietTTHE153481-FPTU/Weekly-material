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
public class SubCategory {
    int subCateID ; 
    int cateID ; 
    String subCateName ;

    public SubCategory() {
    }

    public SubCategory(int subCateID, int cateID, String subCateName) {
        this.subCateID = subCateID;
        this.cateID = cateID;
        this.subCateName = subCateName;
    }

    public int getSubCateID() {
        return subCateID;
    }

    public void setSubCateID(int subCateID) {
        this.subCateID = subCateID;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public String getSubCateName() {
        return subCateName;
    }

    public void setSubCateName(String subCateName) {
        this.subCateName = subCateName;
    }
    
    
}
