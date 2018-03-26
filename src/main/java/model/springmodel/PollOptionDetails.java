package model.springmodel;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="polloptiondetails")
public class PollOptionDetails implements Serializable 
{
	@Id
	@OneToOne
	@JoinColumn(name="opid")
	private PollResult pollResult;
	
	@ManyToOne 
	@JoinColumn(name="queid")
	private PollQueDetails pqd;

	@Column(name="options")
	private String options;

	public String getOptions() {
		return options;
	}

	public void setOptions(String options) {
		this.options = options;
	}

	public PollResult getPollResult() {
		return pollResult;
	}

	public void setPollResult(PollResult pollResult) {
		this.pollResult = pollResult;
	}

	public PollQueDetails getPqd() {
		return pqd;
	}

	public void setPqd(PollQueDetails pqd) {
		this.pqd = pqd;
	}

	@Override
	public String toString() {
		return "PollOptionDetails [ options=" + options +", result="+pollResult+ "]";
	}
	
}