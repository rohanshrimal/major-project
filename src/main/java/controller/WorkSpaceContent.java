package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.DomainDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DomainContentModel;
import model.FacultyModel;
import model.StudentModel;

/**
 * Servlet implementation class WorkSpaceContent
 */
public class WorkSpaceContent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WorkSpaceContent() {
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
            HttpSession session=request.getSession();
            ServletContext context=getServletContext();
            
            int did=Integer.parseInt(request.getParameter("did"));
            String dname=request.getParameter("dname");
            
            DomainContentModel dcm=new DomainContentModel();
            dcm.setDid(did);
            dcm.setDname(dname);
            
           String utype=(String)session.getAttribute("utype");
           String id="";
           StudentModel sm;
           FacultyModel fm;
           
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
            
            DomainDao dd=new DomainDao();
            dd.getDomainContent(dcm,id,context);
            
            session.setAttribute("workspacecontent", dcm);
            response.sendRedirect("Workspace_Page.jsp");
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
