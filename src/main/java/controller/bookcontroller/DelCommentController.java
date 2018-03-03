package controller.bookcontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.bookdao.DelCommentDao;
import java.io.PrintWriter;
import javax.servlet.ServletContext;

/**
 * Servlet implementation class DelCommentController
 */
public class DelCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelCommentController() {
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
           /* TODO output your page here. You may use following sample code. */
           ServletContext context=getServletContext();
           int cid=Integer.parseInt(request.getParameter("cid"));
           
           System.out.println("cid===="+cid);
          DelCommentDao dd=new DelCommentDao();
          dd.deleteComment(cid, context);
          
           
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
