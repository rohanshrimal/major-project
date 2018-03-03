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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.FacultyModel;
import model.StudentModel;

/**
 * Servlet implementation class CheckPwd
 */
public class CheckPwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckPwd() {
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
            
            String uid=request.getParameter("uid");
            String pwd=request.getParameter("pwd");
            
            System.out.println(""+uid+" ------------"+pwd);
            
            if(uid.toUpperCase().startsWith("S"))
            {
            StudentModel S=new StudentModel();
            S.setSid(uid);
            S.setPassword(pwd);
            StudentDao sd=new StudentDao();
            boolean flag=sd.verifyUser(S, context, session);
            
            out.println(flag);
            }
            else if(uid.toUpperCase().startsWith("F"))
            {
            FacultyModel F=new FacultyModel();
            F.setFid(uid);
            F.setPassword(pwd);
            FacultyDao fd=new FacultyDao();
            if(fd.verifyUser(F,context, session)){
                out.println("true");
            }
            else
                out.println("false");
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
