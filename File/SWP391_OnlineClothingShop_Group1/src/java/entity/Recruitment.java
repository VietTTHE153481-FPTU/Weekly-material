/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author LAMDTHE153097
 */
public class Recruitment {
    int id;
    String ImageLink;

    public Recruitment() {
    }

    public Recruitment(int id, String ImageLink) {
        this.id = id;
        this.ImageLink = ImageLink;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImageLink() {
        return ImageLink;
    }

    public void setImageLink(String ImageLink) {
        this.ImageLink = ImageLink;
    }
    
}
