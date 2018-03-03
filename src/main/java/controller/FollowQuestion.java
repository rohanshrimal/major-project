package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.QuestionDao;
import model.UserModel;

/**
 * Servlet implementation class FollowQuestion
 */
public class FollowQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowQuestion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		
		String qid=request.getParameter("qid");
		String isFollowed=request.getParameter("isfollowed");
		
		System.out.println("qid="+qid+"isfol"+isFollowed);
		ServletContext context=getServletContext();
		HttpSession session=request.getSession();
		
		Object o=session.getAttribute("userModel");
		UserModel um=new UserModel();
		String userId=um.getUserId(o);
		
		QuestionDao qd=new QuestionDao();
		
		if(isFollowed.trim().equals("false"))
		{
			qd.followQuestion(qid,userId,context);
			out.println("follow");
		}
		
		else
		{
			qd.unfollowQuestion(qid,userId,context);
			out.println("unfollow");
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
