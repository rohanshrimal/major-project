/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.polldao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletContext;

/**
 *
 * @author rohan
 */
public class PollSettingDao {
    Connection con;
    public void  changepollstatus(int pollvotestatus,int pollqueid,ServletContext context) throws SQLException
    {
        System.out.println("poll status changed...");
         con=(Connection) context.getAttribute("datacon");
         
         String qr="update pollquedetails set pollviewstatus=? where queid=?";
          PreparedStatement ps;
          ps=con.prepareStatement(qr);
         
          if(pollvotestatus==1)
          ps.setInt(1,0);
          else
          ps.setInt(1, 1);
          
          ps.setInt(2, pollqueid);
          
          ps.executeUpdate();
          
    }
    
    
    
    public void  delpoll(int pollqueid,ServletContext context) throws SQLException
    {
        System.out.println("poll status changed...");
         con=(Connection) context.getAttribute("datacon");
         
         String qr="delete from pollquedetails where queid=?";
          PreparedStatement ps;
          ps=con.prepareStatement(qr);
         
          
          ps.setInt(1, pollqueid);
          
          ps.executeUpdate();
          
    }
    
}
