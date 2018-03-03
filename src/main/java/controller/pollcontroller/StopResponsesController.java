package controller.pollcontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.polldao.PollSettingDao;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;

/**
 * Servlet implementation class StopResponsesController
 */
public class StopResponsesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StopResponsesController() {
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
               int queid=Integer.parseInt(request.getParameter("queid"));
             int pollviewstatus=Integer.parseInt(request.getParameter("pollviewstatus"));
             
             //System.out.println("queid" + queid+pollviewstatus);
            ServletContext context=getServletContext();
           
            PollSettingDao pd=new PollSettingDao();
            
            try {
                pd.changepollstatus(pollviewstatus, queid, context);
                
                response.sendRedirect("ViewMyPoll");
            } catch (SQLException ex) {
                Logger.getLogger(StopResponsesController.class.getName()).log(Level.SEVERE, null, ex);
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
