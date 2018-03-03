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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import model.DomainContentModel;
import model.DomainModel;
import model.QuestionModel;

/**
 *
 * @author rohan
 */
public class DomainDao {
   Connection con;
   PreparedStatement ps;
   ResultSet rs,rs1;
   
   public ArrayList<String> getAllWorkSpaces(String input,ServletContext context)
   {
       try {
           con=(Connection)context.getAttribute("datacon");
           ArrayList<String>dlist=new ArrayList<>();
           dlist.add("");
           
           String qr="select dname from domain where dname like ?";
           ps=con.prepareStatement(qr);
           ps.setString(1,input.substring(1)+"%");
           rs=ps.executeQuery();
           
           while(rs.next())
           {
               dlist.add("#"+rs.getString(1));
           }
           
           return dlist;
       } catch (SQLException ex) {
           Logger.getLogger(DomainDao.class.getName()).log(Level.SEVERE, null, ex);
       }
       return null;
   }
    
   public void getMyWorkSpaces(DomainModel dm,String id,ServletContext context)
    {
       try {
           con=(Connection) context.getAttribute("datacon");
           ArrayList<String> dlist=(ArrayList<String>)context.getAttribute("dlist");
           ArrayList<String> myWorkSpaces=new ArrayList<>();
           ArrayList<Integer>myWorkSpacesId=new ArrayList<>();
           ArrayList<String>myWorkSpacesImg=new ArrayList<>();
           
           String qr="select domain.did,imgpath from userdomain inner join domain on userdomain.did=domain.did where uid=?";
           ps=con.prepareStatement(qr);
           ps.setString(1,id);
           rs=ps.executeQuery();
           
           while(rs.next())
           {
               myWorkSpaces.add(dlist.get(rs.getInt(1)-1));
               myWorkSpacesId.add(rs.getInt(1));
               myWorkSpacesImg.add(rs.getString(2));
           }
           
           dm.setDomainList(myWorkSpaces);
           dm.setDomainIdList(myWorkSpacesId);
           dm.setDomainImg(myWorkSpacesImg);
           
       } catch (SQLException ex) {
           Logger.getLogger(DomainDao.class.getName()).log(Level.SEVERE, null, ex);
       }
        
          
    
    }
    public boolean saveUserDomain(DomainModel dm,String uid,ServletContext context)
    {
       try {
           con=(Connection) context.getAttribute("datacon");
           for(String al:dm.getDomainList())
           {
           String qr="insert into userdomain values(?,?)";
           ps=con.prepareStatement(qr);
           ps.setString(1,uid);
           ps.setString(2, al);
           ps.executeUpdate();
           }
           
            String qr1="update allusers set status='3' where uid=?";
            ps=con.prepareStatement(qr1);
            ps.setString(1,uid);
            ps.executeUpdate();
            
       } catch (SQLException ex) {
           Logger.getLogger(DomainDao.class.getName()).log(Level.SEVERE, null, ex);
       }
       return true;
    }
    
    public void getDomainContent(DomainContentModel dcm,String id,ServletContext context)
    {
       try {
           con=(Connection)context.getAttribute("datacon");
           String qr="select qid,que,question.uid,reportabusecount,did,timestamp,uname from allusers natural join question where did=? and reportabusecount<5 order by qid desc";
           String qr1="select kname from keyword inner join questionkeyword on keyword.kid=questionkeyword.kid where qid=?";
           String qr2="select answer,answer.uid,uname from answer inner join allusers on answer.uid=allusers.uid where qid=? and upvotes in (select max(upvotes) from answer where qid=?) and reportabusecount<5";
           
           ps=con.prepareStatement(qr);
           ps.setInt(1,dcm.getDid());
           rs=ps.executeQuery();
           
           QuestionModel qm;
           ArrayList<QuestionModel> alqm=new ArrayList<>();
           ArrayList<String> tags;
           
           while(rs.next())
           {
               qm=new QuestionModel();
               qm.setQid(rs.getInt(1));
               qm.setQue(rs.getString(2));
               qm.setUid(rs.getString(3));
               qm.setReportAbuseCount(rs.getInt(4));
               qm.setDomain(rs.getInt(5));
               qm.setQuedate(rs.getString(6));
               qm.setUname(rs.getString(7));
               qm.setdName(dcm.getDname());
               
               tags=new ArrayList<>();
               ps=con.prepareStatement(qr1);
               ps.setInt(1,rs.getInt(1));
               rs1=ps.executeQuery();
               
               while(rs1.next())
               {
               tags.add(rs1.getString(1));
               }
               
               qm.setTags(tags);
               
               ps=con.prepareStatement(qr2);
               ps.setInt(1,rs.getInt(1));
               ps.setInt(2,rs.getInt(1));
               rs1=ps.executeQuery();
               
               if(rs1.next())
               {
               qm.setMostUpvotedAnswer(rs1.getString(1));
               qm.setTopAnswerer(rs1.getString(2));
               qm.setAnswererName(rs1.getString(3));
               }
               
               alqm.add(qm);
               
           }
               dcm.setAlqm(alqm);
               dcm.setQuestionsCount(alqm.size());
               
               String qr3="select count(uid) from userdomain where did=?";
               ps=con.prepareStatement(qr3);
               ps.setInt(1,dcm.getDid());
               rs=ps.executeQuery();
               
               if(rs.next())
               {
               dcm.setFollowersCount(rs.getInt(1));
               }
               
               String qr4="select count(kid) from keyword where did=?";
               ps=con.prepareStatement(qr4);
               ps.setInt(1,dcm.getDid());
               rs=ps.executeQuery();
               
               if(rs.next())
               {
               dcm.setTagCount(rs.getInt(1));
               }
               
               String qr5="select kname from question natural join questionkeyword inner join keyword on keyword.kid=questionkeyword.kid where question.did=? group by keyword.kid order by count(keyword.kid) desc limit 7";
               ps=con.prepareStatement(qr5);
               ps.setInt(1,dcm.getDid());
               rs=ps.executeQuery();
               tags=new ArrayList<>();
               
               while(rs.next())
               {
                   tags.add(rs.getString(1));
               }
               
               dcm.setTrendingTags(tags);
               
               String qr6="create view topcontributor as select uid as u,count(uid) as c from question where did=? and reportabusecount<5 group by uid union all select uid as u,count(uid) as c from blogs where did=? group by uid union all select uid as u,count(uid) as c from answer where qid in(select qid from question where did=? and reportabusecount<5) and reportabusecount<5 group by uid order by u desc";
               ps=con.prepareStatement(qr6);
               ps.setInt(1, dcm.getDid());
               ps.setInt(2, dcm.getDid());
               ps.setInt(3, dcm.getDid());
               ps.executeUpdate();
               
               String qr7="select uname from topcontributor inner join allusers on topcontributor.u=allusers.uid group by u order by sum(c) desc limit 3";
               ps=con.prepareStatement(qr7);
               rs=ps.executeQuery();
               
               ArrayList<String> topContributors=new ArrayList<>();
               while(rs.next())
               {
               topContributors.add(rs.getString(1));
               }
               dcm.setTopUsers(topContributors);
           
               String qr8="drop view topcontributor";
               ps=con.prepareStatement(qr8);
               ps.executeUpdate();
               
           String qr9="select uid from userdomain where did=? and uid=?";
           ps=con.prepareStatement(qr9);
           ps.setInt(1,dcm.getDid());
           ps.setString(2,id);
           rs=ps.executeQuery();
           
           if(rs.next())
               dcm.setIsFollowed(true);
           
           String qr10="select count(answer.qid) from answer inner join question on answer.qid=question.qid where did=?";
           ps=con.prepareStatement(qr10);
           ps.setInt(1,dcm.getDid());
           rs=ps.executeQuery();
           
           if(rs.next())
               dcm.setAnswersCount(rs.getInt(1));
           
           String qr11="select imgpath from domain where did=?";
           ps=con.prepareStatement(qr11);
           ps.setInt(1,dcm.getDid());
           rs=ps.executeQuery();
           
           if(rs.next())
               dcm.setImagePath(rs.getString(1));
           
           String qr12="select count(blogid) from blogs where did=?";
           ps=con.prepareStatement(qr12);
           ps.setInt(1,dcm.getDid());
           rs=ps.executeQuery();
           
           if(rs.next())
           {
               dcm.setBlogsCount(rs.getInt(1));
           }
           
       } catch (SQLException ex) {
           Logger.getLogger(DomainDao.class.getName()).log(Level.SEVERE, null, ex);
       }
    }
    
    public void getDomainById(DomainContentModel dcm,String id,ServletContext context)
    {
        ArrayList<String> dlist=(ArrayList<String>) context.getAttribute("dlist");
        int index=dlist.indexOf(dcm.getDname());
        dcm.setDid(index+1);
        getDomainContent(dcm,id,context);
    }
    
    public void followUser(String id,int did,ServletContext context)
    {
        con=(Connection)context.getAttribute("datacon");
        String qr="insert into userdomain values(?,?)";
       try {
           ps=con.prepareStatement(qr);
           ps.setString(1,id);
           ps.setInt(2,did);
           System.out.println(ps.executeUpdate());
           
       } catch (SQLException ex) {
           Logger.getLogger(DomainDao.class.getName()).log(Level.SEVERE, null, ex);
       }
        
        
    }
    
    public void unFollowUser(String id,int did,ServletContext context)
    {
        con=(Connection)context.getAttribute("datacon");
        String qr="delete from userdomain where uid=? and did=?";
        try {
           ps=con.prepareStatement(qr);
           ps.setString(1,id);
           ps.setInt(2,did);
           System.out.println(ps.executeUpdate());
           
       } catch (SQLException ex) {
           Logger.getLogger(DomainDao.class.getName()).log(Level.SEVERE, null, ex);
       }
        
    }
    
    public ArrayList<String> getAllTags(String term,String domain,ServletContext context)
    {
       try {
           ArrayList<String> tags=new ArrayList<>();
           con=(Connection)context.getAttribute("datacon");
           String qr="select kname from keyword where kname like ? and did=?";
           ps=con.prepareStatement(qr);
           ps.setString(1,term+"%");
           ps.setString(2,domain);
           rs=ps.executeQuery();
           while(rs.next())
           {
               tags.add(rs.getString(1));
           }
           
           System.out.println(tags);
           
           return tags;
       } catch (SQLException ex) {
           Logger.getLogger(DomainDao.class.getName()).log(Level.SEVERE, null, ex);
       }
        return null;
    }
    
    
}
