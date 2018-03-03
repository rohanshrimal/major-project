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
import model.pollmodel.CreateNewPollModel;

/**
 *
 * @author rohan
 */
public class SetPriviledgesDao {
      Connection con;
    public boolean  insertpollpriviledge(CreateNewPollModel c, ServletContext context) throws SQLException
    {
       boolean flag=false;
          
            System.out.println("create dao me aagaya");
            con=(Connection) context.getAttribute("datacon");
            String qr1;
            qr1="insert into pollpriviledges values(?,?,?,?,?)";
            
            PreparedStatement ps;
            ps=con.prepareStatement(qr1);
            ps.setInt(1, c.getPollqueid());
            ps.setString(2, c.getPollviewer());
            ps.setString(3, c.getBranch());
            ps.setString(4, c.getSem());
            ps.setString(5, c.getSec());
            if(ps.executeUpdate()>0) {
              flag=true; 
         } 
            
            
         return flag;
    }
    
}
