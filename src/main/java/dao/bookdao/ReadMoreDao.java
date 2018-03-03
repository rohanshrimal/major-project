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
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import model.FacultyModel;
import model.StudentModel;
import model.bookmodel.BookAdvisoryModel;
import model.bookmodel.BookCommentModel;

/**
 *
 * @author rohan
 */
public class ReadMoreDao {
    
     Connection con;
    public boolean  readdetails(BookAdvisoryModel bm, ServletContext context,HttpSession session) throws SQLException
    {
       con=(Connection) context.getAttribute("datacon");
           boolean flag=false;
       System.out.println("READ MORE DAO");
        
       String utype=(String) session.getAttribute("utype");
            String user = null;
              if(utype.equals("student"))
              { 
                  StudentModel sm;
                  sm=(StudentModel) session.getAttribute("userModel");
                  user=sm.getSid();
              
            
              }else if(utype.equals("faculty"))
              {
                  FacultyModel fm;
                  fm=(FacultyModel) session.getAttribute("userModel");
                  user=fm.getFid();
              }
       
      String qr="Select * from bookdetail where bookid=?";
        PreparedStatement ps;
            ps=con.prepareStatement(qr);
            ps.setInt(1, bm.getBookid());
            ResultSet rs=ps.executeQuery();
           System.out.println(ps);
           
           if(rs.next())
            {
                 
               String ccode=rs.getString(1);
               int bookid=rs.getInt(2);
               int subcode=rs.getInt(3);
               String bookname=rs.getString(4);
               String bookauthor=rs.getString(5);
               int bookprice=rs.getInt(6);
               String bookcover=rs.getString(7);
               float bookrating=rs.getFloat(8);
               String bookdesc=rs.getString(9);
               
                
               
               BookAdvisoryModel bm2=new BookAdvisoryModel();
               bm2.setBookid(bookid);
               bm2.setSubcode(subcode);
               bm2.setBookname(bookname);
               bm2.setBookauthor(bookauthor);
               bm2.setBookprice(bookprice);
               bm2.setBookcover(bookcover);
               bm2.setBookrating(bookrating);
               bm2.setBookdesc(bookdesc);
              session.setAttribute("readmorebook", bm2);
              
              int userrating=0; 
              boolean ratedisable=false;
              String qr1 ="select * from bookratingcount where bookid=? and ccode=?";  
              PreparedStatement ps1;
              ps1=con.prepareStatement(qr1);
              ps1.setInt(1, bookid);
              ps1.setString(2, user);
              ResultSet rs1=ps1.executeQuery();
                System.out.println("RATING QUERY="+ps1);
              if(rs1.next())
              {
                  userrating=rs1.getInt(3);
                  System.out.println("USER RATING="+userrating);
                  ratedisable=true;
                  
                 
              }
              session.setAttribute("userrating", userrating);
                  session.setAttribute("ratedisable", ratedisable);
                  session.setAttribute("commentbookid", bm.getBookid());
                  
                  
                  
              String qr2 ="select ccode, comment,commentid,timestamp from bookcomments where bookid=?";  
              PreparedStatement ps2;
              ps2=con.prepareStatement(qr2);
              ps2.setInt(1,bm.getBookid());
              ResultSet rs2=ps2.executeQuery();
              ArrayList <BookCommentModel> bcmarr= new ArrayList<>();
              while(rs2.next())
              {
                 String commentorid=rs2.getString(1);
                 String commenttext=rs2.getString(2);
                 int commentid=rs2.getInt(3);
                 String timestamp=rs2.getString(4);
                 
                 BookCommentModel bcm= new BookCommentModel();
                 bcm.setComment(commenttext);
                 bcm.setCommentid(commentid);
                 bcm.setTimestamp(timestamp);
                 bcm.setCommentorid(commentorid);
                 
                 
                 
                 
                 String qr3 ="select uname,imgpath from allusers  where uid=?";  
                 PreparedStatement ps3;
                 ps3=con.prepareStatement(qr3);
                 ps3.setString(1,commentorid);
                 ResultSet rs3=ps3.executeQuery();
                if(rs3.next())
                {
                   bcm.setCommentorname(rs3.getString(1));
                   bcm.setCommentorprofileimgpath(rs3.getString(2));
                }
              
                
                bcmarr.add(bcm);
              }
                  session.setAttribute("commentarray",bcmarr);
//                  for(BookCommentModel bookcm:bcmarr)
//                  {
//                      System.out.println(bookcm.getComment());
//                      System.out.println(bookcm.getTimestamp());
//                      System.out.println(bookcm.getCommentorid());
//                      System.out.println(bookcm.getCommentid());
//                  }
//                 
               flag=true;
            }
           
        return flag;
    }
    
}
