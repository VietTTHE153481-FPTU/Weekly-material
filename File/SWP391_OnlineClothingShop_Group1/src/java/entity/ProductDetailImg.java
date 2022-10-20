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
public class ProductDetailImg {
    int productID ; 
    String productImgURL ; 
    String fullImg ;  
    String topImg ; 
    String bottomImg ; 
    String otherImg ; 

    public ProductDetailImg() {
    }

    public ProductDetailImg(int productID, String productImgURL, String fullImg, String topImg, String bottomImg, String otherImg) {
        this.productID = productID;
        this.productImgURL = productImgURL;
        this.fullImg = fullImg;
        this.topImg = topImg;
        this.bottomImg = bottomImg;
        this.otherImg = otherImg;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductImgURL() {
        return productImgURL;
    }

    public void setProductImgURL(String productImgURL) {
        this.productImgURL = productImgURL;
    }

    public String getFullImg() {
        return fullImg;
    }

    public void setFullImg(String fullImg) {
        this.fullImg = fullImg;
    }

    public String getTopImg() {
        return topImg;
    }

    public void setTopImg(String topImg) {
        this.topImg = topImg;
    }

    public String getBottomImg() {
        return bottomImg;
    }

    public void setBottomImg(String bottomImg) {
        this.bottomImg = bottomImg;
    }

    public String getOtherImg() {
        return otherImg;
    }

    public void setOtherImg(String otherImg) {
        this.otherImg = otherImg;
    }

    @Override
    public String toString() {
        return "ProductDetailImg{" + "productID=" + productID + ", productImgURL=" + productImgURL + ", fullImg=" + fullImg + ", topImg=" + topImg + ", bottomImg=" + bottomImg + ", otherImg=" + otherImg + '}';
    }

    
    
    
}
