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
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.StringTokenizer;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import model.QuestionModel;
import model.RelatedQuestionModel;
import model.UserModel;

/**
 *
 * @author rohan
 */
public class QuestionDao {
    Connection con;
    PreparedStatement ps,ps1;
    ResultSet rs,rs1;
    ArrayList<String> al=new ArrayList<>();
    ArrayList<QuestionModel> alqm=new ArrayList<>();
    ArrayList<String> dlist;

    public ArrayList<QuestionModel> getAlqm() {
        return alqm;
    }

    public void setAlqm(ArrayList<QuestionModel> alqm) {
        this.alqm = alqm;
    }
    
    
    
    public String getExactQuestion(QuestionModel qm,ServletContext context)
    {
        String input=qm.getQue();
            al.add("");

        try {
            con=(Connection)context.getAttribute("datacon");
            dlist=(ArrayList)context.getAttribute("dlist");
            
            String qr1="select qid,que,uname,question.uid,did,timestamp from allusers natural join question where match(que) against (?) and reportabusecount<5";
            ps1=con.prepareStatement(qr1);
            ps1.setString(1,"'\""+input+"\"'");
            rs1=ps1.executeQuery();
            
            String que="";
            String qid="0";
            QuestionModel quemod;
            
            String qr="select kname from keyword inner join questionkeyword on keyword.kid=questionkeyword.kid where qid=?";
            String qr2="select answer,answer.uid,uname from answer inner join allusers on answer.uid=allusers.uid where qid=? and upvotes in (select max(upvotes) from answer where qid=?) and reportabusecount<5";
            
            if(rs1.next())
            {
            quemod=new QuestionModel();
            quemod.setQid(rs1.getInt(1));
            quemod.setQue(rs1.getString(2));
            quemod.setUname(rs1.getString(3));
            quemod.setUid(rs1.getString(4));
            quemod.setdName(dlist.get(rs1.getInt(5)-1));
            quemod.setQuedate(rs1.getString(6));
            quemod.setDomain(rs1.getInt(5));
            
             ps1=con.prepareStatement(qr);
             ps1.setInt(1,quemod.getQid());
             ResultSet rs2=ps1.executeQuery();
             ArrayList<String> tags=new ArrayList<>();
             while(rs2.next())
             {
               tags.add(rs2.getString(1));  
             }
             quemod.setTags(tags);
             
              ps1=con.prepareStatement(qr2);
              ps1.setInt(1,quemod.getQid());
              ps1.setInt(2,quemod.getQid());
              ResultSet rs3=ps1.executeQuery();
              if(rs3.next())
              {
              quemod.setMostUpvotedAnswer(rs3.getString(1));
              quemod.setTopAnswerer(rs3.getString(2));
              quemod.setAnswererName(rs3.getString(3));
              }
            
            qid = qid +","+quemod.getQid() ;
    
            al.add(quemod.getQue());
               System.out.println("###############"+quemod.getQue()+"##########");
            alqm.add(quemod);
             } 
            
            while(rs1.next())
            {
                quemod=new QuestionModel();
                quemod.setQid(rs1.getInt(1));
                quemod.setQue(rs1.getString(2));
                quemod.setUname(rs1.getString(3));
                quemod.setUid(rs1.getString(4));
                quemod.setdName(dlist.get(rs1.getInt(5)-1));
                quemod.setQuedate(rs1.getString(6));
                quemod.setDomain(rs1.getInt(5));
                
                ps1=con.prepareStatement(qr);
                ps1.setInt(1,quemod.getQid());
                ResultSet rs2=ps1.executeQuery();
                ArrayList<String> tags=new ArrayList<>();
                while(rs2.next())
                {
                tags.add(rs2.getString(1));  
                }
                quemod.setTags(tags);
                
                ps1=con.prepareStatement(qr2);
                ps1.setInt(1,quemod.getQid());
                ps1.setInt(2,quemod.getQid());
                ResultSet rs3=ps1.executeQuery();
                if(rs3.next())
               {
                quemod.setMostUpvotedAnswer(rs3.getString(1));
                quemod.setTopAnswerer(rs3.getString(2));
                quemod.setAnswererName(rs3.getString(3));
               }
                
                qid=qid+","+quemod.getQid();
                al.add(quemod.getQue());
                System.out.println("###############"+quemod.getQue()+"##########");
                alqm.add(quemod);
            }
          
            return qid;
        }catch (SQLException ex) {
            Logger.getLogger(QuestionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public String getExactQuestionIDs(QuestionModel qm,ServletContext context)
    {
        String input=qm.getQue();
        try {
            con=(Connection)context.getAttribute("datacon");
            String qr1="select qid from question where match(que) against (? in boolean mode)";
            ps1=con.prepareStatement(qr1);
            ps1.setString(1,"'\""+input+"\"'");
            rs1=ps1.executeQuery();
            
           
            String qid="0";
        
            if(rs1.next())
            {
            qid = qid +","+rs1.getString(1);
            } 
            
            while(rs1.next())
            {
                qid=qid+","+rs1.getString(1);
            }
            return qid;
        }catch (SQLException ex) {
            Logger.getLogger(QuestionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    
    
    
    public ArrayList<String> getQuestionSuggestion( QuestionModel qm,RelatedQuestionModel rqm,ServletContext context)
    {
        String input=qm.getQue();
        HashSet<String> il=(HashSet<String>)context.getAttribute("ignorelist");
        try {
            con=(Connection)context.getAttribute("datacon");
            String qid=null;
            qid=getExactQuestion(qm,context);
            
            System.out.println("----------------"+qid+"-----------------");
            
            String param=" ";
            String key="+(";
            QuestionModel quemod;
            StringTokenizer st=new StringTokenizer(input," ");
            while(st.hasMoreTokens())
            {
                String token=st.nextToken();
                if(il.contains(token))
                {
                param = param+token+"* ";
                }
                else
                {
                key = key+token+"* ";
                }
                
            }
            param = param + key + ")";
            System.out.print("$$$$$$      "+param);
            String qr="select qid,que,uname,question.uid,did,timestamp from allusers natural join question where match(que) against(? in boolean mode) and qid not in("+qid+") and reportabusecount<5";
            ps=con.prepareStatement(qr);
            ps.setString(1,"'"+param+"'");
            rs=ps.executeQuery();
            
            String qr1="select kname from keyword inner join questionkeyword on keyword.kid=questionkeyword.kid where qid=?";
            String qr2="select answer,answer.uid,uname from answer inner join allusers on answer.uid=allusers.uid where qid=? and upvotes in (select max(upvotes) from answer where qid=? and reportabusecount<5)";
           
            while(rs.next())
            {
             quemod=new QuestionModel();
             quemod.setQid(rs.getInt(1));
             quemod.setQue(rs.getString(2));
             quemod.setUname(rs.getString(3));
             quemod.setUid(rs.getString(4));
             quemod.setdName(dlist.get(rs.getInt(5)-1));
             quemod.setQuedate(rs.getString(6));
             quemod.setDomain(rs.getInt(5));
             
             ps=con.prepareStatement(qr1);
             ps.setInt(1,quemod.getQid());
             ResultSet rs2=ps.executeQuery();
             ArrayList<String> tags=new ArrayList<>();
             while(rs2.next())
             {
               tags.add(rs2.getString(1));  
             }
             quemod.setTags(tags);
             
             ps=con.prepareStatement(qr2);
             ps.setInt(1,quemod.getQid());
             ps.setInt(2,quemod.getQid());
             ResultSet rs3=ps.executeQuery();
             if(rs3.next())
             {
              quemod.setMostUpvotedAnswer(rs3.getString(1));
              quemod.setTopAnswerer(rs3.getString(2));
              quemod.setAnswererName(rs3.getString(3));
             }
             
             al.add(quemod.getQue());
             System.out.println("###############"+quemod.getQue()+"##########");
             alqm.add(quemod);
            }
            System.out.println("---------------------END---------------------------------------");
            rqm.setRelatedque(alqm);
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al;
    }
    
    public boolean insertQuestion(QuestionModel qm,ServletContext context,HttpSession session)
    {
        try {
            con=(Connection) context.getAttribute("datacon");
            String qr="insert into question(que,uid,reportAbuseCount,did,timestamp) values (?,?,?,?,?)";
            ps=con.prepareStatement(qr);
            ps.setString(1, qm.getQue());
            ps.setString(2,qm.getUid());
            ps.setInt(3, qm.getReportAbuseCount());
            ps.setInt(4,qm.getDomain());
            ps.setString(5,DateFormat.getDateInstance().format(new Date()).toString());
            if(ps.executeUpdate()>0)
            {
             String qr2="select max(qid) from question";
             ps=con.prepareStatement(qr2);
             rs=ps.executeQuery();
             rs.next();
             int qid=rs.getInt(1);
             qm.setQid(qid);
             
             ArrayList<String> alltags=qm.getTags();
             ArrayList<String> comtags=new ArrayList<>();
             ArrayList<Integer> alltagid=new ArrayList<>();
             
             String qr3="select kid,kname from keyword where kname in (";
             for(String key : alltags)
             {
             qr3+="'"+key+"',";
             }
             int len=qr3.length()-1;
             qr3=qr3.substring(0, len);
             qr3+=") and did=?";
             System.out.println("--------------------"+qr3+"--------------------------");
             ps=con.prepareStatement(qr3);
             ps.setInt(1,qm.getDomain());
             rs=ps.executeQuery();
             
             String qr4="insert into questionkeyword values(?,?)";
             String qr8="select kid from userkeyword where uid=? and kid in ( 0,";
             int keyid;String keyname;
             while(rs.next())
             {
             keyid=rs.getInt(1);
             keyname=rs.getString(2);
             comtags.add(keyname);
             alltagid.add(keyid);
             qr8+=keyid+",";
             
             ps=con.prepareStatement(qr4);
             ps.setInt(1, qid);
             ps.setInt(2, keyid);
             ps.executeUpdate();
             }
             alltags.removeAll(comtags);
             
             String qr5="select max(kid) from keyword";
             ps=con.prepareStatement(qr5);
             rs=ps.executeQuery();
             rs.next();
             int kno=rs.getInt(1);
             
             String qr6="insert into keyword(kname,did) values(?,?)";
             String qr7="insert into userkeyword values(?,?)";
             
             for(String key:alltags)
             {
             ps=con.prepareStatement(qr6);
             ps.setString(1,key);
             ps.setInt(2,qm.getDomain());
             ps.executeUpdate();
             
             ps=con.prepareStatement(qr4);
             kno++;
             ps.setInt(1, qid);
             ps.setInt(2, kno);
             ps.executeUpdate();
             
             ps=con.prepareStatement(qr7);
             ps.setInt(1,kno);
             ps.setString(2,qm.getUid());
             ps.executeUpdate();
             
             
             /*Date dt = new Date();
      String quedate=DateFormat.getDateInstance().format(new Date()).toString();
      
      
      
          */
             }
             int len8=qr8.length()-1;
             qr8=qr8.substring(0, len8);
             qr8+=" )";
             
                System.out.println("qr8------->"+qr8);
             ps=con.prepareStatement(qr8);
             ps.setString(1,qm.getUid());
             rs=ps.executeQuery();
             
             ArrayList<Integer> comtagid=new ArrayList<>();
             while(rs.next())
             {
             comtagid.add(rs.getInt(1));
             }
             
             alltagid.removeAll(comtagid);
             
             for(int key:alltagid)
             {
             ps=con.prepareStatement(qr7);
             ps.setInt(1, key);
             ps.setString(2, qm.getUid());
             ps.executeUpdate();
             }
             
             return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public void deleteQuestion(QuestionModel qm,ServletContext context)
    {
        try {
            con=(Connection)context.getAttribute("datacon");
            String qr="update question set reportabusecount=5 where qid=?";
            ps=con.prepareStatement(qr);
            ps.setInt(1,qm.getQid());
            ps.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
       
    }
    
    public int incReportAbuseCount(QuestionModel qm,ServletContext context,String id)
    {
        try {
            con=(Connection)context.getAttribute("datacon");
            String qr="select reporterid from reportquestion where reporterid=? and qid=?";
            ps=con.prepareStatement(qr);
            ps.setString(1,id);
            ps.setInt(2,qm.getQid());
            rs=ps.executeQuery();
            
            if(!rs.next())
            {
              String qr1="update question set reportabusecount=reportabusecount+1 where qid=?";
              ps=con.prepareStatement(qr1);
              ps.setInt(1,qm.getQid());
              ps.executeUpdate();
              
              String qr2="insert into reportquestion values(?,?)";
              ps=con.prepareStatement(qr2);
              ps.setString(1,id);
              ps.setInt(2,qm.getQid());
              ps.executeUpdate();
              return 1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public void myQuestions(RelatedQuestionModel rqm,String id,ServletContext context)
    {
        try {
            con=(Connection)context.getAttribute("datacon");
            dlist=(ArrayList)context.getAttribute("dlist");
            
            String qr="select qid,que,did,timestamp,reportabusecount from question where uid=? and reportabusecount<5 order by qid desc";
            ps=con.prepareStatement(qr);
            ps.setString(1,id);
            rs=ps.executeQuery();
            
            QuestionModel qm;
            alqm=new ArrayList<>();
            
            String qr1="select kname from keyword inner join questionkeyword on keyword.kid=questionkeyword.kid where qid=?";
            String qr2="select answer,answer.uid,uname from answer inner join allusers on answer.uid=allusers.uid where qid=? and upvotes in (select max(upvotes) from answer where qid=? and reportabusecount<5)";
            while(rs.next())
            {
                qm=new QuestionModel();
                qm.setUname("You");
                qm.setQid(rs.getInt(1));
                qm.setQue(rs.getString(2));
                qm.setDomain(rs.getInt(3));
                qm.setQuedate(rs.getString(4));
                qm.setReportAbuseCount(rs.getInt(5));
                qm.setdName(dlist.get(rs.getInt(3)-1));
                qm.setUid(id);
                
                ps=con.prepareStatement(qr1);
                ps.setInt(1,qm.getQid());
                rs1=ps.executeQuery();
                ArrayList<String> tags=new ArrayList<>();
                
                while(rs1.next())
                {
                    tags.add(rs1.getString(1));
                }
                qm.setTags(tags);
                
                ps=con.prepareStatement(qr2);
                ps.setInt(1,qm.getQid());
                ps.setInt(2,qm.getQid());
                rs1=ps.executeQuery();
                
                if(rs1.next())
                {
                    qm.setMostUpvotedAnswer(rs1.getString(1));
                    qm.setTopAnswerer(rs1.getString(2));
                    qm.setAnswererName(rs1.getString(3));
                }
                alqm.add(qm);
                
            }
            rqm.setRelatedque(alqm);
            
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    
    public void questionsForYou(RelatedQuestionModel rlqm,String id,ArrayList<Integer> alqid,ServletContext context)
    {
        try {
            con=(Connection)context.getAttribute("datacon");
            ArrayList<String> dlist=(ArrayList<String>)context.getAttribute("dlist");
            
            
            String qr="select qid,que,uid,reportabusecount,did,timestamp,allusers.uname from allusers natural join question where( did in(select question.did from question inner join answer on question.qid=answer.qid where answer.uid=?) or did in(select did from userdomain where uid=?)) and qid not in (select qid from answer where uid=?) and qid not in (select qid from question where uid=?) and reportabusecount<5 order by qid desc";
            ps=con.prepareStatement(qr);
            ps.setString(1,id);
            ps.setString(2,id);
            ps.setString(3,id);
            ps.setString(4,id);
            rs=ps.executeQuery();
            
            String qr1="select kname from keyword inner join questionkeyword on keyword.kid=questionkeyword.kid where qid=?";
            QuestionModel qm;
            ArrayList<String> tags;
            alqm=new ArrayList<>();
            while(rs.next())
            {
            if( !alqid.contains(rs.getInt(1)))
            {
                qm=new QuestionModel();
                qm.setQid(rs.getInt(1));
                qm.setQue(rs.getString(2));
                qm.setUid(rs.getString(3));
                qm.setReportAbuseCount(rs.getInt(4));
                qm.setDomain(rs.getInt(5));
                qm.setQuedate(rs.getString(6));
                qm.setUname(rs.getString(7));
                qm.setdName(dlist.get(qm.getDomain()-1));
                
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
            } 
            }
            rlqm.setRelatedque(alqm);
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public ArrayList<Integer> getTheFeed(RelatedQuestionModel rlqm,String uid,ServletContext context){
    
        con=(Connection)context.getAttribute("datacon");
        ArrayList<String> dlist=(ArrayList)context.getAttribute("dlist");
        ArrayList<QuestionModel> alqm=new ArrayList<>();
        ArrayList<String> tags;
        ArrayList<Integer> alqid=new ArrayList<>();
        
        String theQuery="select question.qid,que,did,question.uid,uname,timestamp,reportabusecount from allusers inner join question on allusers.uid=question.uid inner join questionkeyword on question.qid=questionkeyword.qid where kid in (select keyword.kid from userdomain inner join keyword on keyword.did=userdomain.did where uid=? and keyword.kid in (select kid from userkeyword where uid=?))and reportabusecount<5 group by question.qid order by question.qid desc";
        String qr1="select kname from keyword inner join questionkeyword on keyword.kid=questionkeyword.kid where qid=?";
        String qr2="select answer,answer.uid,uname from answer inner join allusers on answer.uid=allusers.uid where qid=? and upvotes in (select max(upvotes) from answer where qid=? and reportabusecount<5)";
        try {
            ps=con.prepareStatement(theQuery);
            ps.setString(1, uid);
            ps.setString(2, uid);
            rs=ps.executeQuery();
            
            QuestionModel qm;
            
            while(rs.next())
            {
               alqid.add(rs.getInt(1));
                
               qm=new QuestionModel();
               qm.setQid(rs.getInt(1));
               qm.setQue(rs.getString(2));
               qm.setDomain(rs.getInt(3));
               qm.setUid(rs.getString(4));
               qm.setUname(rs.getString(5));
               qm.setQuedate(rs.getString(6));
               qm.setReportAbuseCount(rs.getInt(7));
               qm.setdName(dlist.get(qm.getDomain()-1));
               
               ps=con.prepareStatement(qr1);
               ps.setInt(1,qm.getQid());
               rs1=ps.executeQuery();
               
               tags=new ArrayList<>();
               while(rs1.next())
               {
                   tags.add(rs1.getString(1));
               }
               qm.setTags(tags);
               
               ps=con.prepareStatement(qr2);
               ps.setInt(1,qm.getQid());
               ps.setInt(2,qm.getQid());
               rs1=ps.executeQuery();
               
               if(rs1.next())
               {
                   qm.setMostUpvotedAnswer(rs1.getString(1));
                   qm.setTopAnswerer(rs1.getString(2));
                   qm.setAnswererName(rs1.getString(3));
                   alqm.add(qm);
               }
               //alqm.add(qm);
            }
            
            String theQuery2="select question.qid,que,did,question.uid,uname,timestamp,reportabusecount from allusers inner join question on allusers.uid=question.uid inner join questionkeyword on question.qid=questionkeyword.qid where kid in (select keyword.kid from userkeyword inner join keyword on userkeyword.kid=keyword.kid where uid=? and did not in (select did from userdomain where uid=?))and reportabusecount<5 group by question.qid order by question.qid desc;";
            ps=con.prepareStatement(theQuery2);
            ps.setString(1,uid);
            ps.setString(2,uid);
            rs=ps.executeQuery();
            
             while(rs.next())
            {
               alqid.add(rs.getInt(1));
                
               qm=new QuestionModel();
               qm.setQid(rs.getInt(1));
               qm.setQue(rs.getString(2));
               qm.setDomain(rs.getInt(3));
               qm.setUid(rs.getString(4));
               qm.setUname(rs.getString(5));
               qm.setQuedate(rs.getString(6));
               qm.setReportAbuseCount(rs.getInt(7));
               qm.setdName(dlist.get(qm.getDomain()-1));
               
               ps=con.prepareStatement(qr1);
               ps.setInt(1,qm.getQid());
               rs1=ps.executeQuery();
               
               tags=new ArrayList<>();
               while(rs1.next())
               {
                   tags.add(rs1.getString(1));
               }
               qm.setTags(tags);
               
               ps=con.prepareStatement(qr2);
               ps.setInt(1,qm.getQid());
               ps.setInt(2,qm.getQid());
               rs1=ps.executeQuery();
               
               if(rs1.next())
               {
                   qm.setMostUpvotedAnswer(rs1.getString(1));
                   qm.setTopAnswerer(rs1.getString(2));
                   qm.setAnswererName(rs1.getString(3));
                   alqm.add(qm);
               }
              // alqm.add(qm);
            }
             
            rlqm.setRelatedque(alqm);
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return alqid;
    }
    
    public void deleteMyQuestion(QuestionModel qm,ServletContext context)
    {
        try {
            con=(Connection)context.getAttribute("datacon");
            String qr="delete from reportquestion where qid=?";
            ps=con.prepareStatement(qr);
            ps.setInt(1,qm.getQid());
            ps.executeUpdate();
            
            String qr1="delete from question where qid=?";
            ps=con.prepareStatement(qr1);
            ps.setInt(1,qm.getQid());
            ps.executeUpdate();
            
            String qr2="delete from questionkeyword where qid=?";
            ps=con.prepareStatement(qr2);
            ps.setInt(1,qm.getQid());
            ps.executeUpdate();
            
            String qr3="delete from answer where qid=?";
            ps=con.prepareStatement(qr3);
            ps.setInt(1,qm.getQid());
            ps.executeUpdate();
            
            String qr4="delete from voterdetail where qid=?";
            ps=con.prepareStatement(qr4);
            ps.setInt(1,qm.getQid());
            ps.executeUpdate();
            
            String qr5="delete from reportanswer where qid=?";
            ps=con.prepareStatement(qr5);
            ps.setInt(1,qm.getQid());
            ps.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public long getQuestionCount(ServletContext context) {
         try {
            long count=0;
            con=(Connection)context.getAttribute("datacon");
            String qr="select count(qid) from question";
            ps=con.prepareStatement(qr);
            rs=ps.executeQuery();
            
            if(rs.next())
            {
                count=rs.getLong(1);
            }
            
              
            return count;
        } catch (SQLException ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
}

	public boolean followQuestion(String qid, String userId, ServletContext context)
	{
		con=(Connection)context.getAttribute("datacon");
		String qr="insert into questionfollowers values(?,?)";
		
		try {
			ps=con.prepareStatement(qr);
			ps.setString(1,qid);
			ps.setString(2,userId);
			return ps.executeUpdate()>0;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
		
	}

	public void isFollowed(QuestionModel qm,String id,ServletContext context) 
	{
		con=(Connection)context.getAttribute("datacon");
		String qr="select * from questionfollowers where qid=? and followerId=?";
		
		try {
			ps=con.prepareStatement(qr);
			ps.setInt(1,qm.getQid());
			ps.setString(2,id);
			rs=ps.executeQuery();
			
			if(rs.next())
			{
				qm.setFollowed(true);
			}
			else
			{
				qm.setFollowed(false);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public boolean unfollowQuestion(String qid, String userId, ServletContext context) {
		
		con=(Connection)context.getAttribute("datacon");
		String qr="delete from questionfollowers where qid=? and followerId=?";
		try {
			ps=con.prepareStatement(qr);
			ps.setString(1,qid);
			ps.setString(2,userId);
			return ps.executeUpdate()>0;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public ArrayList<UserModel> askToAnswer(QuestionModel qm, ServletContext context) 
	{	
		con=(Connection)context.getAttribute("datacon");
		String qr=" select count(qid),answer.uid,uname,sum(views),sum(upvotes) from answer natural join allusers where qid in (select qid from questionkeyword where kid in (select kid from questionkeyword where qid=?))group by uid order by sum(views)+sum(upvotes)-sum(downvotes) desc";
		
		try {
			ps=con.prepareStatement(qr);
			ps.setInt(1,qm.getQid());
			rs=ps.executeQuery();
			
			ArrayList<UserModel> alum=new ArrayList<>();
			UserModel um=null;
			while(rs.next())
			{
				um=new UserModel();
				um.setTotalAnswers(rs.getInt(1));
				um.setUid(rs.getString(2));
				um.setUname(rs.getString(3));
				um.setSumOfViews(rs.getInt(4));
				um.setSumOfUpvotes(rs.getInt(5));
				
				alum.add(um);
				
			}
			
			
			if(alum.size()==0)
			{
				String qr1=" select count(qid),answer.uid,uname,sum(views),sum(upvotes) from answer natural join allusers where qid in (select qid from question where did in (select did from question where qid=?))and uid not in (select uid from answer where qid in (select qid from questionkeyword where kid in (select kid from questionkeyword where qid=?))group by uid order by sum(views)+sum(upvotes)-sum(downvotes) desc) group by uid order by sum(views)+sum(upvotes)-sum(downvotes) desc";
				ps=con.prepareStatement(qr1);
				ps.setInt(1,qm.getQid());
				ps.setInt(2,qm.getQid());
				rs=ps.executeQuery();
					
				while(rs.next())
				{
					um=new UserModel();
					um.setTotalAnswers(rs.getInt(1));
					um.setUid(rs.getString(2));
					um.setUname(rs.getString(3));
					um.setSumOfViews(rs.getInt(4));
					um.setSumOfUpvotes(rs.getInt(5));
						
					alum.add(um);
						
				}
			}
			
			return alum;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
}
}