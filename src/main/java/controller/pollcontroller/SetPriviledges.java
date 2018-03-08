	package controller.pollcontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NotificationDao;
import dao.polldao.SetPriviledgesDao;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import model.NotificationModel;
import model.UserModel;
import model.pollmodel.CreateNewPollModel;

/**
 * Servlet implementation class SetPriviledges
 */
public class SetPriviledges extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetPriviledges() {
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
           
                   System.out.println("set priviledgescontroller,,,,,,,,,,,,,");
            HttpSession session;
            session=request.getSession();
            Object um = session.getAttribute("userModel");
            int queid= ((Integer) session.getAttribute("pollquei")).intValue();
            System.out.println("quied");
            ServletContext context=getServletContext();
            String pollviewer=request.getParameter("pollviewer");
            String branch=request.getParameter("branch");
            String sem=request.getParameter("sem");
            String sec=request.getParameter("sec");
            
            System.out.println("pollviewer:"+pollviewer);
            System.out.println("sec:"+sec);
            System.out.println("sem:"+sem);System.out.println("branch:"+branch);
            
            CreateNewPollModel cpm=new CreateNewPollModel();
            NotificationDao nd=new NotificationDao();
            ArrayList<NotificationModel> alnm=null;
            
            cpm.setBranch(branch);
            cpm.setSec(sec);
            cpm.setSem(sem);
            cpm.setPollviewer(pollviewer);
            cpm.setPollqueid(queid);
            cpm.setCreatorId(new UserModel().getUserId(um));
            cpm.setCreatorName(new UserModel().getUserName(um));
            
            boolean flag;
            SetPriviledgesDao spd = new SetPriviledgesDao();
            try {
                flag=spd.insertpollpriviledge(cpm, context);
                if(flag)
                    {
                	alnm=nd.notifyPollsForYou(cpm, context);
                	Gson gsonObj = new Gson();
                    String returnJSON=gsonObj.toJson(alnm);
                    session.setAttribute("NotifyVotersJson",returnJSON);
                	response.sendRedirect("poll/pollhome.jsp");
                    }
            } catch (SQLException ex) {
                Logger.getLogger(SetPriviledges.class.getName()).log(Level.SEVERE, null, ex);
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
