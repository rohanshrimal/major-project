package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.DomainDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.StringTokenizer;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DomainModel;

/**
 * Servlet implementation class SelectDomain
 */
public class SelectDomain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectDomain() {
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
            ServletContext context=getServletContext();
            HttpSession session=request.getSession();
            
            String domains=request.getParameter("domains");
            String uid=request.getParameter("uid");
            
            DomainModel domain=new DomainModel();
            ArrayList<String> dlist=new ArrayList<>();
            StringTokenizer st=new StringTokenizer(domains,",");
        System.out.println(domains+"//////////");
            while(st.hasMoreTokens())
            {
                dlist.add(st.nextToken().substring(5));
               
            }
            domain.setDomainList(dlist);
                System.out.println("dlist----?>>"+dlist);
           
            DomainDao dd=new DomainDao();
            if(dd.saveUserDomain(domain,uid, context))
            {
            response.sendRedirect("GetDomainKeywords?uid="+uid);
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
