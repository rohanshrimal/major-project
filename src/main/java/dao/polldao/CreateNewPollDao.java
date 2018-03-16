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
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import model.FacultyModel;
import model.StudentModel;
import model.pollmodel.CreateNewPollModel;

/**
 *
 * @author rohan
 */
public class CreateNewPollDao {
    
    Connection con;
    public boolean  insertpoll(CreateNewPollModel c, ServletContext context,HttpSession session)
    {
        boolean flag =false;
        try {
            con=(Connection) context.getAttribute("datacon");
            String utype=(String) session.getAttribute("utype");
            String creator_id = null;
              if(utype.equals("student"))
              { 
                  StudentModel sm;
                  sm=(StudentModel) session.getAttribute("userModel");
                  creator_id=sm.getSid();
            
            
              }else if(utype.equals("faculty"))
              {
                  FacultyModel fm;
                  fm=(FacultyModel) session.getAttribute("userModel");
                  creator_id=fm.getFid();
              }
              
              System.out.println("Poll dao me aagaya");
            int status=1;
            String qr1;
            qr1="insert into pollquedetails values(?,?,?,?)";
            
            PreparedStatement ps;
            ps=con.prepareStatement(qr1);
            ps.setString(1, null);
            ps.setString(2, c.getQue());
            ps.setString(3,creator_id);
            ps.setInt(4, status);
            ps.executeUpdate();
            
            PreparedStatement ps11;
            String qr33="select queid from pollquedetails where question=?";
            System.out.println("cc"+c.getQue());
            ps11=con.prepareStatement(qr33);
            ps11.setString(1,c.getQue());
            ResultSet rs11 = ps11.executeQuery();
            int pollqueid = 0;
            while(rs11.next())
            pollqueid=rs11.getInt(1);
            
            c.setPollqueid(pollqueid);
            System.out.println("wwwwww="+pollqueid);
            session.setAttribute("pollquei", pollqueid);
            System.out.println(session.getAttribute("pollquei"));
            PreparedStatement ps2;
            String qr2;
            qr2="insert into polloptiondetails(queid,options) values(?,?)";
            String arr[]=c.getOption();
            int i=1;
            boolean flagoption=false;
            int opid = 0;
            for(String ab:arr)
            {
                System.out.println("innnnndaooo options"+ab);
                
                if(ab.length()==0)
                {}
                else
                {
                System.out.println("success"+ab);
                ps2=con.prepareStatement(qr2,Statement.RETURN_GENERATED_KEYS);
                ps2.setInt(1, pollqueid);
                ps2.setString(2, ab);
                //ps2.setInt(3, i);
                i++;
                ps2.executeUpdate();
                ResultSet rsr = ps2.getGeneratedKeys();
                
                
                	if(rsr.next() && flagoption==false)
                	{
                		flagoption=true;
                		opid=rsr.getInt(1);
                	}
    			
                }
            }
            
            
            
            
            
            PreparedStatement ps4;
            String qr4;
            qr4="insert into pollvoteresult values(?,?,?)";
            
            int j=1,count=0;
            for( ;i>1;i--)
            {
               
                ps4=con.prepareStatement(qr4);
                ps4.setInt(1, pollqueid);
                ps4.setInt(2, opid++);
                ps4.setInt(3, count);
                j++;
                ps4.executeUpdate();
                
            }
            
            flag=true;
            return flag;
            
        } catch (SQLException ex) {
            Logger.getLogger(CreateNewPollDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flag;
    }               
    
}
