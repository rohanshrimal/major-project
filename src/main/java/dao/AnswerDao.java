/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.mysql.jdbc.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import model.AllAnswerModel;
import model.AnswerModel;
import model.QuestionAnswerModel;
import model.QuestionModel;

public class AnswerDao {
    Connection con;
    PreparedStatement ps;
    String qr;
    ResultSet rs,rs1;
    public boolean insertAnswer(AnswerModel am,ServletContext context)
    {
        try {
            con=(Connection)context.getAttribute("datacon");
            qr="insert into answer values(?,?,?,?,?,?,?,?,?)";
            ps=con.prepareStatement(qr);
            ps.setInt(1,am.getQid());
            ps.setString(2,am.getUid());
            ps.setString(3,am.getAnsDate());
            ps.setInt(4,am.getUpvotes());
            ps.setInt(5,am.getReportAbuseCount());
            
            ps.setString(6,am.getText());
            ps.setString(7,am.getText());
            ps.setInt(8,am.getDownvotes());
            ps.setInt(9,am.getViews());
            if(ps.executeUpdate()>0)
            {
            	return true;
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(AnswerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean updateAnswer(AnswerModel am,ServletContext context)
    {
        try {
            con=(Connection)context.getAttribute("datacon");
            qr="update answer set text=?,timestamp=?,reportabusecount=0,answer=? where qid=? and uid=? ";
            ps=con.prepareStatement(qr);
            ps.setString(1,am.getText());
            ps.setString(2,am.getAnsDate());
            ps.setString(3,am.getText());
            ps.setInt(4,am.getQid());
            ps.setString(5,am.getUid());
            
            
            return ps.executeUpdate()>0;
            
            
        } catch (SQLException ex) {
            Logger.getLogger(AnswerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean isAnswered(AnswerModel am,ServletContext context)
    {
        con=(Connection)context.getAttribute("datacon");
        qr="select * from answer where qid=? and uid=?";
        try {
            ps=con.prepareStatement(qr);
            ps.setInt(1,am.getQid());
            ps.setString(2,am.getUid());
            rs=ps.executeQuery();
            
            if(rs.next())
            {
                am.setQid(rs.getInt(1));
                am.setUid(rs.getString(2));
                am.setAnsDate(rs.getString(3));
                am.setUpvotes(rs.getInt(4));
                am.setReportAbuseCount(rs.getInt(5));
                am.setText(rs.getString(6));
                am.setAnswer(rs.getString(7));
                am.setDownvotes(rs.getInt(8));
                am.setViews(rs.getInt(9));
                return true;
            }
            else
               return false;
            
        } catch (SQLException ex) {
            Logger.getLogger(AnswerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
    }
    
    public void getAllAnswers(AllAnswerModel aam,int qid,String id,ServletContext context)
    {
        try {
            con=(Connection)context.getAttribute("datacon");
            String qr="select qid,answer.uid,timestamp,upvotes,reportabusecount,text,uname,answer,downvotes,views from answer natural join allusers where qid=? and reportabusecount<5 order by upvotes desc,downvotes";
            String qr1="select qid from answerviewers where qid=? and uid=? and viewerid=?";
            
            ps=con.prepareStatement(qr);
            ps.setInt(1,qid);
            rs=ps.executeQuery();
            
            ArrayList<AnswerModel> alam=new ArrayList<>();
            AnswerModel am;
            while(rs.next())
            {
                am=new AnswerModel();
                am.setQid(rs.getInt(1));
                am.setUid(rs.getString(2));
                am.setAnsDate(rs.getString(3));
                am.setUpvotes(rs.getInt(4));
                am.setReportAbuseCount(rs.getInt(5));
                
                am.setText(rs.getString(6));
                am.setUname(rs.getString(7));
                
                am.setAnswer(rs.getString(8));
                am.setDownvotes(rs.getInt(9));
                am.setViews(rs.getInt(10));
                
                ps=con.prepareStatement(qr1);
                ps.setInt(1,am.getQid());
                ps.setString(2,am.getUid());
                ps.setString(3,id);
                rs1=ps.executeQuery();
                
                if(rs1.next())
                {
                	am.setViewed(true);
                }
                else
                {
                	am.setViewed(false);
                }
                alam.add(am);
            }
            
            aam.setAllans(alam);
        } catch (SQLException ex) {
            Logger.getLogger(AnswerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public AnswerModel incVote(AnswerModel am,ServletContext context,String id)
    {
        try {
            con=(Connection)context.getAttribute("datacon");
            String qr0="select status,voterid from voterdetail where qid=? and uid=? and voterid=?";
            ps=con.prepareStatement(qr0);
            ps.setInt(1,am.getQid());
            ps.setString(2,am.getUid());
            ps.setString(3, id);
            rs=ps.executeQuery();
            boolean flag=rs.next();
            if(!flag) //
            {
            String qr="update answer set upvotes=upvotes+1 where qid=? and uid=?";
            
            ps=con.prepareStatement(qr);
            ps.setInt(1,am.getQid());
            ps.setString(2,am.getUid());
            ps.executeUpdate();
            
            String qr1="insert into voterdetail values(?,?,?,?)";
            ps=con.prepareStatement(qr1);
            
            ps.setString(1,id);
            ps.setString(2,am.getUid());
            ps.setInt(3,am.getQid());
            ps.setString(4,"up");
            ps.executeUpdate();
            }
            
            else 
            {
	            if(rs.getString(1).equals("down"))
	            {
	            String qr3="update answer set upvotes=upvotes+1 where qid=? and uid=?";
	            
	            ps=con.prepareStatement(qr3);
	            ps.setInt(1,am.getQid());
	            ps.setString(2,am.getUid());
	            ps.executeUpdate();
	            
	            String vid=rs.getString(2);
	            String qr4="update voterdetail set status='up' where qid=? and uid=? and voterid=?";
	            ps=con.prepareStatement(qr4);
	            ps.setInt(1,am.getQid());
	            ps.setString(2,am.getUid());
	            ps.setString(3,vid);
	            ps.executeUpdate();
	            
	            String qr7="update answer set downvotes=downvotes-1 where qid=? and uid=?";
	            ps=con.prepareStatement(qr7);
	            ps.setInt(1,am.getQid());
	            ps.setString(2,am.getUid());
	            ps.executeUpdate();
	            }
            
	            else if(rs.getString(1).equals("up"))
	            {
	            String qr5="update answer set upvotes=upvotes-1 where qid=? and uid=?";
	            
	            ps=con.prepareStatement(qr5);
	            ps.setInt(1,am.getQid());
	            ps.setString(2,am.getUid());
	            ps.executeUpdate();
	            
	            String vid=rs.getString(2);
	            String qr6="delete from voterdetail where qid=? and uid=? and voterid=?";
	            ps=con.prepareStatement(qr6);
	            ps.setInt(1,am.getQid());
	            ps.setString(2,am.getUid());
	            ps.setString(3,vid);
	            ps.executeUpdate();
	            }
            }
            
            String qr2="select upvotes,downvotes from answer where qid=? and uid=?";
            ps=con.prepareStatement(qr2);
            ps.setInt(1,am.getQid());
            ps.setString(2,am.getUid());
            rs=ps.executeQuery();
            
            int upvoteCount=0,downvoteCount=0;
            if(rs.next())
            {
                upvoteCount=rs.getInt(1);
                downvoteCount=rs.getInt(2);
            }
            AnswerModel voteCount=new AnswerModel();
            voteCount.setDownvotes(downvoteCount);
            voteCount.setUpvotes(upvoteCount);
            
            return voteCount;
        } catch (SQLException ex) {
            Logger.getLogger(AnswerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    return null;
    }
    
    
    
    
    public AnswerModel decVote(AnswerModel am,ServletContext context,String id)
    {
        try {
            con=(Connection)context.getAttribute("datacon");
            String qr0="select status,voterid from voterdetail where qid=? and uid=? and voterid=?";
            ps=con.prepareStatement(qr0);
            ps.setInt(1,am.getQid());
            ps.setString(2,am.getUid());
            ps.setString(3, id);
            rs=ps.executeQuery();
            boolean flag=rs.next();
            if(!flag) //
            {
            String qr="update answer set downvotes=downvotes+1 where qid=? and uid=?";
            
            ps=con.prepareStatement(qr);
            ps.setInt(1,am.getQid());
            ps.setString(2,am.getUid());
            ps.executeUpdate();
            
            String qr1="insert into voterdetail values(?,?,?,?)";
            ps=con.prepareStatement(qr1);
            
            ps.setString(1,id);
            ps.setString(2,am.getUid());
            ps.setInt(3,am.getQid());
            ps.setString(4,"down");
            ps.executeUpdate();
            }
            else 
            {
            if(rs.getString(1).equals("up"))
            {
            String qr3="update answer set upvotes=upvotes-1 where qid=? and uid=?";
            
            ps=con.prepareStatement(qr3);
            ps.setInt(1,am.getQid());
            ps.setString(2,am.getUid());
            ps.executeUpdate();
            
            String vid=rs.getString(2);
            String qr4="update voterdetail set status='down' where qid=? and uid=? and voterid=?";
            ps=con.prepareStatement(qr4);
            ps.setInt(1,am.getQid());
            ps.setString(2,am.getUid());
            ps.setString(3,vid);
            ps.executeUpdate();
            
            String qr7="update answer set downvotes=downvotes+1 where qid=? and uid=?";
            ps=con.prepareStatement(qr7);
            ps.setInt(1,am.getQid());
            ps.setString(2,am.getUid());
            ps.executeUpdate();
            
            }
            else if(rs.getString(1).equals("down"))
            {
            String qr5="update answer set downvotes=downvotes-1 where qid=? and uid=?";
            
            ps=con.prepareStatement(qr5);
            ps.setInt(1,am.getQid());
            ps.setString(2,am.getUid());
            ps.executeUpdate();
            
            String vid=rs.getString(2);
            String qr6="delete from voterdetail where qid=? and uid=? and voterid=?";
            ps=con.prepareStatement(qr6);
            ps.setInt(1,am.getQid());
            ps.setString(2,am.getUid());
            ps.setString(3,vid);
            ps.executeUpdate();
            }
            }
            
            String qr2="select upvotes,downvotes from answer where qid=? and uid=?";
            ps=con.prepareStatement(qr2);
            ps.setInt(1,am.getQid());
            ps.setString(2,am.getUid());
            rs=ps.executeQuery();
            
            int upvoteCount=0,downvoteCount=0;
            if(rs.next())
            {
                upvoteCount=rs.getInt(1);
                downvoteCount=rs.getInt(2);
            }
            AnswerModel voteCount=new AnswerModel();
            voteCount.setDownvotes(downvoteCount);
            voteCount.setUpvotes(upvoteCount);
            return voteCount;
        } catch (SQLException ex) {
            Logger.getLogger(AnswerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    return null;
    }
    
    public int deleteAnswer(AnswerModel am,ServletContext context)
    {
    con=(Connection)context.getAttribute("datacon");
    String qr="update answer set reportabusecount=5 where qid=? and uid=?";
        try {
            ps=con.prepareStatement(qr);
            ps.setInt(1,am.getQid());
            ps.setString(2,am.getUid());
            return(ps.executeUpdate());
            
        } catch (SQLException ex) {
            Logger.getLogger(AnswerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public int incReportCount(AnswerModel am,ServletContext context,String id)
    {
        try {
            con=(Connection)context.getAttribute("datacon");
            String qr="select reporterid from reportanswer where qid=? and uid=? and reporterid=?";
            ps=con.prepareStatement(qr);
            ps.setInt(1,am.getQid());
            ps.setString(2,am.getUid());
            ps.setString(3,id);
            rs=ps.executeQuery();
            if(!rs.next())
            {
            String qr1="update answer set reportabusecount=reportabusecount+1 where qid=? and uid=?";
            ps=con.prepareStatement(qr1);
            ps.setInt(1,am.getQid());
            ps.setString(2,am.getUid());
            ps.executeUpdate();
            
            String qr2="insert into reportanswer values(?,?,?)";
            ps=con.prepareStatement(qr2);
            ps.setString(1,id);
            ps.setInt(2,am.getQid());
            ps.setString(3,am.getUid());
            ps.executeUpdate();
          
            return 1;
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(AnswerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public void myAnswers(QuestionAnswerModel qam,String id,ServletContext context)
    {
     QuestionModel qm;
     AnswerModel am;
     ResultSet rs1;
     ArrayList<QuestionModel> alqm=new ArrayList<>();
     ArrayList<AnswerModel> alam=new ArrayList<>();
     
     con=(Connection)context.getAttribute("datacon");
     ArrayList<String> dlist=(ArrayList<String>)context.getAttribute("dlist");
     ArrayList<String> tags;
     
     qr="select question.que,question.uid,question.qid,question.timestamp,answer.timestamp,question.did,answer.upvotes,answer.answer,question.reportabusecount,answer.reportabusecount,allusers.uname,answer.downvotes,answer.views from question inner join answer on question.qid=answer.qid inner join allusers on question.uid=allusers.uid where answer.uid=?";
     String qr1="select kname from keyword inner join questionkeyword on keyword.kid=questionkeyword.kid where qid=?";
     
    try {
            ps=con.prepareStatement(qr);
            ps.setString(1,id);
            rs=ps.executeQuery();
            
            while(rs.next())
            {
             qm=new QuestionModel();
             am=new AnswerModel();
             qm.setQue(rs.getString(1)); 
             qm.setUid(rs.getString(2));
             qm.setQid(rs.getInt(3));
             qm.setQuedate(rs.getString(4));
             am.setAnsDate(rs.getString(5));
             qm.setDomain(rs.getInt(6));
             am.setUpvotes(rs.getInt(7));
             am.setAnswer(rs.getString(8));
             qm.setReportAbuseCount(rs.getInt(9));
             am.setReportAbuseCount(rs.getInt(10));
             qm.setUname(rs.getString(11));
             am.setUname("you");
             qm.setdName(dlist.get(qm.getDomain()-1));
             am.setQid(qm.getQid());
             am.setUid(id);
             am.setDownvotes(rs.getInt(12));
             am.setViews(rs.getInt(13));
             
             ps=con.prepareStatement(qr1);
             ps.setInt(1,qm.getQid());
             rs1=ps.executeQuery();
             tags=new ArrayList<>();
             
             while(rs1.next())
             {
                tags.add(rs1.getString(1)); 
             }
             qm.setTags(tags);
             
             alqm.add(qm);
             alam.add(am);
            }
            qam.setAlqm(alqm);
            qam.setAlam(alam);
                    
        } catch (SQLException ex) {
            Logger.getLogger(AnswerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    }
    
    public void deleteMyAnswer(AnswerModel am,ServletContext context)
    {
        try {
            con=(Connection)context.getAttribute("datacon");
            String qr="delete from voterdetail where qid=? and uid=?";
            ps=con.prepareStatement(qr);
            ps.setInt(1,am.getQid());
            ps.setString(2,am.getUid());
            ps.executeUpdate();
            
            String qr1="delete from reportanswer where qid=? and uid=?";
            ps=con.prepareStatement(qr1);
            ps.setInt(1,am.getQid());
            ps.setString(2,am.getUid());
            ps.executeUpdate();
            
            String qr2="delete from answer where qid=? and uid=?";
            ps=con.prepareStatement(qr2);
            ps.setInt(1,am.getQid());
            ps.setString(2,am.getUid());
            ps.executeUpdate();
            
            String qr3="delete from answerviewers where qid=? and uid=?";
            ps=con.prepareStatement(qr3);
            ps.setInt(1,am.getQid());
            ps.setString(2,am.getUid());
            ps.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(AnswerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
     public long getAnsCount(ServletContext context) {
        try {
            long count=0;
            con=(Connection)context.getAttribute("datacon");
            String qr="select count(qid) from answer";
            ps=con.prepareStatement(qr);
            rs=ps.executeQuery();
            
            if(rs.next())
            {
                count=rs.getLong(1);
            }
            
              
            return count;
        } catch (SQLException ex) {
            Logger.getLogger(AnswerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
     
     public boolean countAsView(AnswerModel am,ServletContext context,String id)
     {
    	 con=(Connection)context.getAttribute("datacon");
    	 
    	 try {
    		String qr="insert into answerviewers values(?,?,?)";
			ps=con.prepareStatement(qr);
			ps.setInt(1,am.getQid());
			ps.setString(2,am.getUid());
			ps.setString(3,id);
			ps.executeUpdate();
			
			String qr1="update answer set views=views+1 where qid=? and uid=?";
			ps=con.prepareStatement(qr1);
			ps.setInt(1,am.getQid());
			ps.setString(2,am.getUid());
			ps.executeUpdate();
			return true;
    	 	} 
    	 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	 return false;
    		 
     }
    
}
