package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.DomainDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.FacultyModel;
import model.StudentModel;

/**
 * Servlet implementation class FollowUnfollow
 */
public class FollowUnfollow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowUnfollow() {
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
       
       int did=Integer.parseInt(request.getParameter("did"));
       String isfollow=request.getParameter("isfollow");
            System.out.println("///////////"+isfollow);
       String utype=(String)session.getAttribute("utype");
       StudentModel sm;
       FacultyModel fm;
       String id=null;
       String status="s";
       
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
       System.out.println("-------------------------------------------------"+status);
       if(isfollow.trim().equals("FOLLOW"))
       {
        dd.followUser(id,did,context);
        System.out.println(status);
        out.println("FOLLOWED");
       }
       else if(isfollow.trim().equals("FOLLOWED"))
       {
        dd.unFollowUser(id,did,context);
        out.println("FOLLOW");
       }
       System.out.println("************************************************"+status);
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
