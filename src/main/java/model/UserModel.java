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
public class UserModel {
    private String uid,uname,utype,email,dept,aboutme,sem;
    private StudentModel sm;
    private FacultyModel fm;
    private boolean isFollowed;
    private int sumOfViews,sumOfUpvotes,totalAnswers;
    
    public String getUserId(Object o)
    {
    	if(o instanceof StudentModel)
    	{
    		sm=(StudentModel)o;
    		return sm.getSid();
    	}
    	else if(o instanceof FacultyModel)
    	{
    		fm=(FacultyModel)o;
    		return fm.getFid();
    	}
    	return null;
    }
    
    public String getUserName(Object o)
    {
    	if(o instanceof StudentModel)
    	{
    		sm=(StudentModel)o;
    		return sm.getName();
    	}
    	else if(o instanceof FacultyModel)
    	{
    		fm=(FacultyModel)o;
    		return fm.getName();
    	}
    	return null;
    }
    
    
    public StudentModel getSm() {
		return sm;
	}

	public void setSm(StudentModel sm) {
		this.sm = sm;
	}

	public FacultyModel getFm() {
		return fm;
	}

	public void setFm(FacultyModel fm) {
		this.fm = fm;
	}

	public int getSumOfViews() {
		return sumOfViews;
	}

	public void setSumOfViews(int sumOfViews) {
		this.sumOfViews = sumOfViews;
	}

	public int getSumOfUpvotes() {
		return sumOfUpvotes;
	}

	public void setSumOfUpvotes(int sumOfUpvotes) {
		this.sumOfUpvotes = sumOfUpvotes;
	}

	public int getTotalAnswers() {
		return totalAnswers;
	}

	public void setTotalAnswers(int totalAnswers) {
		this.totalAnswers = totalAnswers;
	}

	public String getUtype() {
        return utype;
    }

    public String getSem() {
        return sem;
    }

    public void setSem(String sem) {
        this.sem = sem;
    }

    public String getAboutme() {
        return aboutme;
    }

    public void setAboutme(String aboutme) {
        this.aboutme = aboutme;
    }

    public void setUtype(String utype) {
        this.utype = utype;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

	public boolean isFollowed() {
		return isFollowed;
	}

	public void setFollowed(boolean isFollowed) {
		this.isFollowed = isFollowed;
	}
}
