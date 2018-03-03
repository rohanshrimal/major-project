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
public class DomainContentModel {
    private int did,followersCount,tagCount,questionsCount,blogsCount,answersCount;
    private ArrayList<String> topUsers;
    private ArrayList<String> trendingTags;
    private boolean isFollowed;
    private String dname,imagePath;
    private ArrayList<QuestionModel> alqm;
    private ArrayList<BlogModel> albm;
    
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
    
    
}
