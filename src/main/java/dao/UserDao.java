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
import model.TempUserModel;


/**
 *
 * @author rohan
 */
public class UserDao {
    
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    public ArrayList<String> getAllUsers(String input,ServletContext context)
    {
        try {
            ArrayList<String> allUsersList=new ArrayList<>();
            allUsersList.add("");
            con=(Connection)context.getAttribute("datacon");
            
            String qr="select * from allusers where uname like ?";
            ps=con.prepareStatement(qr);
            ps.setString(1,input.substring(1)+"%");
            rs=ps.executeQuery();
            
            String utype;
            while(rs.next())
            {
                utype=rs.getString(1);
                if(utype.startsWith("F") || utype.startsWith("f"))
                allUsersList.add("@Faculty : "+rs.getString(2)+" ("+utype+")");
                
                else if(utype.startsWith("S") || utype.startsWith("s"))
                allUsersList.add("@Student : "+rs.getString(2)+" ("+utype+")");
            }
            
             
            return allUsersList;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public String getImagePath(String uid,ServletContext context)
    {
        try {
            con=(Connection)context.getAttribute("datacon");
            String qr="select imgpath from allusers where uid=?";
            ps=con.prepareStatement(qr);
            ps.setString(1,uid);
            rs=ps.executeQuery();
            if(rs.next())
                return rs.getString(1);
            else return context.getRealPath("/")+"Images\\UserImg\\user.png";
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return context.getRealPath("/")+"Images\\UserImg\\user.png";
    }
    
    public void saveImagePath(String uid,String imgpath,ServletContext context)
    {
        try {
            con=(Connection)context.getAttribute("datacon");
            String qr="update allusers set imgpath=? where uid=?";
            ps=con.prepareStatement(qr);
            ps.setString(1,imgpath);
            ps.setString(2,uid);
            ps.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    public long getUserCount(ServletContext context) {
        try {
            long count=0;
            con=(Connection)context.getAttribute("datacon");
            String qr="select count(uid) from allusers";
            ps=con.prepareStatement(qr);
            rs=ps.executeQuery();
            
            if(rs.next())
            {
                count=rs.getLong(1);
            }
            
              
            return count;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public long getUpvoteCount(ServletContext context)
    {
        try {
            con=(Connection)context.getAttribute("datacon");
            String qr="select sum(upvotes) from answer";
            ps=con.prepareStatement(qr);
            rs=ps.executeQuery();
            long count=0;
            
            if(rs.next())
                count+=rs.getLong(1);
            
            String qr1="select sum(upvote) from blogs";
            ps=con.prepareStatement(qr1);
            rs=ps.executeQuery();
            
            if(rs.next())
                count+=rs.getLong(1);
            
            return count;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public String checkUser(String uid,ServletContext context)
    {
        try {
            con=(Connection)context.getAttribute("datacon");
            String qr="select uid from allusers where uid=?";
            ps=con.prepareStatement(qr);
            ps.setString(1,uid);
            rs=ps.executeQuery();
            
            if(rs.next())
                return "false";
            else
            {
                String qr1="select uid from tempuser where uid=?";
                ps=con.prepareStatement(qr1);
                ps.setString(1,uid);
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
    
    public void saveTempUser(TempUserModel tum,ServletContext context)
    {
        try {
            con=(Connection)context.getAttribute("datacon");
            String qr0="select uid from tempuser where uid=?";
            
            String qr="insert into tempuser values(?,?,?,?,?,?,?,?,?,?)";
            ps=con.prepareStatement(qr);
            ps.setString(1,tum.getUtype());
            ps.setString(2,tum.getUid());
            ps.setString(3,tum.getUname());
            ps.setString(4,tum.getEmail());
            ps.setString(5,tum.getBranch());
            ps.setString(6,tum.getSem());
            ps.setString(7,tum.getSec());
            ps.setString(8,tum.getSque());
            ps.setString(9,tum.getSans());
            ps.setInt(10,tum.getOtp());
            ps.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public boolean checkOtp(TempUserModel tum,ServletContext context)
    {
        try {
            con=(Connection)context.getAttribute("datacon");
            String qr="select uid from tempuser where uid=? and otp=?";
            ps=con.prepareStatement(qr);
            ps.setString(1,tum.getUid());
            ps.setInt(2,tum.getOtp());
            rs=ps.executeQuery();
            
            if(rs.next())
                return true;
            return false;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public String checkUserStatus(String uid,ServletContext context)
    {
        try {
           
            con=(Connection)context.getAttribute("datacon");
            String qr="select status from allusers where uid=?";
            ps=con.prepareStatement(qr);
            ps.setString(1,uid);
            rs=ps.executeQuery();
            
            if(rs.next())
            {
                return rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public boolean checkTempUser(String uid,String pwd,ServletContext context)
    {
        try {
            con=(Connection)context.getAttribute("datacon");
            String qr1="select uid from tempuser where uid=? and otp=?";
            ps=con.prepareStatement(qr1);
            ps.setString(1,uid);
            ps.setString(2,pwd);
            rs=ps.executeQuery();
            
            if(rs.next())
                return true;
            else 
                return false;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public long getMyUpvotes(String uid,ServletContext context)
    {
        try {
            con=(Connection)context.getAttribute("datacon");
            String qr="select sum(upvotes) from answer where uid=?";
            ps=con.prepareStatement(qr);
            ps.setString(1,uid);
            rs=ps.executeQuery();
            long count=0;
            
            if(rs.next())
                count+=rs.getLong(1);
            
            String qr1="select sum(upvote) from blogs where uid=?";
            ps=con.prepareStatement(qr1);
            ps.setString(1,uid);
            rs=ps.executeQuery();
            
            if(rs.next())
                count+=rs.getLong(1);
            
            return count;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public boolean isFollowed(String myUserId, String otherUserId,ServletContext context)
    {
    	try{
    		con=(Connection)context.getAttribute("datacon");
    		String qr="select * from userFollowers where myUserId=? and otherUserId=?";
    		ps=con.prepareStatement(qr);
    		ps.setString(1,myUserId);
    		ps.setString(2,otherUserId);
    		rs=ps.executeQuery();
    		
    		if(rs.next())
    		{
    			return true;
    		}
    		else
    			return false;
    	}
    	catch(SQLException ex){
    		Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
    	}
    	return false;
    }

	public boolean followUser(String myId, String otherUserId, ServletContext context) 
	{
		try{
			con=(Connection)context.getAttribute("datacon");
			String qr="insert into userFollowers values(?,?)";
			ps=con.prepareStatement(qr);
			ps.setString(1,myId);
			ps.setString(2,otherUserId);
			return ps.executeUpdate()>0;
			
			
		}
		catch(SQLException sq)
		{
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, sq);
		}
		return false;
	}

	public boolean unFollowUser(String myId, String otherUserId, ServletContext context) 
	{
		try{
			con=(Connection)context.getAttribute("datacon");
			String qr="delete from userFollowers where myUserId=? and otherUserId=?";
			ps=con.prepareStatement(qr);
			ps.setString(1,myId);
			ps.setString(2,otherUserId);
			return ps.executeUpdate()>0;
			
		}
		catch(SQLException sq)
		{
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, sq);
		}
		return false;
		
	}
    
}
