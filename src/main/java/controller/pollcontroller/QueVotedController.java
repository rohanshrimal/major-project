package controller.pollcontroller;

import java.io.IOException;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.polldao.QueVotedDao;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import model.pollmodel.CreateNewPollModel;

/**
 * Servlet implementation class QueVotedController
 */
public class QueVotedController extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueVotedController() {
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
            
            
            System.out.println(" QUE VOTED CONTROLLER");
            
            System.out.println(" optid "+request.getParameter("opt") );
           // int queid=Integer.parseInt(request.getParameter("queid"));
            String optque=request.getParameter("opt");
            String[] optque1 = optque.split(",");
            int optid=Integer.parseInt(optque1[0]);
            int queid=Integer.parseInt(optque1[1]);
            //System.out.println(" QUEid "+ queid);
            System.out.println(" optid "+ optid);
            
            HttpSession session;
            session=request.getSession();
            CreateNewPollModel cm=new CreateNewPollModel();
            cm.setPollqueid(queid);
             cm.setOptid(optid);
             
             boolean flag;
             QueVotedDao qd=new QueVotedDao();
             flag=qd.insertvote(cm,context, session);
             if(flag)
                 response.sendRedirect("VotePollController");
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
