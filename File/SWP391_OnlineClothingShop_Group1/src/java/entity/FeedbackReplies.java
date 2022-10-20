/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Ottelia
 */
public class FeedbackReplies {
    private int id;
    private int feedbackID;
    private int userID;
    private String repliesText;

    public FeedbackReplies() {
    }

    public FeedbackReplies(int id, int feedbackID, int userID, String repliesText) {
        this.id = id;
        this.feedbackID = feedbackID;
        this.userID = userID;
        this.repliesText = repliesText;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getRepliesText() {
        return repliesText;
    }

    public void setRepliesText(String repliesText) {
        this.repliesText = repliesText;
    }
 

    @Override
    public String toString() {
        return "Feedback_Replies{" + "id=" + id + ", feedbackId=" + feedbackID + ", userId=" + userID + ", repliesText=" + repliesText + '}';
    }
    
}
