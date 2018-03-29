package model.springmodel;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import model.UserModel;

@Entity
@Table(name="answer")
public class Answer implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@ManyToOne
	@JoinColumn(name="qid")
	private Question question;
	
	@Id
	@OneToOne
	@JoinColumn(name="uid")
	private UserModel userModel;
	
	@Column(name="timestamp")
	private String timestamp;
	
	@Column(name="upvotes")
	private int upvotes;
	
	@Column(name="reportabusecount")
	private int reportAbuseCount;
	
	@Column(name="answer")
	private String answer;
	
	@Column(name="text")
	private String text;
	
	@Column(name="downvotes")
	private int downvotes;
	
	@Column(name="views")
	private int views;

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public UserModel getUserModel() {
		return userModel;
	}

	public void setUserModel(UserModel userModel) {
		this.userModel = userModel;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}

	public int getUpvotes() {
		return upvotes;
	}

	public void setUpvotes(int upvotes) {
		this.upvotes = upvotes;
	}

	public int getReportAbuseCount() {
		return reportAbuseCount;
	}

	public void setReportAbuseCount(int reportAbuseCount) {
		this.reportAbuseCount = reportAbuseCount;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getDownvotes() {
		return downvotes;
	}

	public void setDownvotes(int downvotes) {
		this.downvotes = downvotes;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Answer [userModel=" + userModel + ", timestamp=" + timestamp + ", upvotes=" + upvotes
				+ ", reportAbuseCount=" + reportAbuseCount + ", downvotes=" + downvotes + ", views=" + views + "]";
	}
	
	

}
