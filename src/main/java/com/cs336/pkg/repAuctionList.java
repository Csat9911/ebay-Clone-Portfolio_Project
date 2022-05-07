package com.cs336.pkg;

public class repAuctionList {
    private int aucID;
    private String userID;
    private int currMaxBid;
    private int itemID;
    private int secretMin;
    private String TimeStamp;
 
 
    public repAuctionList(int aucID, String userID, String TimeStamp, int secretMin, int itemID, int currMaxBid) {
        super();
        this.aucID = aucID;
        this.userID = userID;
        this.TimeStamp = TimeStamp;
        this.currMaxBid = currMaxBid;
        this.secretMin = secretMin;
        this.itemID = itemID;
        
    }
    
    public String getUserID() {
        return userID;
    }
 
    public void setUserID(String userID) {
        this.userID = userID;
    }
    
    public int getaucID() {
        return aucID;
    }
 
    public void setaucID(int aucID) {
        this.aucID = aucID;
    }
    
    public String getTimeStamp() {
        return TimeStamp;
    }
 
    public void setTimeStamp(String TimeStamp) {
        this.TimeStamp = TimeStamp;
    }

    public int getSecret() {
        return secretMin;
    }
 
    public void setSecret(int secretMin) {
        this.secretMin = secretMin;
    }
    
    public int getItem() {
        return itemID;
    }
 
    public void setItem(int itemID) {
        this.itemID = itemID;
    }
    
    public int getMaxBid() {
        return currMaxBid;
    }
 
    public void setbidAmt(int currMaxBid) {
        this.currMaxBid = currMaxBid;
    }
    
}