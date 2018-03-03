package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.BlogDao;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
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

/**
 * Servlet implementation class UpdateMyBlog
 */
public class UpdateMyBlog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMyBlog() {
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
             HttpSession session=request.getSession();
            ServletContext context=getServletContext();
            
            AllBlogModel abm=(AllBlogModel)session.getAttribute("myblogs");
            ArrayList<BlogModel> albm=abm.getAbm();
            
            int blogindex=Integer.parseInt(request.getParameter("blogindex"));
            String json=null;
            
            BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            if(br != null){
            json = br.readLine();}
            
            BlogModel bm=albm.get(blogindex);
            bm.setBlogContent(json);
            
            BlogDao bd=new BlogDao();
            bd.updateBlog(bm,context);
            
            albm.remove(blogindex);
            albm.add(blogindex,bm);
            abm.setAbm(albm);
            session.setAttribute("myblogs",abm);
           response.getWriter().write(json);
           
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
