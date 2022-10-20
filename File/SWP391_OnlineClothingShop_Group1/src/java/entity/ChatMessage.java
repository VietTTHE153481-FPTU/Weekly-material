/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Date;

/**
 *
 * @author Ottelia
 */
public class ChatMessage {
    

    
    private int mId;
    private int fromId;
    private int toId;
    private String content;
    private Date dateCreated;
    private int status;
    
    public ChatMessage() {
    }

    public ChatMessage(int fromId, int toId, String content) {
        this.fromId = fromId;
        this.toId = toId;
        this.content = content;
        this.status = 1;
    }

    public ChatMessage(int fromId, int toId, String content, int status) {
        this.fromId = fromId;
        this.toId = toId;
        this.content = content;
        this.status = status;
    }
    
    
    
    public ChatMessage(int mId, int fromId, int toId, String content, Date dateCreated,int status) {
        this.mId = mId;
        this.fromId = fromId;
        this.toId = toId;
        this.content = content;
        this.dateCreated = dateCreated;
        this.status = status;
    }

  
    
    public int getmId() {
        return mId;
    }

    public void setmId(int mId) {
        this.mId = mId;
    }

    public int getFromId() {
        return fromId;
    }

    public void setFromId(int fromId) {
        this.fromId = fromId;
    }

    public int getToId() {
        return toId;
    }

    public void setToId(int toId) {
        this.toId = toId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
    
}
