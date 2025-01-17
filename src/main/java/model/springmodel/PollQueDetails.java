package model.springmodel;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="pollquedetails")
public class PollQueDetails {
	
	@Id
	@Column(name="queid")
	private int queid;
	
	@Column(name="question")
	private String question;
	
	@Column(name="creator_id")
	private	String creatorid;
	
	@Column(name="pollviewstatus")
	private int pollviewstatus;
	
	@OneToMany (fetch = FetchType.EAGER,mappedBy="pqd",cascade=CascadeType.ALL)
	private List<PollOptionDetails> options;

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public int getQueid() {
		return queid;
	}

	public void setQueid(int queid) {
		this.queid = queid;
	}

	public String getCreatorid() {
		return creatorid;
	}

	public void setCreatorid(String creatorid) {
		this.creatorid = creatorid;
	}

	public int getPollviewstatus() {
		return pollviewstatus;
	}

	public void setPollviewstatus(int pollviewstatus) {
		this.pollviewstatus = pollviewstatus;
	}

	public List<PollOptionDetails> getOptions() {
		return options;
	}

	public void setOptions(List<PollOptionDetails> options) {
		this.options = options;
	}

	
	
@Override
	public String toString() {
		return "PollQueDetails [queid=" + queid + ", question=" + question + ", creatorid=" + creatorid
				+ ", pollviewstatus=" + pollviewstatus + ", options=" + options + "]";
	}

public void add(PollOptionDetails option)	
{
	if(options==null)
	{
		options= new ArrayList<>();
	}
	
	options.add(option);
	option.setPqd(this);
}


}