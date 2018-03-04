/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author rohan
 */
@Entity
@Table(name="faculty")
public class FacultyModel {
    
	@Column(name="Name")
	private String name;
    
	@Id
	@Column(name="FacultyId")
	private String fid;
    
	@Column(name="Email")
	private String email;
    
	@Column(name="Department")
	private String department;
    
	@Column(name="Password")
	private String password;
    
	@Column(name="SecurityQuestion")
	private String securityque;
    
	@Column(name="SecurityAnswer")
	private String securityans;
    
	@Column(name="aboutme")
	private String aboutme;

    public String getName() {
        return name;
    }

    public String getAboutme() {
        return aboutme;
    }

    public void setAboutme(String aboutme) {
        this.aboutme = aboutme;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFid() {
        return fid;
    }

    public void setFid(String fid) {
        this.fid = fid;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSecurityque() {
        return securityque;
    }

    public void setSecurityque(String securityque) {
        this.securityque = securityque;
    }

    public String getSecurityans() {
        return securityans;
    }

    public void setSecurityans(String securityans) {
        this.securityans = securityans;
    }

	@Override
	public String toString() {
		return "FacultyModel [name=" + name + ", fid=" + fid + ", email=" + email + ", department=" + department
				+ ", password=" + password + ", securityque=" + securityque + ", securityans=" + securityans
				+ ", aboutme=" + aboutme + "]";
	}
    
    
   
}
