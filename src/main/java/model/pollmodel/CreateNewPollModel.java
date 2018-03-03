/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.pollmodel;

/**
 *
 * @author rohan
 */
public class CreateNewPollModel {
    
   private String que,pollviewer,branch,sem,sec;
   private String option[],creatorId,creatorName;
   private int pollqueid ,optid,count[], pollviewstatus;
   
   

    public String getCreatorId() {
	return creatorId;
}

public void setCreatorId(String creatorId) {
	this.creatorId = creatorId;
}

public String getCreatorName() {
	return creatorName;
}

public void setCreatorName(String creatorName) {
	this.creatorName = creatorName;
}

	public int getPollviewstatus() {
        return pollviewstatus;
    }

    public void setPollviewstatus(int pollviewstatus) {
        this.pollviewstatus = pollviewstatus;
    }

    public int getOptid() {
        return optid;
    }

    public void setOptid(int optid) {
        this.optid = optid;
    }

    public int[] getCount() {
        return count;
    }

    public void setCount(int[] count) {
        this.count = count;
    }
   
   
    public int getPollqueid() {
        return pollqueid;
    }

    public void setPollqueid(int pollqueid) {
        this.pollqueid = pollqueid;
    }
   
    

   

    public String getPollviewer() {
        return pollviewer;
    }

    public void setPollviewer(String pollviewer) {
        this.pollviewer = pollviewer;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getSem() {
        return sem;
    }

    public void setSem(String sem) {
        this.sem = sem;
    }

    public String getSec() {
        return sec;
    }

    public void setSec(String sec) {
        this.sec = sec;
    }
   
   

    public String getQue() {
        return que;
    }

    public void setQue(String que) {
        this.que = que;
    }

    public String[] getOption() {
        return option;
    }

    public void setOption(String[] option) {
        this.option = option;
    }

    
}
