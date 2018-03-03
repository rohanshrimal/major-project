package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.AnswerDao;
import dao.BlogDao;
import dao.KeyWordDao;
import dao.QuestionDao;
import dao.UserDao;
import dao.bookdao.BookDao;
import dao.polldao.PollDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LogInContent
 */
public class LogInContent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogInContent() {
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
          
          String cat=request.getParameter("cat");
          
          UserDao ud=new UserDao();
          QuestionDao qd=new QuestionDao();
          BlogDao bd=new BlogDao();
          KeyWordDao kwd=new KeyWordDao();
          AnswerDao ad=new AnswerDao();
          BookDao bod=new BookDao();
          PollDao pd=new PollDao();
          
          long userCount=ud.getUserCount(context);
          long questionCount=qd.getQuestionCount(context);
          long upvoteCount=ud.getUpvoteCount(context);
          long tagCount=kwd.getTagsCount(context);
          long blogCount=bd.getBlogCount(context);
          long ansCount=ad.getAnsCount(context);
          long bookCount=bod.getBookCount(context);
          long pollCount=pd.getPollCount(context);
          
          
          response.sendRedirect("LogInPage.jsp?uc="+userCount+"&qc="+questionCount+"&uvc="+upvoteCount+"&tc="+tagCount+"&bc="+blogCount+"&ac="+ansCount+"&boc="+bookCount+"&pc="+pollCount+"&cat="+cat);
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
