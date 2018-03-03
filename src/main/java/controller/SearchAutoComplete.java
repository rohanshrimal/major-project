package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import dao.DomainDao;
import dao.QuestionDao;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.QuestionModel;
import model.RelatedQuestionModel;


/**
 * Servlet implementation class SearchAutoComplete
 */
public class SearchAutoComplete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchAutoComplete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
        try (PrintWriter out = response.getWriter()) {
            
            ServletContext context=getServletContext();
            HttpSession session=request.getSession();
            String term=request.getParameter("term");
            
            if(term.startsWith("#"))
            {
               DomainDao dd=new DomainDao();
               ArrayList<String> dlist=dd.getAllWorkSpaces(term,context);
               String searchList = new Gson().toJson(dlist);
               response.getWriter().write(searchList);
            }
            else if(term.startsWith("@"))
            {
               UserDao ud=new UserDao();
               ArrayList<String> allUserList=ud.getAllUsers(term,context);
               String userList=new Gson().toJson(allUserList);
               response.getWriter().write(userList);
            }
            else
            {     
            QuestionModel qm=new QuestionModel();
            qm.setQue(term);
            
            QuestionDao qd=new QuestionDao();
            RelatedQuestionModel rqm=new RelatedQuestionModel();
            ArrayList<String> suggestions=qd.getQuestionSuggestion(qm,rqm,context);
            String searchList = new Gson().toJson(suggestions);
            response.getWriter().write(searchList);
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
