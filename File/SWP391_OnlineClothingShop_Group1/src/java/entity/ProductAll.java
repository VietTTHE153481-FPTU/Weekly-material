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
public class ProductAll {
    Product product ; 
    ProductDetailImg productImg ; 

    public ProductAll() {
    }

    public ProductAll(Product product, ProductDetailImg productImg) {
        this.product = product;
        this.productImg = productImg;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public ProductDetailImg getProductImg() {
        return productImg;
    }

    public void setProductImg(ProductDetailImg productImg) {
        this.productImg = productImg;
    }

    @Override
    public String toString() {
        return "ProductAll{" + "product=" + product + ", productImg=" + productImg + '}';
    }
    
    
}
