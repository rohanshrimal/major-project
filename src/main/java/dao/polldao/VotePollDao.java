/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.polldao;

import dao.FacultyDao;
import dao.StudentDao;
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
public class VotePollDao {
    
    Connection con;
    public boolean fetchvotingpollque(ServletContext context,HttpSession session) throws SQLException
    {
         System.out.println("VOTE FOR POLL");
         con=(Connection) context.getAttribute("datacon");
         String type=(String) session.getAttribute("utype");
            String user_id = null,branch = null,sem = null,sec = null,usertype = null;
              if(type.equals("student"))
              { 
                  StudentModel sm;
                  sm=(StudentModel) session.getAttribute("userModel");
                  user_id=sm.getSid();
                  usertype="student";
                  StudentDao sd=new StudentDao();
                  sd.getMyDetails(sm, context);
                  branch=sm.getBranch();
                  sem=sm.getSemester();
                  sec=sm.getSection();
                  
            
              }else if(type.equals("faculty"))
              {
                  FacultyModel fm;
                  fm=(FacultyModel) session.getAttribute("userModel");
                  user_id=fm.getFid();
                  usertype="faculty";
                  FacultyDao fd=new FacultyDao();
                  fd.getMyDetails(fm, context);
                  branch=fm.getDepartment();
              }
              System.out.println("---------------branch"+branch+"---------sem"+sem+"---------sec"+sec+"---------------");
              
              
              int tempqueid=0;
              CreateNewPollModel currentque=(CreateNewPollModel) session.getAttribute("currentquevoted");
              if(currentque!=null)        
                 tempqueid=currentque.getPollqueid();
              
              
              
               
              
        String qr1=null;
        PreparedStatement ps = null;
        if(type.equals("student"))
        {
            qr1="SELECT queid FROM `pollpriviledges` WHERE (pollviewer='all' OR pollviewer=?) AND (branch='all' OR branch=?  ) AND (sem=0 OR sem=?) AND (sec=0 OR sec=?)";
             ps=con.prepareStatement(qr1);
            ps.setString(1,usertype );
            ps.setString(2, branch);
            ps.setString(3, sem);
            ps.setString(4, sec);
        }
        else if(type.equals("faculty"))
        {
        qr1="SELECT queid FROM `pollpriviledges` WHERE (pollviewer='all' OR pollviewer=?) AND (branch='all' OR branch=?  )";
         ps=con.prepareStatement(qr1);
         ps.setString(1,usertype );
         ps.setString(2, branch);
            //ps.setString(3, sem);
           // ps.setString(4, sec);
        }
        
       
            
            ResultSet rs=ps.executeQuery();
           
            String qr2,qr3;
            PreparedStatement ps2,ps3;
            int i;
            ArrayList<CreateNewPollModel> cm=new ArrayList<>();
            ArrayList<CreateNewPollModel> cm2=new ArrayList<>();
            while(rs.next())
            {
              int pollqueid=rs.getInt(1);
              
              qr2="select question,pollviewstatus from pollquedetails where queid=?";
              ps2=con.prepareStatement(qr2);
              ps2.setInt(1,pollqueid);
              ResultSet rs2=ps2.executeQuery();
              
               while(rs2.next())
               {
                   int pollviewstatus=rs2.getInt(2);
                   String que=rs2.getString(1);
                  qr3="select options,count  from polloptiondetails NATURAl JOIN pollvoteresult where polloptiondetails.queid=? and polloptiondetails.opid=pollvoteresult.opid";
        
                ps3=con.prepareStatement(qr3);
                ps3.setInt(1, pollqueid);
            
                ResultSet rs3=ps3.executeQuery();
                System.out.println(ps3);
                String option[] = new String[10];
                int voteresult[]=new int[10];
                int totalvote=0;
                 i=0;
                while(rs3.next())
                {
                   option[i]=rs3.getString(1);
                   voteresult[i]=rs3.getInt(2);
                   totalvote=totalvote+voteresult[i];
                    i++;
                }
                System.out.println("queid="+pollqueid);
                   System.out.println("totalvote="+totalvote);
                 
                if(totalvote>0)
                {
                    while(i>0)
               {
                   
                   voteresult[i-1]=(voteresult[i-1]*100)/totalvote;
                   i--;
                }
                }
                
                CreateNewPollModel cpm=new CreateNewPollModel();
                cpm.setPollqueid(pollqueid);
                cpm.setQue(que);
                cpm.setOption(option);
                cpm.setCount(voteresult);
                String qr4="select * from pollvotestatus where ccode=? and queid=? and votestatus=1";
                PreparedStatement ps4;
                  ps4 = con.prepareStatement(qr4);
                ps4.setString(1, user_id);
                ps4.setInt(2,pollqueid);
                ResultSet rs4=ps4.executeQuery();
                
                
                int flag=1;
                
                if(rs4.next() || pollviewstatus==0)
                {    
                    if(tempqueid==pollqueid)
                       flag=1;
                     else
                    {
                        flag=0;
                      cm2.add(cpm);
                    }
                }
                   
                
                 if(flag==1)   
               cm.add(cpm);
                
               }
              
            }
            System.out.println("here");
            session.setAttribute("votepollnow", cm);
            session.setAttribute("votedpollresult", cm2);
//            System.out.println("MYYYYYYY  POLLLLLLLLLLLLLLLLLL");
//            for(CreateNewPollModel ab: cm)
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
