package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.FacultyDao;
import dao.StudentDao;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.FacultyModel;
import model.StudentModel;

/**
 * Servlet implementation class VerifyUser
 */
public class VerifyUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyUser() {
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
            HttpSession session=request.getSession(true);
          
            String uid=request.getParameter("id");
            String pwd=request.getParameter("pwd");
            String rememberme=request.getParameter("rememberme");
            UserDao ud=new UserDao();
            
             if(uid.equals("admin") && pwd.equals("admin"))
            {
            	response.sendRedirect("major/admin/home");
            }
            
            else{
                
            if(uid.toUpperCase().startsWith("S"))
            {
            StudentModel S=new StudentModel();
            S.setSid(uid);
            S.setPassword(pwd);
            StudentDao sd=new StudentDao();
            if(sd.verifyUser(S,context, session)){
            
            String status=ud.checkUserStatus(uid,context);
            session.setAttribute("ustatus", status);
            if(rememberme!=null)
            {     
                Cookie ck1=new Cookie("uid",uid);
                Cookie ck2=new Cookie("pwd",pwd);
                
                ck1.setMaxAge(30*24*60*60);
                ck2.setMaxAge(30*24*60*60);
                
                response.addCookie(ck1);
                response.addCookie(ck2);
            }
            //out.println("Hello "+((StudentModel)(session.getAttribute("sm"))).getName());
            session.setAttribute("utype","student");
            session.setAttribute("userModel",S);
            session.setAttribute("updown",false);
            session.setAttribute("viewing",false);
            
                if(status.equals("4"))
                response.sendRedirect("MyFeed");
                else if(status.equals("3"))
                response.sendRedirect("GetDomainKeywords?uid="+uid);
                else if(status.equals("2"))
                response.sendRedirect("Choose_Workspace.jsp?uid="+uid);
            }
            else if(ud.checkTempUser(uid,pwd,context))
            {
            	 response.sendRedirect("OtpPage.jsp?uid="+uid+"&pwd="+pwd);
            }
            else 
            {
                response.sendRedirect("LogInContent?cat=invalid");
            }
            }
            else if(uid.toUpperCase().startsWith("F"))
            {
            FacultyModel F=new FacultyModel();
            F.setFid(uid);
            F.setPassword(pwd);
            FacultyDao fd=new FacultyDao();
            if(fd.verifyUser(F,context, session)){
                
                String status=ud.checkUserStatus(uid,context);
                session.setAttribute("ustatus", status);
                
                if(rememberme!=null)
            {       
                Cookie ck1=new Cookie("uid",uid);
                Cookie ck2=new Cookie("pwd",pwd);
                
                ck1.setMaxAge(30*24*60*60);
                ck2.setMaxAge(30*24*60*60);
                
                response.addCookie(ck1);
                response.addCookie(ck2);
            }
            //out.println("Hello "+((FacultyModel)(session.getAttribute("fm"))).getName());
                session.setAttribute("utype","faculty");
                session.setAttribute("userModel",F);
                session.setAttribute("updown",false);
                session.setAttribute("viewing",false);
                
                if(status.equals("4"))
                response.sendRedirect("MyFeed");
                else if(status.equals("3"))
                response.sendRedirect("GetDomainKeywords?uid="+uid);
                else if(status.equals("2"))
                response.sendRedirect("Choose_Workspace.jsp?uid="+uid);
            
            }
             else if(ud.checkTempUser(uid,pwd,context))
            {
            	 response.sendRedirect("OtpPage.jsp?uid="+uid+"&pwd="+pwd);
            }
            else 
            {
                out.println("<script>alert('Invalid Id Or Password')</script>");
               response.sendRedirect("LogInContent?cat=invalid");
            }
        }
            else
            {
                response.sendRedirect("LogInContent?cat=invalid");
            }
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
