package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.BlogDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.AllBlogModel;
import model.BlogModel;
import model.FacultyModel;
import model.StudentModel;

/**
 * Servlet implementation class UpDownBlogs
 */
public class UpDownBlogs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpDownBlogs() {
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
            ServletContext context =getServletContext();
            HttpSession session=request.getSession();
            
            String status=request.getParameter("status");
            int bid=Integer.parseInt(request.getParameter("bid"));
            int index=Integer.parseInt(request.getParameter("index"));
            
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
            
            BlogModel bm=new BlogModel();
            bm.setBlogId(bid);
            bm.setUid(id);
            
            BlogDao bd=new BlogDao();
            int votecount=0;
            if(status.equals("upvote"))
            {
            votecount=bd.incVote(bm,context);
            }
            else
            {
            votecount=bd.decVote(bm,context);
            }
            AllBlogModel abm=(AllBlogModel)session.getAttribute("domainblogs");
            ArrayList<BlogModel> albm=abm.getAbm();
            bm=albm.get(index);
            albm.remove(index);
            bm.setUpvotes(votecount);
            albm.add(index, bm);
            abm.setAbm(albm);
            session.setAttribute("domainblogs", abm);
            out.println(votecount);
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
