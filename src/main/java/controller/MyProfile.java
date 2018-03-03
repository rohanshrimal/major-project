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
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.AllBlogModel;
import model.DomainModel;
import model.FacultyModel;
import model.QuestionAnswerModel;
import model.RelatedQuestionModel;
import model.StudentModel;
import model.UserModel;


/**
 * Servlet implementation class MyProfile
 */
public class MyProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyProfile() {
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
                ServletContext context=getServletContext();
                String utype=(String)session.getAttribute("utype");
                StudentModel sm;
                FacultyModel fm;
                UserModel um=new UserModel();
                FacultyDao fd;
                StudentDao sd;
                String uid=null;
                
                if(utype.equals("faculty"))
                {
                    fm=(FacultyModel)session.getAttribute("userModel");
                    uid=fm.getFid();
                    fd=new FacultyDao();
                    fd.getMyDetails(fm,context);
                    
                    um.setUid(fm.getFid());
                    um.setUname(fm.getName());
                    um.setDept(fm.getDepartment());
                    um.setEmail(fm.getEmail());
                    um.setUtype("Faculty");
                    um.setAboutme(fm.getAboutme());
                }
                else if(utype.equals("student"))
                {
                    sm=(StudentModel)session.getAttribute("userModel");
                    uid=sm.getSid();
                    sd=new StudentDao();
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
                
                response.sendRedirect("myprofile.jsp");
                
            
            
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
