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
import java.util.StringTokenizer;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import model.AllKeyWordModel;
import model.KeyWordModel;

/**
 *
 * @author rohan
 */
public class KeyWordDao {
    
    Connection con;
    PreparedStatement ps;
    ResultSet rs,rs1;
    
    
    public void fetchKeyWords(AllKeyWordModel alkwm,ServletContext context)
    {
        try {
            con=(Connection)context.getAttribute("datacon");
            String qr0="select * from domain";
            ps=con.prepareStatement(qr0);
            rs=ps.executeQuery();
            
            KeyWordModel kwm;
            String qr="select keyword.kid,kname from userkeyword inner join keyword on userkeyword.kid=keyword.kid where did=? group by keyword.kid order by count(keyword.kid) desc limit 27";
            ArrayList<KeyWordModel> alkm=new ArrayList<>();
            while(rs.next())
            {
                kwm=new KeyWordModel();
                kwm.setDid(rs.getInt(1));
                kwm.setDname(rs.getString(2));
                kwm.setImgpath(rs.getString(3));
            
                ps=con.prepareStatement(qr);
                ps.setInt(1,kwm.getDid());
                rs1=ps.executeQuery();
                
                ArrayList<Integer> kidlist=new ArrayList<>();
                ArrayList<String> knamelist=new ArrayList<>();
                
                while(rs1.next())
                {
                    kidlist.add(rs1.getInt(1));
                    knamelist.add(rs1.getString(2));
                }
                kwm.setKeyId(kidlist);
                kwm.setKeyName(knamelist);
                
                alkm.add(kwm);
            
            }
            alkwm.setAlkwm(alkm);
        } catch (SQLException ex) {
            Logger.getLogger(KeyWordDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void saveKeywords(String uid,String tags,ServletContext context)
    {
        try {
            con=(Connection)context.getAttribute("datacon");
            String qr="insert into userkeyword values(?,?)";
            
            StringTokenizer st=new StringTokenizer(tags,",");
            
            while(st.hasMoreTokens())
            {
                try {
                    ps=con.prepareStatement(qr);
                    ps.setString(1,st.nextToken());
                    ps.setString(2,uid);
                    ps.executeUpdate();
                } catch (SQLException ex) {
                    Logger.getLogger(KeyWordDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
            String qr1="update allusers set status='4' where uid=?";
            ps=con.prepareStatement(qr1);
            ps.setString(1,uid);
            ps.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(KeyWordDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
     public long getTagsCount(ServletContext context) {
        try {
            long count=0;
            con=(Connection)context.getAttribute("datacon");
            String qr="select count(kid) from keyword";
            ps=con.prepareStatement(qr);
            rs=ps.executeQuery();
            
            if(rs.next())
            {
                count=rs.getLong(1);
            }
            
              
            return count;
        } catch (SQLException ex) {
            Logger.getLogger(KeyWordDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
     
     public long getMyTagsCount(String uid,ServletContext context) {
        try {
            long count=0;
            con=(Connection)context.getAttribute("datacon");
            String qr="select count(kid) from userkeyword where uid=?";
            ps=con.prepareStatement(qr);
            ps.setString(1, uid);
            rs=ps.executeQuery();
            
            if(rs.next())
            {
                count=rs.getLong(1);
            }
            
              
            return count;
        } catch (SQLException ex) {
            Logger.getLogger(KeyWordDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
     
    
}
