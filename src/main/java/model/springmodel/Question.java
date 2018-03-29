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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.Where;

import model.DomainContentModel;
import model.UserModel;

@Entity
@Table(name="question")
public class Question {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="qid" ,updatable = false, nullable = false)
	private int qid;

	@Column(name="que")
	private String que;
	
	@OneToOne
	@JoinColumn(name="uid")
	private UserModel userModel;
	
	@Column(name="reportAbuseCount")
	private int reportAbuseCount;
	
	@OneToOne
	@JoinColumn(name="did")
	private DomainContentModel domain;
	
	@Column(name="timestamp")
	private String timestamp;
	
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name="questionkeyword",joinColumns=@JoinColumn(name="qid"),inverseJoinColumns=@JoinColumn(name="kid"))
	private List<Tags> tags;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy="question",cascade=CascadeType.ALL)
	@OrderBy("upvotes DESC")
	private List<Answer> answers;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy="question",cascade=CascadeType.ALL)
	@Where(clause="upvotes = (select max(a.upvotes) from answer a where a.qid = qid)")
	private List<Answer> mostUpvotedAnswer;
	
	
	public List<Answer> getMostUpvotedAnswer() {
		return mostUpvotedAnswer;
	}

	public void setMostUpvotedAnswer(List<Answer> mostUpvotedAnswer) {
		this.mostUpvotedAnswer = mostUpvotedAnswer;
	}

	public int getQid() {
		return qid;
	}

	public void setQid(int qid) {
		this.qid = qid;
	}

	public String getQue() {
		return que;
	}

	public void setQue(String que) {
		this.que = que;
	}

	public UserModel getUserModel() {
		return userModel;
	}

	public void setUserModel(UserModel userModel) {
		this.userModel = userModel;
	}

	public int getReportAbuseCount() {
		return reportAbuseCount;
	}

	public void setReportAbuseCount(int reportAbuseCount) {
		this.reportAbuseCount = reportAbuseCount;
	}

	public DomainContentModel getDomain() {
		return domain;
	}

	public void setDomain(DomainContentModel domain) {
		this.domain = domain;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}

	public List<Tags> getTags() {
		return tags;
	}

	public void setTags(List<Tags> tags) {
		this.tags = tags;
	}

	@Override
	public String toString() {
		return "Question [qid=" + qid + ", que=" + que + ", userModel=" + userModel + ", reportAbuseCount="
				+ reportAbuseCount + ", domain=" + domain + ", timestamp=" + timestamp + ", tags=" + tags + ",answers = "+answers+"]";
	}

	public List<Answer> getAnswers() {
		return answers;
	}

	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}
	
	
	
}
