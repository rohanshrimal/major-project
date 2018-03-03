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
import javax.servlet.http.HttpSession;
import model.FacultyModel;
import model.StudentModel;
import model.bookmodel.BookAdvisoryModel;

/**
 *
 * @author rohan
 */
public class AddNewBookDao {
    Connection con;
    public boolean  insertbook(BookAdvisoryModel bm, ServletContext context,HttpSession session) 
    {
      
        try {
            con=(Connection) context.getAttribute("datacon");
            boolean flag=false;
            String utype=(String) session.getAttribute("utype");
            String ccode = null;
            
            if(utype.equals("student"))
            {
                StudentModel sm;
                sm=(StudentModel) session.getAttribute("userModel");
                ccode=sm.getSid();
                
                
            }else if(utype.equals("faculty"))
            {
                FacultyModel fm;
                fm=(FacultyModel) session.getAttribute("userModel");
                ccode=fm.getFid();
            }
            
            int subcode=(Integer) session.getAttribute("subcodesession");
            
            System.out.println("subcde=="+subcode);
            float a=(float) 0;
            String qr="insert into bookdetail values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps;
            ps=con.prepareStatement(qr);
            ps.setString(1, ccode);
            ps.setString(2, null);
            ps.setInt(3, subcode);
            ps.setString(4, bm.getBookname());
            ps.setString(5, bm.getBookauthor());
            ps.setInt(6, bm.getBookprice());
            ps.setString(7, bm.getBookcover());
            ps.setFloat(8, a);
            ps.setString(9, bm.getBookdesc());
            
            System.out.println(ps);
            ps.executeUpdate();
            flag =true;
            
            return flag;
        } catch (SQLException ex) {
            Logger.getLogger(AddNewBookDao.class.getName()).log(Level.SEVERE, null, ex);
        }
          return false; 
    }      
    
}
