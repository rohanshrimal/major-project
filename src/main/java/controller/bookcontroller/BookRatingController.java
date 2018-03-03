package controller.bookcontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.bookdao.BookRatingDao;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import model.bookmodel.BookAdvisoryModel;

/**
 * Servlet implementation class BookRatingController
 */
public class BookRatingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookRatingController() {
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
           int rate=Integer.parseInt(request.getParameter("rate"));
           
           HttpSession session;
           session=request.getSession();
           System.out.println("rate"+rate);
           
           BookRatingDao brd= new BookRatingDao();
           float changerating=brd.setrating(rate, context, session);
           
           BookAdvisoryModel bam=(BookAdvisoryModel) session.getAttribute("readmorebook");
           bam.setBookrating(changerating);
           session.setAttribute("readmorebook", bam);
           if(changerating!=0)
               out.println(changerating+"/5");
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
