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
import javax.persistence.Table;

@Entity
@Table(name="polloptiondetails")
public class PollOptionDetails 
{
	@Id
	@Column(name="opid")
	private int opid;
	
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
	
	public int getOpid() {
		return opid;
	}

	public void setOpid(int opid) {
		this.opid = opid;
	}

	public PollQueDetails getPqd() {
		return pqd;
	}

	public void setPqd(PollQueDetails pqd) {
		this.pqd = pqd;
	}

	@Override
	public String toString() {
		return "PollOptionDetails [ options=" + options + "]";
	}
	
}