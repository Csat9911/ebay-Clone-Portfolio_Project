package com.cs336.pkg;

public class repBidList {
    private int bidID;
    private int aucID;
    private String userID;
    private int upLim;
    private int increment;
    private int bidAmt;

 
 
    public repBidList(int bidID, int aucID, String userID, int upLim, int increment, int bidAmt) {
        super();
        this.bidID = bidID;
        this.aucID = aucID;
        this.userID = userID;
        this.upLim = upLim;
        this.increment = increment;
        this.bidAmt = bidAmt;

    }
 
    public int getbidID() {
        return bidID;
    }
 
    public void setBidID(int bidID) {
        this.bidID = bidID;
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

    public int getupLim() {
        return upLim;
    }
 
    public void setupLim(int upLim) {
        this.upLim = upLim;
    }
    
    public int getincrement() {
        return increment;
    }
 
    public void setincrement(int increment) {
        this.increment = increment;
    }
    
    public int getbidAmt() {
        return bidAmt;
    }
 
    public void setbidAmt(int bidAmt) {
        this.bidAmt = bidAmt;
    }
    
}