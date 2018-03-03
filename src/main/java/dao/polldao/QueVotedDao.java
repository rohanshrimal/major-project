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
public class QueVotedDao {
    
    Connection con;
    public boolean insertvote(CreateNewPollModel cm,ServletContext context,HttpSession session)
    {
        try {
            System.out.println("question voted...");
            con=(Connection) context.getAttribute("datacon");
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
            int status=1;
            String qr="insert into pollvotestatus values(?,?,?)";
            PreparedStatement ps;
            ps=con.prepareStatement(qr);
            ps.setString(1,ccode );
            ps.setInt(2, cm.getPollqueid());
            ps.setInt(3, status);
            ps.executeUpdate();
            String qr1="update pollvoteresult set count=count+1 where queid=? and opid=?";
            PreparedStatement ps1;
            ps1=con.prepareStatement(qr1);
            ps1.setInt(1, cm.getPollqueid());
            ps1.setInt(2,cm.getOptid() );
            ps1.executeUpdate();
            String qr2="select count,options from polloptiondetails natural join pollvoteresult where polloptiondetails.queid=? and polloptiondetails.opid=pollvoteresult.opid";
            PreparedStatement ps2;
            ps2=con.prepareStatement(qr2);
            ps2.setInt(1,cm.getPollqueid());
            ResultSet rs2=ps2.executeQuery();
            CreateNewPollModel cpm=new CreateNewPollModel();
            String option[]=new String[10];
            int count[]=new int[10];
            int k=0,totalvote=0;
            while(rs2.next())
            {
                
                count[k]=rs2.getInt(1);
//            System.out.println("count["+k+"]="+count[k]);
                totalvote=totalvote+count[k];
                option[k]=rs2.getString(2);
                k++;
                
            }   //        System.out.println(ps2);
//        System.out.println("total vote="+totalvote);
//        System.out.println("count[1]="+count[0]);
//        System.out.println("count[2]="+count[1]);
            while(k>0)
            {
                count[k-1]=(count[k-1]*100)/totalvote;
                k--;
            }
//        System.out.println("total vote="+totalvote);
//        System.out.println("count[1]="+count[0]);
//        System.out.println("count[2]="+count[1]);
            cpm.setPollqueid(cm.getPollqueid());
            cpm.setOption(option);
            cpm.setCount(count);
            session.setAttribute("currentquevoted", cpm);
            System.out.println("VOTE RESULT");
            //     System.out.println(cpm.getPollqueid());
            //                for(String bc:cpm.getOption()  )
//                      System.out.println(bc);
//               
//                for(int xz:cpm.getCount())
//                        System.out.println(xz);
//
            
            System.out.println("QUE VOTED DAO EXIT");
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(QueVotedDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
}
