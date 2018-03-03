package controller.bookcontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.bookdao.ReadMoreDao;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import model.bookmodel.BookAdvisoryModel;

/**
 * Servlet implementation class ReadMoreController
 */
public class ReadMoreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReadMoreController() {
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
     
      System.out.println("READ MORE CONTROLLER");
     ServletContext context=getServletContext();
     int bookid=Integer.parseInt(request.getParameter("bookidinput"));
     
     BookAdvisoryModel bm=new BookAdvisoryModel();
     bm.setBookid(bookid);
     
      HttpSession session;
     session=request.getSession();
      boolean flag;
      ReadMoreDao rd=new ReadMoreDao();
     try { 
         flag= rd.readdetails(bm, context, session);
         if(flag)
          response.sendRedirect("book advisory/readmore.jsp");
         else
             out.println("SOMETHING WENT WRONG");
     } catch (SQLException ex) {
         Logger.getLogger(ReadMoreController.class.getName()).log(Level.SEVERE, null, ex);
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
