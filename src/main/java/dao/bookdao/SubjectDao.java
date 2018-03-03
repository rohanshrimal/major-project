/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.bookdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;

/**
 *
 * @author rohan
 */
public class SubjectDao {
    
     ArrayList<String> subjects;
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    String qr;
    
    public ArrayList<String> getSubjects(String branch,String sem,ServletContext context)
    {
        try {
            subjects=new ArrayList<>();
            con=(Connection)context.getAttribute("datacon");
            qr="select subject from bookfilters where branch=? and sem=?";
            ps=con.prepareStatement(qr);
            ps.setString(1,branch);
            ps.setString(2,sem);
            rs=ps.executeQuery();
            
            while(rs.next())
            {
                subjects.add(rs.getString(1));
            }
            
            
            return subjects;
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
