package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.AnswerDao;
import dao.QuestionDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.FacultyModel;
import model.QuestionAnswerModel;
import model.RelatedQuestionModel;
import model.StudentModel;

/**
 * Servlet implementation class MyAnswers
 */
public class MyAnswers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyAnswers() {
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
           FacultyModel fm;
           StudentModel sm;
           RelatedQuestionModel rqm=new RelatedQuestionModel();
           
           QuestionDao qd=new QuestionDao();
           String id="";
           if(utype.equals("faculty"))
           {
               fm=(FacultyModel)session.getAttribute("userModel");
               id=fm.getFid();
           }
           else if(utype.equals("student"))
           {
               sm=(StudentModel)session.getAttribute("userModel");
               id=sm.getSid();
           }
           QuestionAnswerModel qam=new QuestionAnswerModel();
           
           AnswerDao ad=new AnswerDao();
           ad.myAnswers(qam,id,context);
           session.setAttribute("myanswers",qam);
           response.sendRedirect("MyAnswersPage.jsp");
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
