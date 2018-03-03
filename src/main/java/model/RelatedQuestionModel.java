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
public class RelatedQuestionModel {
    private ArrayList<QuestionModel> relatedque;

    public ArrayList<QuestionModel> getRelatedque() {
        return relatedque;
    }

    public void setRelatedque(ArrayList<QuestionModel> relatedque) {
        this.relatedque = relatedque;
    }
    
}
