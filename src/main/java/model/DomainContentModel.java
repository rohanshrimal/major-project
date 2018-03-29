/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author rohan
 */

@Entity
@Table(name="domain")
public class DomainContentModel {
	
	@Id
	@Column(name="Did")
	private int did;
	
	@Transient
    private int followersCount,tagCount,questionsCount,blogsCount,answersCount;
    
	@Transient
	private ArrayList<String> topUsers;
    
	@Transient
	private ArrayList<String> trendingTags;
    
	@Transient
	private boolean isFollowed;
    
	@Column(name="Dname")
	private String dname;
	
	@Column(name="imgpath")
	private String imagePath;
	
	@Transient
    private ArrayList<QuestionModel> alqm;
    
	@Transient
	private ArrayList<BlogModel> albm;
	
	public boolean isFollowed() {
		return isFollowed;
	}

	public void setFollowed(boolean isFollowed) {
		this.isFollowed = isFollowed;
	}
    
    public int getAnswersCount() {
        return answersCount;
    }

    public void setAnswersCount(int answersCount) {
        this.answersCount = answersCount;
    }
    
    public boolean isIsFollowed() {
        return isFollowed;
    }

    public void setIsFollowed(boolean isFollowed) {
        this.isFollowed = isFollowed;
    }

    public int getQuestionsCount() {
        return questionsCount;
    }

    public void setQuestionsCount(int questionsCount) {
        this.questionsCount = questionsCount;
    }

    public int getBlogsCount() {
        return blogsCount;
    }

    public void setBlogsCount(int blogsCount) {
        this.blogsCount = blogsCount;
    }

    public ArrayList<BlogModel> getAlbm() {
        return albm;
    }

    public void setAlbm(ArrayList<BlogModel> albm) {
        this.albm = albm;
    }

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public int getFollowersCount() {
        return followersCount;
    }

    public void setFollowersCount(int followersCount) {
        this.followersCount = followersCount;
    }

    public int getTagCount() {
        return tagCount;
    }

    public void setTagCount(int tagCount) {
        this.tagCount = tagCount;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public ArrayList<QuestionModel> getAlqm() {
        return alqm;
    }

    public void setAlqm(ArrayList<QuestionModel> alqm) {
        this.alqm = alqm;
    }

    public ArrayList<String> getTopUsers() {
        return topUsers;
    }

    public void setTopUsers(ArrayList<String> topUsers) {
        this.topUsers = topUsers;
    }

    public ArrayList<String> getTrendingTags() {
        return trendingTags;
    }

    public void setTrendingTags(ArrayList<String> trendingTags) {
        this.trendingTags = trendingTags;
    }

	@Override
	public String toString() {
		return "DomainContentModel [did=" + did + ", dname=" + dname + ", imagePath=" + imagePath + "]";
	}
    
    
}
