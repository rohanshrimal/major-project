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
import model.FacultyModel;

/**
 *
 * @author rohan
 */
public class FacultyDao {
    Connection con;
   PreparedStatement ps;
   ResultSet rs;
    public boolean insertFaculty(FacultyModel f,ServletContext context)
    {
        boolean flag=false;
        try {
            con=(Connection) context.getAttribute("datacon");
            
           String qr0="select * from tempuser where uid=?";
           ps=con.prepareStatement(qr0);
           ps.setString(1,f.getFid());
           rs=ps.executeQuery();
            
            String qr="insert into faculty values (?,?,?,?,?,?,?,?)";
            String qr2="insert into allusers values (?,?,?,?)";
            String qr3="delete from tempuser where uid=?";
           
            if(rs.next())
            {
            ps=con.prepareStatement(qr);
            ps.setString(1,rs.getString(3));
            ps.setString(2,rs.getString(2));
            ps.setString(3,rs.getString(4));
            ps.setString(4,rs.getString(5));
            ps.setString(5,f.getPassword());
            ps.setString(6,rs.getString(8));
            ps.setString(7,rs.getString(9));
            ps.setString(8," ");
            
            if(ps.executeUpdate()>0)
            {
                flag= true;
                ps=con.prepareStatement(qr2);
                ps.setString(1,rs.getString(2));
                ps.setString(2,rs.getString(3));
                ps.setString(3,context.getRealPath("/")+"Images\\UserImg\\teacher.jpg");
                ps.setString(4,"2");
                ps.executeUpdate();
                
               ps=con.prepareStatement(qr3);
               ps.setString(1,f.getFid());
               ps.executeUpdate();
            }
            else
                flag= false;
            
            }
        } catch (SQLException ex) {
            Logger.getLogger(FacultyDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flag;
    }
    public boolean verifyUser(FacultyModel f,ServletContext context,HttpSession session)
    {
        boolean flag=false;
        try {
            
            
            con=(Connection) context.getAttribute("datacon");
            String qr="select Name from faculty where FacultyId=? and Password=?";
            ps=con.prepareStatement(qr);
            ps.setString(1,f.getFid());
            ps.setString(2,f.getPassword());
            rs=ps.executeQuery();
            if(rs.next())
            {
                flag=true;
                f.setName(rs.getString(1));
                session.setAttribute("fm",f);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FacultyDao.class.getName()).log(Level.SEVERE, null, ex);
        }
          
    
    return flag;
    }
    
    public void getMyDetails(FacultyModel fm,ServletContext context)
    {
        try {
            con=(Connection) context.getAttribute("datacon");
            String qr="select name,email,department,aboutme from faculty where facultyid=?";
            ps=con.prepareStatement(qr);
            ps.setString(1,fm.getFid());
            rs=ps.executeQuery();
            
            if(rs.next())
            {
                fm.setName(rs.getString(1));
                fm.setEmail(rs.getString(2));
                fm.setDepartment(rs.getString(3));
                fm.setAboutme(rs.getString(4));
            }
        } catch (SQLException ex) {
            Logger.getLogger(FacultyDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateDetails(FacultyModel fm,ServletContext context)
    {
         try {
           con=(Connection)context.getAttribute("datacon");
           String qr="update faculty set name=?,department=?,aboutme=? where facultyid=?";
           ps=con.prepareStatement(qr);
           ps.setString(1,fm.getName());
           ps.setString(2,fm.getDepartment());
           ps.setString(3,fm.getAboutme());
           ps.setString(4,fm.getFid());
           ps.executeUpdate();
           
           String qr1="update allusers set uname=? where uid=? ";
           ps=con.prepareStatement(qr1);
           ps.setString(1,fm.getName());
           ps.setString(2,fm.getFid());
           ps.executeUpdate();
       } catch (SQLException ex) {
           Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
       }
    }
    
    
    public String checkMail(String mail,ServletContext context)
    {
        try {
            con=(Connection)context.getAttribute("datacon");
            String qr="select email from faculty where email=?";
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
    
    public void updatePassword(FacultyModel fm,ServletContext context)
    {
       try {
           con=(Connection)context.getAttribute("datacon");
           String qr="update faculty set password=? where enrollmentno=?";
           ps=con.prepareStatement(qr);
           ps.setString(1,fm.getPassword());
           ps.setString(2,fm.getFid());
           ps.executeUpdate();
       } catch (SQLException ex) {
           Logger.getLogger(FacultyDao.class.getName()).log(Level.SEVERE, null, ex);
       }
        
    }

    public boolean checkVerification(FacultyModel sm, ServletContext context) {
        try {
            //To change body of generated methods, choose Tools | Templates.
            con=(Connection)context.getAttribute("datacon");
            String qr="select email,password from faculty where facultyid=? and securityquestion=? and securityanswer=?";
            ps=con.prepareStatement(qr);
            ps.setString(1,sm.getFid());
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
            Logger.getLogger(FacultyDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
