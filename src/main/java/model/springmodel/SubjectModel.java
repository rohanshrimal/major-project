package model.springmodel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="bookfilters")
public class SubjectModel {
	
	@Id
	@Column(name="subcode")
	private int subcode;
	
	@Column(name="branch")
	private String branch;
	
	@Column(name="sem")
	private int sem;
	
	@Column(name="subject")
	private String subject;

	public int getSubcode() {
		return subcode;
	}

	public void setSubcode(int subcode) {
		this.subcode = subcode;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public int getSem() {
		return sem;
	}

	public void setSem(int sem) {
		this.sem = sem;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	@Override
	public String toString() {
		return "SubjectModel [subcode=" + subcode + ", branch=" + branch + ", sem=" + sem + ", subject=" + subject
				+ "]";
	}
	
	

}
