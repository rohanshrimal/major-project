package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.BlogDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.AllBlogModel;
import model.FacultyModel;
import model.StudentModel;

/**
 * Servlet implementation class MyBlogs
 */
public class MyBlogs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyBlogs() {
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
            FacultyModel fm;
            StudentModel sm;
            String id=null;
            
            if(utype.equals("faculty"))
            {
                fm=(FacultyModel)session.getAttribute("userModel");
                id=fm.getFid();
            }
            else if(utype.equals("student"))
            {
                sm=(StudentModel)session.getAttribute("userModel");
                id=sm.getSid();
            }
            
            AllBlogModel abm=new AllBlogModel();
            BlogDao bd=new BlogDao();
            
            bd.getMyBlogs(abm,id,context);
            session.setAttribute("myblogs", abm);
            response.sendRedirect("MyBlogsPage.jsp");
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
