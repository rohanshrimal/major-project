package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.AnswerDao;
import dao.BlogDao;
import dao.DomainDao;
import dao.FacultyDao;
import dao.QuestionDao;
import dao.StudentDao;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import model.AllBlogModel;
import model.DomainContentModel;
import model.DomainModel;
import model.FacultyModel;
import model.QuestionAnswerModel;
import model.QuestionModel;
import model.RelatedQuestionModel;
import model.StudentModel;
import model.UserModel;


/**
 * Servlet implementation class AskQuestion
 */
public class AskQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AskQuestion() {
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
	            
	            ServletContext context=getServletContext();
	            HttpSession session=request.getSession();
	            
	            String askque=request.getParameter("search");
	            
	            if(askque.startsWith("#"))
	            {
	                DomainContentModel dcm=new DomainContentModel();
	                dcm.setDname(askque.substring(1));
	                
	                String utype=(String)session.getAttribute("utype");
	                String id="";
	                StudentModel sm;
	                FacultyModel fm;
	           
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
	                
	                DomainDao dd=new DomainDao();
	                dd.getDomainById(dcm,id,context);
	                session.setAttribute("workspacecontent", dcm);
	                response.sendRedirect("Workspace_Page.jsp");
	                
	            }
	            else if(askque.startsWith("@"))
	            {
	                String uname=askque.substring(11,askque.indexOf("("));
	                String uid=askque.substring(askque.indexOf("(")+1,askque.indexOf(")"));
	                
	                RelatedQuestionModel rqm=new RelatedQuestionModel();
	                QuestionDao qd=new QuestionDao();
	                qd.myQuestions(rqm, uid, context);
	                session.setAttribute("myquestions",rqm);
	                
	                QuestionAnswerModel qam=new QuestionAnswerModel();
	                AnswerDao ad=new AnswerDao();
	                ad.myAnswers(qam,uid,context);
	                session.setAttribute("myanswers",qam);
	                
	                AllBlogModel abm=new AllBlogModel();
	                BlogDao bd=new BlogDao();
	                bd.getMyBlogs(abm,uid,context);
	                session.setAttribute("myblogs",abm);
	                
	                DomainModel dm=new DomainModel();
	                DomainDao dd=new DomainDao();
	                dd.getMyWorkSpaces(dm,uid,context);
	                session.setAttribute("myworkspaces",dm);
	                
	                StudentModel sm;
	                FacultyModel fm;
	                FacultyDao fd;
	                StudentDao sd;
	                UserModel um=new UserModel();
	                if(uid.startsWith("f") || uid.startsWith("F"))
	                {
	                    fm=new FacultyModel();
	                    fd=new FacultyDao();
	                    fm.setFid(uid);
	                    fd.getMyDetails(fm,context);
	                    
	                    um.setUid(fm.getFid());
	                    um.setUname(fm.getName());
	                    um.setDept(fm.getDepartment());
	                    um.setEmail(fm.getEmail());
	                    um.setUtype("Faculty");
	                    um.setAboutme(fm.getAboutme());
	                }
	                else if(uid.startsWith("s") || uid.startsWith("S"))
	                {
	                    sm=new StudentModel();
	                    sd=new StudentDao();
	                    sm.setSid(uid);
	                    sd.getMyDetails(sm,context);
	                    
	                    um.setUid(sm.getSid());
	                    um.setUname(sm.getName());
	                    um.setDept(sm.getBranch());
	                    um.setEmail(sm.getEmail());
	                    um.setUtype("Student");
	                    um.setAboutme(sm.getAboutme());
	                    um.setSem(sm.getSemester());
	                }
	                session.setAttribute("mymodel", um);
	                
	                
	                response.sendRedirect("profilepage.jsp");
	                
	            }
	            else
	            {    
	            QuestionModel qm=new QuestionModel();
	            qm.setQue(askque);
	            
	            QuestionDao qd=new QuestionDao();
	            
	            RelatedQuestionModel rqm=new RelatedQuestionModel();
	            qd.getQuestionSuggestion(qm,rqm, context);
	            session.setAttribute("relques",rqm);
	            response.sendRedirect("Question_Search.jsp");
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
