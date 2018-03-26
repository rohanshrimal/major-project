package model.springmodel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="pollvoteresult")
public class PollResult {
	
	@Column(name="queid")
	private int queid;
	
	@Id
	@Column(name="opid")
	private int opid;
	
	@Column(name="count")
	private int count;

	public int getQueid() {
		return queid;
	}

	public void setQueid(int queid) {
		this.queid = queid;
	}

	public int getOpid() {
		return opid;
	}

	public void setOpid(int opid) {
		this.opid = opid;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "PollResult [queid=" + queid + ", opid=" + opid + ", count=" + count + "]";
	}
	
}
