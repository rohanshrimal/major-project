/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.bookdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import model.FacultyModel;
import model.StudentModel;
import model.bookmodel.BookCommentModel;

/**
 *
 * @author rohan
 */
public class BookCommentDao {
    Connection con;
    public boolean  insertComment(BookCommentModel bcm, ServletContext context,HttpSession session) 
    {
        try {
            System.out.println("ADD NEW BOOK DAO");
            con=(Connection) context.getAttribute("datacon");
            boolean flag=false;
            String type=(String) session.getAttribute("utype");
            String ccode = null;
            if(type.equals("student"))
            {
                StudentModel sm;
                sm=(StudentModel) session.getAttribute("userModel");
                ccode=sm.getSid();
             
                
            }else if(type.equals("faculty"))
            {
                FacultyModel fm;
                fm=(FacultyModel) session.getAttribute("userModel");
                ccode=fm.getFid();
            }
            String date1;
            date1 = (DateFormat.getDateInstance().format(new Date()));
            date1=date1.toString();
            
            
            Date dNow = new Date( );
            SimpleDateFormat ft =
                    new SimpleDateFormat (" 'at' hh:mm a");
           
            
            String date=ft.format(dNow);
            date="on "+date1+date;
            System.out.println("DATE"+dNow);
            String qr="insert into bookcomments values(?,?,?,?,?)";
            PreparedStatement ps;
            ps=con.prepareStatement(qr);
            ps.setString(1,ccode);
            ps.setInt(2, ((Integer) session.getAttribute("commentbookid")).intValue());
            ps.setString(3,bcm.getComment());
            ps.setString(4,null);
            ps.setString(5,date);
            ps.executeUpdate();
            
            flag=true;
            return flag;
        } catch (SQLException ex) {
            Logger.getLogger(BookCommentDao.class.getName()).log(Level.SEVERE, null, ex);
        }   
        return false;
} 
    
}
