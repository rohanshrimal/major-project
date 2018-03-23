package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dao.NotificationDao;
import model.NotificationModel;
import model.QuestionModel;
import model.UserModel;

/**
 * Servlet implementation class RequestAnswer
 */
public class RequestAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestAnswer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session=request.getSession();
		ServletContext context=getServletContext();
		PrintWriter out=response.getWriter();
		
		QuestionModel qm=(QuestionModel)session.getAttribute("currQues");
		String uid=request.getParameter("uid");
		String requesterName=new UserModel().getUserName(session.getAttribute("userModel"));
		
		NotificationModel nm=new NotificationModel();
		nm.setTimestamp(new Date().getTime());
		nm.setMessage(requesterName+" requested you to answer : "+qm.getQue());
		nm.setUid(uid);
		
		NotificationDao nd=new NotificationDao();
		nd.notifyA2A(nm, context);
		
		ArrayList<NotificationModel> alnm=new ArrayList<>();
		alnm.add(nm);
		
		Gson gsonObj = new Gson();
        String returnJSON=gsonObj.toJson(alnm);
        
        out.println(returnJSON);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
