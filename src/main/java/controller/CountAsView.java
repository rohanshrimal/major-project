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

import dao.AnswerDao;
import model.AllAnswerModel;
import model.AnswerModel;
import model.FacultyModel;
import model.StudentModel;

/**
 * Servlet implementation class CountAsView
 */
public class CountAsView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CountAsView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		System.out.println("hello i am on servlet");
		int index=Integer.parseInt(request.getParameter("index"));
		HttpSession session=request.getSession();
		ServletContext context=getServletContext();
		
		AllAnswerModel aam=(AllAnswerModel)session.getAttribute("allAns");
		ArrayList <AnswerModel> alam=aam.getAllans();
		AnswerModel am=alam.get(index);
		
		 boolean isViewed=(Boolean)session.getAttribute("viewing");
		
		 String utype=(String)session.getAttribute("utype");
         StudentModel sm;
         FacultyModel fm;
         String id="";
         if(utype.equals("student"))
         { 
             sm=(StudentModel)session.getAttribute("userModel");
             id=sm.getSid();
         }
         
         else if(utype.equals("faculty"))
         { 
             fm=(FacultyModel)session.getAttribute("userModel");
             id=fm.getFid();
         }
        
		PrintWriter out=response.getWriter();
		
		AnswerDao ad=new AnswerDao();
		
		if(!isViewed)
		{
			request.getSession().setAttribute("viewing",true);
			System.out.println(index +"viewed...");
			if(ad.countAsView(am,context,id))
				{
				alam.remove(index);
				am.setViews(am.getViews()+1);
				am.setViewed(true);
				alam.add(index,am);
				aam.setAllans(alam);
				session.setAttribute("allAns",aam);
				out.println(am.getViews());
				}
			else
				{
				out.println(am.getViews());
				}
			
			request.getSession().setAttribute("viewing",false);
		}
		else
		{
			System.out.println(index +"not viewed...");
			System.out.println("Yes yes Yes you cannot view....");
			out.println(am.getViews());
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
