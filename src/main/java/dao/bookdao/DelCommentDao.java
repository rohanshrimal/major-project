/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.bookdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;

/**
 *
 * @author rohan
 */
public class DelCommentDao {
    
    Connection con;
    public boolean  deleteComment(int cid, ServletContext context) 
    {
         boolean flag=false;
        try {
            System.out.println("DELETE COMMENT DAO");
            con=(Connection) context.getAttribute("datacon");
           
            
            String qr="delete from bookcomments where commentid=?";
            PreparedStatement ps;
            ps=con.prepareStatement(qr);
            ps.setInt(1,cid);
            
            ps.executeUpdate();
            
            flag=true;
            return flag;
        } catch (SQLException ex) {
            Logger.getLogger(DelCommentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flag;
        
    }
    
}
