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
import model.DomainModel;
import model.FacultyModel;
import model.StudentModel;

/**
 * Servlet implementation class MyWorkSpaces
 */
public class MyWorkSpaces extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyWorkSpaces() {
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
          
           String utype=(String)session.getAttribute("utype");
           StudentModel sm;
           FacultyModel fm;
           String id = null;
           
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
           DomainModel dm=new DomainModel();
           
           DomainDao dd=new DomainDao();
           dd.getMyWorkSpaces(dm,id,context);
           
           session.setAttribute("MyWorkSpaces",dm);
           response.sendRedirect("myworkspaces.jsp");
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
