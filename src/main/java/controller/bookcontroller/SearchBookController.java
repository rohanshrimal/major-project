package controller.bookcontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.bookdao.SearchBookDao;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import model.bookmodel.BookAdvisoryModel;

/**
 * Servlet implementation class SearchBookController
 */
public class SearchBookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchBookController() {
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
         
         String branch=request.getParameter("branch");
         int sem=Integer.parseInt(request.getParameter("sem"));
         String subject=request.getParameter("subject");
         System.out.println(branch);
         BookAdvisoryModel bm=new BookAdvisoryModel();
         bm.setBranch(branch);
         bm.setSem(sem);
         bm.setSubject(subject);
         
         System.out.println("book advisory");
         System.out.println(bm.getBranch());
         System.out.println(bm.getSem());
         System.out.println(bm.getSubject());
         
         HttpSession session;
         session=request.getSession();
         boolean flag;
         SearchBookDao sd=new SearchBookDao();
         try {
             flag= sd.searchbook(bm, context, session); 
             
             if(flag)
                 response.sendRedirect("book advisory/subjectpage.jsp");
             else
                 response.sendRedirect("book advisory/firstbookentry.jsp");
         } catch (SQLException ex) {
             Logger.getLogger(SearchBookController.class.getName()).log(Level.SEVERE, null, ex);
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
