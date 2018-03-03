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
public class SearchBookDao {
    Connection con;
    public boolean  searchbook(BookAdvisoryModel bm, ServletContext context,HttpSession session) throws SQLException
    {
       con=(Connection) context.getAttribute("datacon");
           boolean flag=false;
       System.out.println("SEARCH BOOK DAO");
        System.out.println(bm.getBranch());
        System.out.println(bm.getSubject());
        
       String qr="select * from bookdetail where subcode=(select subcode from bookfilters where branch=? and sem=? and subject=?)";
        PreparedStatement ps;
            ps=con.prepareStatement(qr);
            ps.setString(1, bm.getBranch());
            ps.setInt(2, bm.getSem());
            ps.setString(3, bm.getSubject());
            ResultSet rs=ps.executeQuery();
           System.out.println(ps);
            String subject = bm.getSubject();
            ArrayList<BookAdvisoryModel> bam=new ArrayList<>();
            int subcode = 0;
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
               flag=true;
            }
            session.setAttribute("subjectbook", bam);
            session.setAttribute("subjectsession", subject);
            session.setAttribute("subcodesession", subcode);
            String o="Date";
             session.setAttribute("orderby", o);
             
             
             if(!flag)
             {
                String qr5="select subcode from bookfilters where branch=? and sem=? and subject=?";
                PreparedStatement ps5;
                ps5=con.prepareStatement(qr5);
                ps5.setString(1, bm.getBranch());
                  ps5.setInt(2, bm.getSem());
               ps5.setString(3, bm.getSubject());
                 ResultSet rs5=ps5.executeQuery();
                 
                 if(rs5.next())
                 {
                   session.setAttribute("subcodesession", rs5.getInt(1));
                 }
                 
                 flag=false;
             }
             
        return flag;
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
            Logger.getLogger(SearchBookDao.class.getName()).log(Level.SEVERE, null, ex);
        }
       
           return null;
    }      
}
