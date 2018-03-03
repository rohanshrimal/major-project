/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author rohan
 */
public class StudentModel {
    private String name,sid,email,branch,semester,section,password,securityque,securityans,aboutme;

    @Override
    public boolean equals(Object o)
    {
    	StudentModel sm=null;
    	if(o instanceof StudentModel)
    		sm=(StudentModel)o;
    	
    	if(this.getSid().equals(sm.getSid()))
		return true;
    	
    	return false;
    	
    }
    
    public String getAboutme() {
        return aboutme;
    }

    public void setAboutme(String aboutme) {
        this.aboutme = aboutme;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getSection() {
        return section;
    }

    public void setSection(String section) {
        this.section = section;
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
    
}
