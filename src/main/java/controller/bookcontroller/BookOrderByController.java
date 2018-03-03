package controller.bookcontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.bookdao.BookOrderByDao;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BookOrderByController
 */
public class BookOrderByController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookOrderByController() {
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
           
            System.out.println("BOOK ORDER BY CONTROLLER");
            ServletContext context=getServletContext();
            String sorting=request.getParameter("sorting");
            String subject=request.getParameter("subject");
            int subcode=Integer.parseInt(request.getParameter("subcode"));
            
            System.out.println(sorting +"   "+subcode);
            
           HttpSession session;
            session=request.getSession();
            boolean flag;
            BookOrderByDao bo=new BookOrderByDao();
            flag= bo.orderby(subcode, sorting, subject, context, session);
            if(flag)
                response.sendRedirect("book advisory/subjectpage.jsp");
            else
                response.sendRedirect("book advisory/firstbookentry.jsp");
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
