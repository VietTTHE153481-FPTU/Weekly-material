package entity;

import java.util.List;

/**
 *
 * @author Duy Manh
 */
public class ProductDetail {
    int productID ;
    String productName ; 
    String  desc ;
    double originPrice ; 
    double sellPrice ; 
    double  salePercent ; 
    int subCateID ; 
    int sellerID ; 
    int amount ; 
    int statusID ; 
    int brandID ;
    double height ;
    double width ;
    double weight ;
    List<String> images;

    public ProductDetail() {
    }

    public ProductDetail(int productID, String productName, String desc, double originPrice, double sellPrice, double salePercent, int subCateID, int sellerID, int amount, int statusID, int brandID, double height, double width, double weight, List<String> images) {
        this.productID = productID;
        this.productName = productName;
        this.desc = desc;
        this.originPrice = originPrice;
        this.sellPrice = sellPrice;
        this.salePercent = salePercent;
        this.subCateID = subCateID;
        this.sellerID = sellerID;
        this.amount = amount;
        this.statusID = statusID;
        this.brandID = brandID;
        this.height = height;
        this.width = width;
        this.weight = weight;
        this.images = images;
    }
    
    

    public int getProductID() {
        return productID;
    }

    public String getProductName() {
        return productName;
    }

    public String getDesc() {
        return desc;
    }

    public double getOriginPrice() {
        return originPrice;
    }

    public double getSellPrice() {
        return sellPrice;
    }

    public double getSalePercent() {
        return salePercent;
    }

    public int getSubCateID() {
        return subCateID;
    }

    public int getSellerID() {
        return sellerID;
    }

    public int getAmount() {
        return amount;
    }

    public int getStatusID() {
        return statusID;
    }

    public int getBrandID() {
        return brandID;
    }

    public double getHeight() {
        return height;
    }

    public double getWidth() {
        return width;
    }

    public double getWeight() {
        return weight;
    }

    public List<String> getImages() {
        return images;
    }

    
    
    
    


}