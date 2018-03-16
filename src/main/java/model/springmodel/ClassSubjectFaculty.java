package model.springmodel;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.sound.midi.Soundbank;

@Entity
@Table(name="class_subject_faculty")
public class ClassSubjectFaculty implements Serializable
{
	
	@Id
	@Column(name="uid")
	private String id;

	@Transient
	private String branch;

	@Transient
	private int sem;

	@Transient
	private char sec;

	@Transient
	private int batch;

	@Id
	@Column(name="classid")
	private String classid;

	@Id
	@OneToOne
	@JoinColumn(name="subcode")
	private SubjectModel subject;
	
	@Column(name="IsCurrent")
	private boolean isCurrent;

	public boolean isCurrent() {
		return isCurrent;
	}

	public void setCurrent(boolean isCurrent) {
		this.isCurrent = isCurrent;
	}

	public void setClassid(String classid) {
		this.classid = classid;
		setClassAttributes(this.classid);
	}
	
	public SubjectModel getSubject() {
		return subject;
	}

	public void setSubject(SubjectModel subject) {
		this.subject = subject;
	}

	public String getClassid() {
		return classid;
	}

	public void setClassid() {
		classid=branch+"-"+sem+"-"+sec+"-"+batch;
	}

	public void setClassAttributes(String classid)
	{
		this.classid=classid;
		String temp[]=classid.split("-");
		this.branch=temp[0];
		this.sem=Integer.parseInt(temp[1]);
		this.sec=temp[2].charAt(0);
		this.batch=Integer.parseInt(temp[3]);
		
	}

	public int getBatch() {
		return batch;
	}

	public void setBatch(int batch) {
		this.batch = batch;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public char getSec() {
		return sec;
	}

	public void setSec(char sec) {
		this.sec = sec;
	}

	@Override
	public String toString() {
		return "ClassSubjectFaculty [id=" + id + ", branch=" + branch + ", sem=" + sem + ", sec=" + sec + ", batch="
				+ batch + ", classid=" + classid + ", subcode=" + subject.getSubcode() + "]";
	}

}
