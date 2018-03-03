package controller.bookcontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.bookdao.SubjectDao;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletContext;

/**
 * Servlet implementation class GetSubjectController
 */
public class GetSubjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetSubjectController() {
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
	           String branch=request.getParameter("branch");
	           String sem=request.getParameter("sem");
	           System.out.println("branch"+branch+"111111111111----sem="+sem);
	           ServletContext context=getServletContext();
	           
	           SubjectDao sd=new SubjectDao();
	           ArrayList<String> sub=sd.getSubjects(branch,sem,context);
	            System.out.println(sub);
	           for(String s:sub)
	           {
	               out.println("<option value=\""+s+"\">"+s+"</option>");
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
