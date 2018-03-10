package model.springmodel;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import model.UserModel;

@Entity
@Table(name="class_discussion")
public class ClassDiscussion {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id" ,updatable = false, nullable = false)
	private int id;
	
	@Column(name="isreviewed")
	private boolean isReviewed;
	
	@Column(name="title")
	private String title;
	
	@Column(name="timestamp")
	private long timeStamp;
	
	@Column(name="ispinned")
	private boolean isPinned;
	
	@Column(name="flagcount")
	private int flagCount;
	
	@Column(name="isclosed")
	private boolean isClosed;
	
	@Column(name="content")
	private String content;
	
	@OneToOne
	@JoinColumn(name="creatorid")
	private UserModel userModel;
	
	@OneToMany(fetch = FetchType.EAGER,mappedBy="classDiscussion",cascade=CascadeType.ALL)
	private List<ClassDiscussionComment> classCommentList;
	
	
	
	@Override
	public String toString() {
		return "ClassDiscussion [id=" + id + ", isReviewed=" + isReviewed + ", title=" + title + ", timeStamp="
				+ timeStamp + ", isPinned=" + isPinned + ", flagCount=" + flagCount + ", isClosed=" + isClosed
				+ ", content=" + "i am content"+ ", userModel=" + userModel + ", classCommentList=" + classCommentList + "]";
	}


	public UserModel getUserModel() {
		return userModel;
	}


	public void setUserModel(UserModel userModel) {
		this.userModel = userModel;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public boolean isReviewed() {
		return isReviewed;
	}
	public void setReviewed(boolean isReviewed) {
		this.isReviewed = isReviewed;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public long getTimeStamp() {
		return timeStamp;
	}
	public void setTimeStamp(long timeStamp) {
		this.timeStamp = timeStamp;
	}
	public boolean isPinned() {
		return isPinned;
	}
	public void setPinned(boolean isPinned) {
		this.isPinned = isPinned;
	}
	public int getFlagCount() {
		return flagCount;
	}
	public void setFlagCount(int flagCount) {
		this.flagCount = flagCount;
	}
	public boolean isClosed() {
		return isClosed;
	}
	public void setClosed(boolean isClosed) {
		this.isClosed = isClosed;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public List<ClassDiscussionComment> getClassCommentList() {
		return classCommentList;
	}
	public void setClassCommentList(List<ClassDiscussionComment> classCommentList) {
		this.classCommentList = classCommentList;
	}
	
	public void add(ClassDiscussionComment classComment)
	{
		if(classCommentList==null)
		{
			classCommentList=new ArrayList<>();
		}
		
		classCommentList.add(classComment);
		classComment.setClassDiscussion(this);
	}

}
