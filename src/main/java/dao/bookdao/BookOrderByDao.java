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
import javax.servlet.http.HttpSession;
import model.bookmodel.BookAdvisoryModel;

/**
 *
 * @author rohan
 */
public class BookOrderByDao {
    
     Connection con;
    public boolean  orderby(int subcode,String ordertype,String subject,ServletContext context,HttpSession session) 
    {
       
        
         try {
             con=(Connection) context.getAttribute("datacon");
             String qr,o;
             
             if(ordertype.matches(",,,rating"))
             {
                 qr="select * from bookdetail where subcode=? order by bookrating DESC";
                 o="Rating";
                 session.setAttribute("orderby", o);
             }else if(ordertype.matches(",,,price"))
             {
                 qr="select * from bookdetail where subcode=? order by bookprice";
                 o="Price";
                 session.setAttribute("orderby", o);
             }else
             {
                 qr="select * from bookdetail where subcode=? order by subcode";
                 o="Date";
                 session.setAttribute("orderby", o);
             }
             
             PreparedStatement ps;
             ps=con.prepareStatement(qr);
             ps.setInt(1, subcode);
             ResultSet rs=ps.executeQuery();
             ArrayList<BookAdvisoryModel> bam=new ArrayList<>();
             
             while(rs.next())
             {
                 
                 String ccode=rs.getString(1);
                 int bookid=rs.getInt(2);
                 subcode=rs.getInt(3);
                 String bookname=rs.getString(4);
                 String bookauthor=rs.getString(5);
                 int bookprice=rs.getInt(6);
                 String bookcover=rs.getString(7);
                 float bookrating=rs.getFloat(8);
                 String bookdesc=rs.getString(9);
                 
                 System.out.println("bookname"+bookname);
                 System.out.println("bookprice"+bookprice);
                 
                 BookAdvisoryModel bm2=new BookAdvisoryModel();
                 bm2.setBookid(bookid);
                 bm2.setSubcode(subcode);
                 bm2.setBookname(bookname);
                 bm2.setBookauthor(bookauthor);
                 bm2.setBookprice(bookprice);
                 bm2.setBookcover(bookcover);
                 bm2.setBookrating(bookrating);
                 bm2.setBookdesc(bookdesc);
                 
                 bam.add(bm2);
                 
             }
             session.setAttribute("subjectbook", bam);
             session.setAttribute("subjectsession", subject);
             System.out.println("subject session"+subject);
             session.setAttribute("subcodesession", subcode);
             return true;
         } catch (SQLException ex) {
             Logger.getLogger(BookOrderByDao.class.getName()).log(Level.SEVERE, null, ex);
         }
        return false;
    }
    
     public String  getimagepath(int bid, ServletContext context) 
    {
        PreparedStatement ps ;
       con=(Connection) context.getAttribute("datacon");
        
       String qr="select bookcover from bookdetail where bookid=?";
        try {
            ps= con.prepareStatement(qr);
            ps.setInt(1, bid);
           ResultSet rs= ps.executeQuery();
           if(rs.next())
           {
               String bookpath=rs.getString(1);
               return bookpath;
           }

         } catch (SQLException ex) {
             Logger.getLogger(BookOrderByDao.class.getName()).log(Level.SEVERE, null, ex);
         }
         return null;
    }       
    
}
