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
import model.AllAnswerModel;
import model.AnswerModel;
import model.FacultyModel;
import model.StudentModel;


/**
 * Servlet implementation class ReportAnswer
 */
public class ReportAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportAnswer() {
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
            HttpSession session=request.getSession();
            ServletContext context= getServletContext();
            
            int qid=Integer.parseInt(request.getParameter("qid"));
            String type=request.getParameter("type");
            String uid=request.getParameter("uid");
            int answerindex=Integer.parseInt(request.getParameter("index"));
            
            AnswerModel am=new AnswerModel();
            am.setQid(qid);
            am.setUid(uid);
            
            AnswerDao ad=new AnswerDao();
            if(type.equals("faculty"))
            {
            FacultyModel fm=(FacultyModel)session.getAttribute("userModel");
            int d=ad.deleteAnswer(am,context);
            
            AllAnswerModel aam=(AllAnswerModel)session.getAttribute("allAns");
            ArrayList<AnswerModel> answers=aam.getAllans();
            answers.remove(answerindex);
            aam.setAllans(answers);
            session.setAttribute("allAns",aam);
            
           if(am.getUid().equals(fm.getFid()))
            {
               AnswerModel am1=(AnswerModel)session.getAttribute("currAns");
               am1.setReportAbuseCount(5);
               session.setAttribute("currAns",am1);
            }
            
            out.println("DELETED"+answerindex);
            }
            else
            {
            StudentModel sm=(StudentModel)session.getAttribute("userModel");
            int d=ad.incReportCount(am,context,sm.getSid());
            if(d==1)
                out.println("Reported Successfully");
            else
                out.println("Already Reported");
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
