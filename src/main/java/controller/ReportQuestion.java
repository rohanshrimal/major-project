package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.QuestionDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.QuestionModel;
import model.RelatedQuestionModel;
import model.StudentModel;

/**
 * Servlet implementation class ReportQuestion
 */
public class ReportQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportQuestion() {
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
           
          int qid=Integer.parseInt(request.getParameter("qid"));
          String type=request.getParameter("type");
          int index=Integer.parseInt(request.getParameter("index"));
          
          QuestionModel qm=new QuestionModel();
          qm.setQid(qid);
          
          QuestionDao qd=new QuestionDao();
            
          
          if(type.equals("faculty"))
          {
            qd.deleteQuestion(qm,context); 
            RelatedQuestionModel rqm=(RelatedQuestionModel)session.getAttribute("relques");
            ArrayList<QuestionModel> alqm=rqm.getRelatedque();
            alqm.remove(index);
            rqm.setRelatedque(alqm);
            session.setAttribute("relques",rqm);
            out.println("DELETED...");
          }
          else if(type.equals("student"))
          {
            StudentModel sm=(StudentModel)session.getAttribute("userModel");
            int chk=qd.incReportAbuseCount(qm,context,sm.getSid());
            if(chk==1)
                out.println("Reported Successfully..");
            else if(chk==0)
                out.println("Already Reported...");
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
