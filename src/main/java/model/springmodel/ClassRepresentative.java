package model.springmodel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="class_representatives")
public class ClassRepresentative {

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

@Column(name="classid")
private String classid;

public String getClassid() {
	return classid;
}

public void setClassid() {
	classid=branch+"-"+sem+"-"+sec+"-"+batch;
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
	return "ClassRepresentative [id=" + id + ", branch=" + branch + ", sem=" + sem + ", sec=" + sec + "]";
}



}
