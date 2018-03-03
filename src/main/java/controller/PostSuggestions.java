package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.QuestionDao;
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
 * Servlet implementation class PostSuggestions
 */
public class PostSuggestions extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostSuggestions() {
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
           
           String que=request.getParameter("que");
           QuestionModel qm=new QuestionModel();
           qm.setQue(que);
            
           QuestionDao qd=new QuestionDao();
           qd.getExactQuestion(qm,context);
            
           ArrayList<QuestionModel> alqm=qd.getAlqm();
           RelatedQuestionModel rqm = new RelatedQuestionModel();
           rqm.setRelatedque(alqm);
           session.setAttribute("relques", rqm);
           out.println("<h4>Are you searching for?</h4><br>");
           int i=0;
           for(QuestionModel qmt:alqm)
            {
                if(i<7)
                out.println((i+1)+". <a href=AllAnswer?id="+i+"&cat=cat1>"+qmt.getQue()+"</a><br><br>");
            i++;
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
