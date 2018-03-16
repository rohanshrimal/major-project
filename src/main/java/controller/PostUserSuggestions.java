package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;

/**
 * Servlet implementation class PostUserSuggestions
 */
public class PostUserSuggestions extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostUserSuggestions() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
		ServletContext context=getServletContext();
		PrintWriter out=response.getWriter();
		
		String uname=request.getParameter("uname");
		UserDao ud=new UserDao();
        ArrayList<String> allUserList=ud.getAllUsers("@"+uname,context);
        out.println("<h4>Are you searching for?</h4><br>");
        int i=0;
        for(String userName:allUserList)
        {
        	if(allUserList.size()>0)
        	{
        		if(i==0)
        		{
        			i++;
        			continue;
        		}
        	}
        	out.println((i)+". \t<a href=''>"+userName+"</a><br><br>");
        	i++;
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
