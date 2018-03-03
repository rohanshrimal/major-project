package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.AnswerDao;
import dao.QuestionDao;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import model.AllAnswerModel;
import model.AnswerModel;
import model.FacultyModel;
import model.QuestionModel;
import model.RelatedQuestionModel;
import model.StudentModel;


/**
 * Servlet implementation class AllAnswer
 */
public class AllAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllAnswer() {
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
           int indexOfAlqm=Integer.parseInt(request.getParameter("id"));
           String cat=request.getParameter("cat");
           
           RelatedQuestionModel rqm;
           if(cat.equals("cat1"))
           rqm=(RelatedQuestionModel)session.getAttribute("relques");
           
           else if(cat.equals("cat3"))
           rqm=(RelatedQuestionModel)session.getAttribute("RelatedQuestions");
           
           else
           rqm=(RelatedQuestionModel)session.getAttribute("relques1");    
                   
           ArrayList<QuestionModel> alqm=rqm.getRelatedque();
           QuestionModel qm=alqm.get(indexOfAlqm);
           
           AnswerModel am=new AnswerModel();
           am.setQid(qm.getQid());
           
           String utype=(String)session.getAttribute("utype");
           StudentModel sm;
           FacultyModel fm;
           String id="";
        
           if(utype.equals("student"))
           { 
               sm=(StudentModel)session.getAttribute("userModel");
               am.setUid(sm.getSid());
               am.setUname(sm.getName());
               id=sm.getSid();
           }
           
           else if(utype.equals("faculty"))
           { 
               fm=(FacultyModel)session.getAttribute("userModel");
               am.setUid(fm.getFid());
               am.setUname(fm.getName());
               id=fm.getFid();
           }
           
           QuestionDao qd=new QuestionDao();
           qd.isFollowed(qm,id,context);
           
           session.setAttribute("currQues",qm);
           
           AnswerDao ad=new AnswerDao();
           boolean flag=ad.isAnswered(am,context);
           
           AllAnswerModel alm=new AllAnswerModel();
           ad.getAllAnswers(alm,qm.getQid(),id,context);
           
           session.setAttribute("allAns", alm);
           session.setAttribute("currAns", am);
           
           
           RelatedQuestionModel rqm1=new RelatedQuestionModel();
           qd.getQuestionSuggestion(qm, rqm1, context);
           session.setAttribute("RelatedQuestions",rqm1);
           
           response.sendRedirect("Question_Page.jsp?flag="+flag);
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
