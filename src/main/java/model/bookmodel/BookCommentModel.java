/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.bookmodel;

/**
 *
 * @author rohan
 */
public class BookCommentModel {
    
    private String comment,timestamp,commentorid;
    private int commentid;
    private String commentorname,commentorprofileimgpath;

    public String getCommentorname() {
        return commentorname;
    }

    public void setCommentorname(String commentorname) {
        this.commentorname = commentorname;
    }

    public String getCommentorprofileimgpath() {
        return commentorprofileimgpath;
    }

    public void setCommentorprofileimgpath(String commentorprofileimgpath) {
        this.commentorprofileimgpath = commentorprofileimgpath;
    }

    

   
    
    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }

    public String getCommentorid() {
        return commentorid;
    }

    public void setCommentorid(String commentorid) {
        this.commentorid = commentorid;
    }
   

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getCommentid() {
        return commentid;
    }

    public void setCommentid(int commentid) {
        this.commentid = commentid;
    }
    
}
