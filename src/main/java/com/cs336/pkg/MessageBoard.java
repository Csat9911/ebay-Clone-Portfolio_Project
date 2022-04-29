package com.cs336.pkg;

public class MessageBoard {
    private int id;
    private String userID;
    private String TimeStamp;
    private String Message;
 
    public MessageBoard(int id, String userID, String TimeStamp, String Message) {
        super();
        this.id = id;
        this.userID = userID;
        this.TimeStamp = TimeStamp;
        this.Message = Message;
        
    }
 
    public int getId() {
        return id;
    }
 
    public void setId(int id) {
        this.id = id;
    }
 
    public String getUserID() {
        return userID;
    }
 
    public void setUserID(String userID) {
        this.userID = userID;
    }
    
    public String getTimeStamp() {
        return TimeStamp;
    }
 
    public void setTimeStamp(String TimeStamp) {
        this.TimeStamp = TimeStamp;
    }
    
    public String getMessage() {
        return Message;
    }
 
    public void setMessage(String Message) {
        this.Message = Message;
    }
}