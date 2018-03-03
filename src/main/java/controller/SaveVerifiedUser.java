package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.FacultyDao;
import dao.StudentDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.FacultyModel;
import model.StudentModel;


/**
 * Servlet implementation class SaveVerifiedUser
 */
public class SaveVerifiedUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveVerifiedUser() {
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
           
           String uid=request.getParameter("uid");
           String pwd=request.getParameter("pass");
           
           if(uid.startsWith("s") || uid.startsWith("S"))
           {
               StudentModel sm=new StudentModel();
               sm.setPassword(pwd);
               sm.setSid(uid);
               
               StudentDao sd=new StudentDao();
               sd.insertStudent(sm, context);
           }
           else if(uid.startsWith("f") || uid.startsWith("F"))
           {
               FacultyModel fm=new FacultyModel();
               fm.setPassword(pwd);
               fm.setFid(uid);
               
               FacultyDao fd=new FacultyDao();
               fd.insertFaculty(fm, context);
               
              
               
           }
            response.sendRedirect("Choose_Workspace.jsp?uid="+uid);
               
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
