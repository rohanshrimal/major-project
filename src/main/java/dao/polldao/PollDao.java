/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.polldao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;

/**
 *
 * @author rohan
 */
public class PollDao {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    public long getPollCount(ServletContext context)
    {
        try {
            con=(Connection)context.getAttribute("datacon");
            String qr="select count(queid) from pollquedetails";
            ps=con.prepareStatement(qr);
            rs=ps.executeQuery();
            
            if(rs.next())
            return rs.getLong(1);
        } catch (SQLException ex) {
            Logger.getLogger(PollDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
