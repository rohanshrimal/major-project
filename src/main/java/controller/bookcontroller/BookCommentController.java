package controller.bookcontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.bookdao.BookCommentDao;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import model.bookmodel.BookCommentModel;


/**
 * Servlet implementation class BookCommentController
 */
public class BookCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookCommentController() {
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
          
            ServletContext context= getServletContext();
            HttpSession session=request.getSession();
            String text=request.getParameter("commenttext");
            
            BookCommentModel bcm=new BookCommentModel();
            bcm.setComment(text);
            
            int bookid=((Integer) session.getAttribute("commentbookid")).intValue();
            BookCommentDao bcd=new BookCommentDao();
            boolean flag;
            flag=bcd.insertComment(bcm, context, session);
            if(flag)
                response.sendRedirect("ReadMoreController?bookidinput="+bookid);
            
            
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
