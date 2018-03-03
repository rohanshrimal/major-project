/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author rohan
 */
public class KeyWordModel {
    private int did;
    private String dname,imgpath;
    private ArrayList<Integer> keyId;
    private ArrayList<String> keyName;
    
    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public String getImgpath() {
        return imgpath;
    }

    public void setImgpath(String imgpath) {
        this.imgpath = imgpath;
    }

    public ArrayList<Integer> getKeyId() {
        return keyId;
    }

    public void setKeyId(ArrayList<Integer> keyId) {
        this.keyId = keyId;
    }

    public ArrayList<String> getKeyName() {
        return keyName;
    }

    public void setKeyName(ArrayList<String> keyName) {
        this.keyName = keyName;
    }
    
}
