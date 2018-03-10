package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.KeyWordDao;
import dao.NotificationDao;
import dao.QuestionDao;
import dao.UserDao;
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

import model.FacultyModel;
import model.NotificationModel;
import model.QuestionModel;
import model.RelatedQuestionModel;
import model.StudentModel;

/**
 * Servlet implementation class MyFeed
 */
public class MyFeed extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyFeed() {
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
          
          HttpSession session=request.getSession();
          ServletContext context=getServletContext();
          
          String utype=(String)session.getAttribute("utype");
          StudentModel sm;
          FacultyModel fm;
          String id="",name;
          
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
          
          RelatedQuestionModel rlqm=new RelatedQuestionModel();
          RelatedQuestionModel rlqm1=new RelatedQuestionModel();
          
          ArrayList<Integer> alqid;
          
          QuestionDao qd=new QuestionDao();
          alqid = qd.getTheFeed(rlqm,id,context);
          qd.questionsForYou(rlqm1,id,alqid,context);
          
          UserDao ud=new UserDao();
          long uvc=ud.getMyUpvotes(id,context);
          KeyWordDao kwd=new KeyWordDao();
          long tc=kwd.getMyTagsCount(id,context);
          
          NotificationDao nd=new NotificationDao();
          ArrayList<NotificationModel> alnm = nd.showAllNotifications(id, context); 
          Gson gsonObj = new Gson();
          String returnJSON=gsonObj.toJson(alnm);
          
          session.setAttribute("relques",rlqm);
          session.setAttribute("relques1",rlqm1);
          session.setAttribute("usernotifications",returnJSON);
          
          response.sendRedirect("Feed_Page.jsp?uvc="+uvc+"&tc="+tc);
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
