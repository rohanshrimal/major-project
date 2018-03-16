package model.springmodel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.sound.midi.Soundbank;

@Entity
@Table(name="class_subject_faculty")
public class ClassSubjectFaculty {
	
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

  public void setClassid(String classid) {
		this.classid = classid;
	}

	
	@Id
	@Column(name="subcode")
	private String subcode;

	
	
	public String getSubcode() {
		return subcode;
	}

	public void setSubcode(String subcode) {
		this.subcode = subcode;
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
		System.out.println(temp[0]);
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
				+ batch + ", classid=" + classid + ", subcode=" + subcode + "]";
	}

}
