package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.FacultyDao;
import dao.StudentDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.FacultyModel;
import model.StudentModel;

/**
 * Servlet implementation class SaveUser
 */
public class SaveUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveUser() {
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
            String utype=request.getParameter("utype");
            HttpSession session=request.getSession(true);
            ServletContext context=getServletContext();
            if(utype.equals("student"))
            {
                StudentModel S=new StudentModel();
            S.setName((String)(request.getParameter("name")));
            S.setSid((String)request.getParameter("id").toUpperCase());
            S.setEmail((String)request.getParameter("email"));
            S.setBranch((String)request.getParameter("branch"));
            S.setSemester((String)request.getParameter("sem"));
            S.setSection((String)request.getParameter("sec"));
            S.setPassword((String)request.getParameter("password"));
            S.setSecurityque((String)request.getParameter("sq"));
            S.setSecurityans((String)request.getParameter("sa"));
            
            StudentDao sd=new StudentDao();
                if(sd.insertStudent(S, context))
                {
                session.setAttribute("id", S.getSid());
                response.sendRedirect("selectdomain.jsp");
                }
               
                else
                    out.println("registration not successful");
             }
            else if(utype.equals("faculty"))
            {
            FacultyModel F=new FacultyModel();
            F.setName((String)(request.getParameter("name")));
            F.setFid((String)request.getParameter("id").toUpperCase());
            F.setEmail((String)request.getParameter("email"));
            F.setDepartment((String)request.getParameter("dept"));
            F.setPassword((String)request.getParameter("password"));
            F.setSecurityque((String)request.getParameter("sq"));
            F.setSecurityans((String)request.getParameter("sa"));
            FacultyDao fd=new FacultyDao();
                if(fd.insertFaculty(F, context))
                {
                session.setAttribute("id", F.getFid());
                response.sendRedirect("selectdomain.jsp");
                }
               
                else
                    out.println("registration not successful");
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
