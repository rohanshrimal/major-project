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
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import model.FacultyModel;
import model.StudentModel;
import model.pollmodel.CreateNewPollModel;

/**
 *
 * @author rohan
 */
public class ViewMyPollDao {
    
     Connection con;
    public boolean fetchpollque(ServletContext context,HttpSession session) throws SQLException
    {
        
        System.out.println("MY POLL VIEW");
         con=(Connection) context.getAttribute("datacon");
         String type=(String) session.getAttribute("utype");
            String creator_id = null;
              if(type.equals("student"))
              { 
                  StudentModel sm;
                  sm=(StudentModel) session.getAttribute("userModel");
                  creator_id=sm.getSid();
                 
            
              }else if(type.equals("faculty"))
              {
                  FacultyModel fm;
                  fm=(FacultyModel) session.getAttribute("userModel");
                  creator_id=fm.getFid();
              }
        
        String qr1="select queid,question,pollviewstatus  from pollquedetails where creator_id=?";
        PreparedStatement ps;
        ps=con.prepareStatement(qr1);
            ps.setString(1, creator_id);
            
            ResultSet rs=ps.executeQuery();
             int i=0;
            String qr2;
            PreparedStatement ps2;
//            ArrayList<PreparedStatement> arrps2=new ArrayList<>();
            
            ArrayList<CreateNewPollModel> cpm=new ArrayList<>();
            while(rs.next())
            {
               int pollqueid=rs.getInt(1);
                String que=rs.getString(2);
                int pollviewstatus=rs.getInt(3);
                CreateNewPollModel cm=new CreateNewPollModel();
                
                System.out.println("Question no:"+pollqueid);
                cm.setPollqueid(pollqueid);
                cm.setQue(que);
                cm.setPollviewstatus(pollviewstatus);
                System.out.println("2nd query:");
                qr2="select options,count  from polloptiondetails NATURAl JOIN pollvoteresult where queid=?";
        
                ps2=con.prepareStatement(qr2);
                ps2.setInt(1, pollqueid);
            
                ResultSet rs2=ps2.executeQuery();
                System.out.println(ps2);
                String option[] = new String[10];
                 int voteresult[]=new int[10];
                int totalvote=0;
                 i=0;
                while(rs2.next())
                {
                   option[i]=rs2.getString(1);
                   voteresult[i]=rs2.getInt(2);
                   totalvote=totalvote+voteresult[i];
                    i++;
                }
               
                 if(totalvote>0)
                {
                while(i>0)
                  {
                    voteresult[i-1]=(voteresult[i-1]*100)/totalvote;
                     i--;
                  }
                }
                cm.setOption(option);
                cm.setCount(voteresult);
                cpm.add(cm);
                
            }
            session.setAttribute("mypolls", cpm);
//            System.out.println("MYYYYYYY  POLLLLLLLLLLLLLLLLLL");
//            for(CreateNewPollModel ab: cpm)
//            {
//                System.out.println(ab.getPollqueid());
//                System.out.println(ab.getQue());
//                for(String bc:ab.getOption())
//                     System.out.println(bc);
//               
//            }
        
        
       return true;
    }
    
}
