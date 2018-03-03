package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import model.UserModel;

/**
 * Servlet implementation class FollowUser
 */
public class FollowUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ServletContext context=getServletContext();
		HttpSession session=request.getSession();
		PrintWriter out=response.getWriter();
		
		UserModel um=new UserModel();
		UserDao ud=new UserDao();
		
		String otherUserId=request.getParameter("uid");
		String isFollowed=request.getParameter("isfollowed");
		String myId=um.getUserId(session.getAttribute("userModel"));
		
		System.out.println(otherUserId+"--"+isFollowed+"--"+myId);
		if(isFollowed.trim().equals("false"))
		{
			ud.followUser(myId,otherUserId,context);
			out.println("follow");
		}
		
		else
		{
			ud.unFollowUser(myId,otherUserId,context);
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
