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
public class QuestionAnswerModel {
        private ArrayList<QuestionModel> alqm;
        private ArrayList<AnswerModel> alam;

    public ArrayList<QuestionModel> getAlqm() {
        return alqm;
    }

    public void setAlqm(ArrayList<QuestionModel> alqm) {
        this.alqm = alqm;
    }

    public ArrayList<AnswerModel> getAlam() {
        return alam;
    }

    public void setAlam(ArrayList<AnswerModel> alam) {
        this.alam = alam;
    }

    

    
    
}
