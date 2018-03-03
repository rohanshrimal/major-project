package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.AnswerDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import model.AllAnswerModel;
import model.AnswerModel;
import model.FacultyModel;
import model.StudentModel;

/**
 * Servlet implementation class UpDown
 */
public class UpDown extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpDown() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
        	
        	ServletContext context=getServletContext();
            HttpSession session=request.getSession();
            boolean updown=(Boolean)session.getAttribute("updown");
            JsonObject jsObj;
            int up=0,down=0;
            
            AllAnswerModel aam=(AllAnswerModel)session.getAttribute("allAns");
            ArrayList<AnswerModel> alam=aam.getAllans();
            
            
            String uvote=request.getParameter("uvote");
            int qid=Integer.parseInt(request.getParameter("qid"));
            String uid=request.getParameter("uid");
            int index=Integer.parseInt(request.getParameter("index"));
          
            
            if(!updown)
            {
            request.getSession().setAttribute("updown",true);
            AnswerModel am=new AnswerModel();
            am.setQid(qid);
            am.setUid(uid);
            
           String utype=(String)session.getAttribute("utype");
           StudentModel sm;
           FacultyModel fm;
           String id="";
           if(utype.equals("student"))
           { 
               sm=(StudentModel)session.getAttribute("userModel");
               id=sm.getSid();
           }
           
           else if(utype.equals("faculty"))
           { 
               fm=(FacultyModel)session.getAttribute("userModel");
               id=fm.getFid();
           }
           
            
            AnswerDao ad=new AnswerDao();
            AnswerModel votecount=null;
            
            if(uvote.equals("upvote"))
            {
            votecount=ad.incVote(am,context,id);
            }
            else
            {
            votecount=ad.decVote(am,context,id);
            }
            
            
            am=alam.get(index);
            alam.remove(index);
            if(votecount!=null)
            {
            	up=votecount.getUpvotes();
            	down=votecount.getDownvotes();
            	am.setUpvotes(votecount.getUpvotes());
            	am.setDownvotes(votecount.getDownvotes());
            }
            alam.add(index, am);
            aam.setAllans(alam);
            session.setAttribute("allAns", aam);
            
            jsObj =  (JsonObject) new Gson().toJsonTree(votecount);
            jsObj.addProperty("uvotes",up);
            jsObj.addProperty("dvotes",down);
            
            session.setAttribute("updown",false);
            out.println(jsObj);
           }
           else
           {
        	   System.out.println("-------------yououu cannot voooote-----------------");
        	   AnswerModel votecount1=alam.get(index);
        	   jsObj =  (JsonObject) new Gson().toJsonTree(votecount1);
               jsObj.addProperty("uvotes",votecount1.getUpvotes());
               jsObj.addProperty("dvotes",votecount1.getDownvotes());
               
               out.println(jsObj);
           }
        }

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
