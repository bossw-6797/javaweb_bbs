package entity;

import java.util.Date;

public class User {
    private int userId;
    private String userName;
    private String userPass;
    private String gender;
    private String head;
    private Date regTime;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public  String getUserName() {

        return userName;
    }

    public void setUserName(String userName) {

        this.userName = userName;
    }

    public String getUserPass() {

        return userPass;
    }

    public void setUserPass(String userPass) {

        this.userPass = userPass;
    }

    public String getGender() {

        return gender;
    }

    public void setGender(String gender) {

        this.gender = gender;
    }

    public String getHead() {

        return head;
    }

    public void setHead(String head) {

        this.head = head;
    }

    public Date getRegTime() {

        return regTime;
    }

    public void setRegTime(Date regTime) {

        this.regTime = regTime;
    }

    public String toString() {
    	return this.userId + "\t" + this.userName + "\t" +this.userPass + "\t" + this.gender + "\t" + this.head + "\t" +this.regTime;
    }
}
