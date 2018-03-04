
package listener;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ConnectionHandler implements ServletContextListener {

    Connection con;
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        connection(sce);
        ignoreWordList(sce);
        allDomains(sce);
        }
    public void ignoreWordList(ServletContextEvent sce)
    {
    HashSet<String> il=new HashSet<>();
    String arr[]={  "what",
                    "where",
                    "when",
                    "whom",
                    "who",
                    "whose",
                    "in",
                    "is",
                    "am",
                    "are",
                    "has",
                    "have",
                    "will",
                    "shall",
                    "was",
                    "were",
                    "had",
                    "how",
                    "can",
                    "i",
                    "you",
                    "we",
                    "me"};
    for(String i : arr)
    {
        il.add(i);
    }
    sce.getServletContext().setAttribute("ignorelist",il);
    }
    public void connection(ServletContextEvent sce){
    
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectionHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
	System.out.println("loaded");
        try {
        	 con=DriverManager.getConnection("jdbc:mysql://localhost:3307/minorproject","root","root");
          // con=DriverManager.getConnection("jdbc:mysql://localhost:49267/localdb","root","password");
          // con=DriverManager.getConnection("jdbc:mysql://64.62.211.131:3306/korero_admindb","korero_admin","123456789");
        //rohanazure// con=DriverManager.getConnection("jdbc:mysql://localhost:50493/localdb","root","password");
        	//con=DriverManager.getConnection("jdbc:mysql://localhost:56245/localdb","root","password");
            System.out.println("connected...minorproject");
            
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
	
        sce.getServletContext().setAttribute("datacon",con);
        
       
    }
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        try {
            con.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void allDomains(ServletContextEvent sce)
    {
        try {
            ArrayList<String> dlist=new ArrayList<>();
            PreparedStatement ps;
            String qr="select dname from domain";
            ps=con.prepareStatement(qr);
            ResultSet rs;
            rs=ps.executeQuery();
            while(rs.next())
            {
            dlist.add(rs.getString(1));
            }
            sce.getServletContext().setAttribute("dlist", dlist);
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
