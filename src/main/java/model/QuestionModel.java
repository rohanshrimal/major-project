/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


import java.util.ArrayList;

/**
 *
 * @author rohan
 */
public class QuestionModel {
    private int qid,reportAbuseCount,domain;
    private String que,uid,uname,quedate,dName,mostUpvotedAnswer="",topAnswerer,answererName="No one";
    private ArrayList<String> tags;
    private boolean isFollowed;
    
    public String getdName() {
        return dName;
    }

    public String getTopAnswerer() {
        return topAnswerer;
    }

    public void setTopAnswerer(String topAnswerer) {
        this.topAnswerer = topAnswerer;
    }

    public String getAnswererName() {
        return answererName;
    }

    public void setAnswererName(String answererName) {
        this.answererName = answererName;
    }

    public String getMostUpvotedAnswer() {
        return mostUpvotedAnswer;
    }

    public void setMostUpvotedAnswer(String mostUpvotedAnswer) {
        this.mostUpvotedAnswer = mostUpvotedAnswer;
    }

    public void setdName(String dName) {
        this.dName = dName;
    }

    public String getQuedate() {
        return quedate;
    }

    public void setQuedate(String quedate) {
        this.quedate = quedate;
    }

   

    public int getDomain() {
        return domain;
    }

    public void setDomain(int domain) {
        this.domain = domain;
    }
    
    

    public String getUname() {
        
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

   
    public ArrayList<String> getTags() {
        return tags;
    }

    public void setTags(ArrayList<String> tags) {
        this.tags = tags;
    }

    public int getQid() {
        return qid;
    }

    public void setQid(int qid) {
        this.qid = qid;
    }

    public int getReportAbuseCount() {
        return reportAbuseCount;
    }

    public void setReportAbuseCount(int reportAbuseCount) {
        this.reportAbuseCount = reportAbuseCount;
    }

    public String getQue() {
        return que;
    }

    public void setQue(String que) {
        this.que = que;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

	public boolean isFollowed() {
		return isFollowed;
	}

	public void setFollowed(boolean isFollowed) {
		this.isFollowed = isFollowed;
	}

    
}
