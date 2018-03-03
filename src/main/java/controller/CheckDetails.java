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
import mailmodule.SendMailSSL2;
import model.FacultyModel;
import model.StudentModel;

/**
 * Servlet implementation class CheckDetails
 */
public class CheckDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckDetails() {
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
	            
	            String uid=request.getParameter("id");
	            String sans=request.getParameter("sans");
	            String sque=request.getParameter("sque");
	            boolean flag=false;
	            String mail="",pwd="";
	            
	            if(uid.toLowerCase().startsWith("s"))
	            {
	                StudentModel sm=new StudentModel();
	                sm.setSid(uid);
	                sm.setSecurityque(sque);
	                sm.setSecurityans(sans);
	                
	                StudentDao sd=new StudentDao();
	                flag=sd.checkVerification(sm,context);
	                mail=sm.getEmail();
	                pwd=sm.getPassword();
	            }
	            else if(uid.toLowerCase().startsWith("f"))
	            {
	                FacultyModel fm=new FacultyModel();
	                fm.setFid(uid);
	                fm.setSecurityque(sque);
	                fm.setSecurityans(sans);
	                
	                FacultyDao fd=new FacultyDao();
	                flag=fd.checkVerification(fm,context);
	                mail=fm.getEmail();
	                pwd=fm.getPassword();
	            }
	            
	            if(flag)
	            {
	                SendMailSSL2 sms=new SendMailSSL2();
	           sms.verification(mail, pwd);
	           response.sendRedirect("LogInContent?cat=mailsent");
	            }
	            else
	                response.sendRedirect("LogInContent?cat=invalid");
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
