package model.springmodel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import model.UserModel;

@Entity
@Table(name="class_discussion_reply")
public class ClassDiscussionReply {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="reply_id")
	private int replyId;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="comment_id")
	private ClassDiscussionComment comment;
	
	@Column(name="reply_text")
	private String replyText;
	
	@Column(name="timestamp")
	private long timestamp;
	
	@OneToOne
	@JoinColumn(name="uid")
	private UserModel userModel;

	public int getReplyId() {
		return replyId;
	}

	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}

	public String getReplyText() {
		return replyText;
	}

	public void setReplyText(String replyText) {
		this.replyText = replyText;
	}

	public long getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
	}

	public UserModel getUserModel() {
		return userModel;
	}
	
	public ClassDiscussionComment getComment() {
		return comment;
	}

	public void setComment(ClassDiscussionComment comment) {
		this.comment = comment;
	}
	
	public void setUserModel(UserModel userModel) {
		this.userModel = userModel;
	}

	@Override
	public String toString() {
		return "ClassDiscussionReply [replyId=" + replyId +", replyText=" + replyText
				+ ", timestamp=" + timestamp + ", userModel=" + userModel + "]";
	}

}
