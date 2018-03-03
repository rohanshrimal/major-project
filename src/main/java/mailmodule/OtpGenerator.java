/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mailmodule;

/**
 *
 * @author rohan
 */
import java.util.Random;


public class OtpGenerator {
   public int generateOtp() {    
     Random rand=new Random();
      int randomNum = rand.nextInt((999999 - 100000) + 1) + 100000;
      System.out.println(randomNum);
      return randomNum;
 }    
}
