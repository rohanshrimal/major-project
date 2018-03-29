package model.springmodel;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import model.UserModel;

@Entity
@Table(name="class_discussion_comment")
public class ClassDiscussionComment {

@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
@Column(name="commentid" ,updatable = false, nullable = false)
private int commentId;

@ManyToOne
@JoinColumn(name="desid")
private ClassDiscussion classDiscussion;

@OneToOne
@JoinColumn(name="commentorid")
private UserModel userModel;

@Column(name="flagcount")
private int flagCount;

@Column(name="likes")
private int likes;

@Column(name="commentText")
private String commentText;

@Column(name="timestamp")
private long timestamp;

@OneToMany(fetch = FetchType.EAGER,mappedBy="comment",cascade=CascadeType.ALL)
private List<ClassDiscussionReply> commentReplyList;


public List<ClassDiscussionReply> getCommentReplyList() {
	return commentReplyList;
}

public void setCommentReplyList(List<ClassDiscussionReply> commentReplyList) {
	this.commentReplyList = commentReplyList;
}

public int getCommentId() {
	return commentId;
}

public void setCommentId(int commentId) {
	this.commentId = commentId;
}


public ClassDiscussion getClassDiscussion() {
	return classDiscussion;
}

public void setClassDiscussion(ClassDiscussion classDiscussion) {
	this.classDiscussion = classDiscussion;
}

public UserModel getUserModel() {
	return userModel;
}

public void setUserModel(UserModel userModel) {
	this.userModel = userModel;
}

public int getFlagCount() {
	return flagCount;
}

public void setFlagCount(int flagCount) {
	this.flagCount = flagCount;
}

public int getLikes() {
	return likes;
}

public void setLikes(int likes) {
	this.likes = likes;
}

public String getCommentText() {
	return commentText;
}

public void setCommentText(String commentText) {
	this.commentText = commentText;
}

public long getTimestamp() {
	return timestamp;
}

public void setTimestamp(long timestamp) {
	this.timestamp = timestamp;
}

@Override
public String toString() {
	return "ClassDiscussionComment [commentId=" + commentId + ", userModel="
			+ userModel + ", flagCount=" + flagCount + ", likes=" + likes + ", commentText=" + commentText
			+ ", timestamp=" + timestamp + ", commentReply="+commentReplyList+"]";
}



}
