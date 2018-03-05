package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletContext;

import java.sql.Connection;
import model.AnswerModel;
import model.NotificationModel;
import model.QuestionModel;
import model.pollmodel.CreateNewPollModel;

public class NotificationDao {
	
	Connection con;
    PreparedStatement ps;
    String qr,qr1,qr2;
    ResultSet rs,rs1;
    
	public ArrayList<NotificationModel> notifyWhenAnswered(NotificationModel nm,QuestionModel qm,ServletContext context)
	{
		 con=(Connection)context.getAttribute("datacon");
		 qr="insert into notifications(message,uid,isViewed) values( ? , ? , ? )";
		 qr1="select followerId from questionfollowers where qid=?";
		 qr2="select max(nid) from notifications";
		 
		 ArrayList<NotificationModel> alnm=new ArrayList<>();
		 NotificationModel nm1;
		 int nid=0;
		 try {
			ps=con.prepareStatement(qr2);
			rs=ps.executeQuery();
			if(rs.next())
			{
				nid=rs.getInt(1);
			}
			
			if(!qm.isFollowed())
			{
				ps=con.prepareStatement(qr);
				ps.setString(1,nm.getMessage());
				ps.setString(2,nm.getUid());
				ps.setBoolean(3,false);
				ps.executeUpdate();
				nm.setNid(++nid);
				alnm.add(nm);
			}
			ps=con.prepareStatement(qr1);
			ps.setInt(1,qm.getQid());
			rs=ps.executeQuery();
			
			while(rs.next())
			{
				String followerId=rs.getString(1);
				ps=con.prepareStatement(qr);
				ps.setString(1,nm.getMessage());
				ps.setString(2,followerId);
				ps.setBoolean(3,false);
				ps.executeUpdate();
				
				nm1=new NotificationModel();
				nm1.setMessage(nm.getMessage());
				nm1.setUid(followerId);
				nm1.setNid(++nid);
				alnm.add(nm1);
				
			}
			
			return alnm;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return null;
	}
	
	public void notifyPollsForYou(CreateNewPollModel cnpm,ServletContext context)
	{
		 con=(Connection)context.getAttribute("datacon");
		 qr1="select question from pollquedetails where queid=?";
		 String que="";
		 try {
			ps=con.prepareStatement(qr1);
			ps.setInt(1,cnpm.getPollqueid());
			rs=ps.executeQuery();
			
			if(rs.next())
			{
				que=rs.getString(1);
			}
			
			 qr="insert into notifications(message,uid) values(?,?)";
			 ps=con.prepareStatement(qr);
			 ps.setString(1,cnpm.getCreatorName()+" created Poll :"+que+" for you.");
			 ps.setString(2,cnpm.getBranch().toUpperCase()+"BRANCH_"+cnpm.getPollviewer()+"_"+cnpm.getSem()+"SEM_"+cnpm.getSec()+"SECTION"); 
			 ps.executeUpdate();
			
		 }
				 catch (SQLException e1)
		{
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
			 
			 
		 
	}

}
