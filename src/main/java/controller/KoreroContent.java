package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.BlogDao;
import dao.QuestionDao;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class KoreroContent
 */
public class KoreroContent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KoreroContent() {
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
            
          UserDao ud=new UserDao();
          QuestionDao qd=new QuestionDao();
          
          long userCount=ud.getUserCount(context);
          long questionCount=qd.getQuestionCount(context);
          long upvoteCount=ud.getUpvoteCount(context);
          
          String utype=request.getParameter("utype");
          
          if(utype.equals("student"))
          {
              response.sendRedirect("Student_Register.jsp?qc="+questionCount+"&upc="+upvoteCount+"&uc="+userCount);
          }
          else if(utype.equals("faculty"))
          {
              response.sendRedirect("Faculty_Register.jsp?qc="+questionCount+"&upc="+upvoteCount+"&uc="+userCount);
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
