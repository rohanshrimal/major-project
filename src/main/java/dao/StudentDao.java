/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import model.StudentModel;

/**
 *
 * @author rohan
 */
public class StudentDao {
   
   Connection con;
   PreparedStatement ps;
   ResultSet rs;
    public boolean insertStudent(StudentModel s,ServletContext context)
    {
        boolean flag=false;
       try {
           con=(Connection) context.getAttribute("datacon");
           String qr0="select * from tempuser where uid=?";
           ps=con.prepareStatement(qr0);
           ps.setString(1,s.getSid());
           rs=ps.executeQuery();
           
           String qr="insert into student values (?,?,?,?,?,?,?,?,?,?)";
           String qr2="insert into allusers values (?,?,?,?)";
           String qr3="delete from tempuser where uid=?";
          if(rs.next())
          {
           ps=con.prepareStatement(qr);
           ps.setString(1,rs.getString(3));
           ps.setString(2,rs.getString(2));
           ps.setString(3,rs.getString(4));
           ps.setString(4,rs.getString(5));
           ps.setString(5,rs.getString(6));
           ps.setString(6,rs.getString(7));
           ps.setString(7,s.getPassword());
           ps.setString(8,rs.getString(8));
           ps.setString(9,rs.getString(9));
           ps.setString(10," ");
           
           if(ps.executeUpdate()>0)
           {
               flag= true;
               ps=con.prepareStatement(qr2);
               ps.setString(1,rs.getString(2));
               ps.setString(2,rs.getString(3));
               ps.setString(3,context.getRealPath("/")+"Images\\UserImg\\student.jpg");
               ps.setString(4,"2");
               ps.executeUpdate();
               
               ps=con.prepareStatement(qr3);
               ps.setString(1,s.getSid());
               ps.executeUpdate();
           }
           else
           flag= false;
       }
       } catch (SQLException ex) {
           Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
       }
   return flag;
    }
    public boolean verifyUser(StudentModel s,ServletContext context,HttpSession session)
    {
        boolean flag=false;
       try {
           con=(Connection) context.getAttribute("datacon");
           String qr="select Name from student where EnrollmentNo=? and Password=?";
           ps=con.prepareStatement(qr);
           ps.setString(1,s.getSid());
          ps.setString(2,s.getPassword());
          rs=ps.executeQuery();
          if(rs.next())
          {
              flag=true;
              s.setName(rs.getString(1));
              session.setAttribute("sm",s);
          }
          
       } catch (SQLException ex) {
           Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
       }
    return flag;
    }
    
   public void getMyDetails(StudentModel sm,ServletContext context)
   {
       try {
           con=(Connection) context.getAttribute("datacon");
           String qr="select name,email,branch,sem,section,aboutme from student where EnrollmentNo=?";
           ps=con.prepareStatement(qr);
           ps.setString(1,sm.getSid());
           rs=ps.executeQuery();
           
           if(rs.next())
           {
               sm.setName(rs.getString(1));
               sm.setEmail(rs.getString(2));
               sm.setBranch(rs.getString(3));
               sm.setSemester(rs.getString(4));
               sm.setSection(rs.getString(5));
               sm.setAboutme(rs.getString(6));
           }
       } catch (SQLException ex) {
           Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
       }
   }
   
   public void updateDetails(StudentModel sm,ServletContext context)
   {
       try {
           con=(Connection)context.getAttribute("datacon");
           String qr="update student set name=?,branch=?,sem=?,section=?,aboutme=? where enrollmentno=?";
           ps=con.prepareStatement(qr);
           ps.setString(1,sm.getName());
           ps.setString(2,sm.getBranch());
           ps.setString(3,sm.getSemester());
           ps.setString(4,sm.getSection());
           ps.setString(5,sm.getAboutme());
           ps.setString(6,sm.getSid());
           ps.executeUpdate();
           
           String qr1="update allusers set uname=? where uid=? ";
           ps=con.prepareStatement(qr1);
           ps.setString(1,sm.getName());
           ps.setString(2,sm.getSid());
           ps.executeUpdate();
           
       } catch (SQLException ex) {
           Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
       }
       
       
   }
   
   
    public String checkMail(String mail,ServletContext context)
    {
        try {
            con=(Connection)context.getAttribute("datacon");
            String qr="select email from student where email=?";
            ps=con.prepareStatement(qr);
            ps.setString(1,mail);
            rs=ps.executeQuery();
            
            if(rs.next())
                return "false";
            else
            {
                String qr1="select uid from tempuser where email=?";
                ps=con.prepareStatement(qr1);
                ps.setString(1,mail);
                rs=ps.executeQuery();
                
                if(rs.next())
                    return "null";
            }
            return "true";
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "true";
    }
    
    public void updatePassword(StudentModel sm,ServletContext context)
    {
       try {
           con=(Connection)context.getAttribute("datacon");
           String qr="update student set password=? where enrollmentno=?";
           ps=con.prepareStatement(qr);
           ps.setString(1,sm.getPassword());
           ps.setString(2,sm.getSid());
           ps.executeUpdate();
       } catch (SQLException ex) {
           Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
       }
        
    }

    public boolean checkVerification(StudentModel sm, ServletContext context) {
       try {
           //To change body of generated methods, choose Tools | Templates.
           con=(Connection)context.getAttribute("datacon");
           String qr="select email,password from student where enrollmentno=? and securityquestion=? and securityanswer=?";
           ps=con.prepareStatement(qr);
           ps.setString(1,sm.getSid());
           ps.setString(2,sm.getSecurityque());
           ps.setString(3,sm.getSecurityans());
           rs=ps.executeQuery();
           if(rs.next())
           {
               sm.setEmail(rs.getString(1));
               sm.setPassword(rs.getString(2));
               return true;
           }
       } catch (SQLException ex) {
           Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
       }
        return false;
    }
    
}
