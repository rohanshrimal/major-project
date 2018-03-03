package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.AnswerDao;
import dao.BlogDao;
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
import model.AllBlogModel;
import model.AnswerModel;
import model.BlogModel;
import model.QuestionAnswerModel;
import model.QuestionModel;
import model.RelatedQuestionModel;

/**
 * Servlet implementation class DeleteMyContent
 */
public class DeleteMyContent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMyContent() {
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
            //System.out.println("innnnnnnnnnnnnnnnnnnn");
            ServletContext context = getServletContext();
            HttpSession session=request.getSession();
            
            String type=request.getParameter("type");
            if(type.equals("ans"))
            {
                int qid=Integer.parseInt(request.getParameter("qid"));
                String uid=request.getParameter("uid");
                int index=Integer.parseInt(request.getParameter("index"));
                
                QuestionAnswerModel qam=(QuestionAnswerModel)session.getAttribute("myanswers");
                ArrayList<QuestionModel> alqm=qam.getAlqm();
                ArrayList<AnswerModel> alam=qam.getAlam();
                
                alqm.remove(index);
                alam.remove(index);
                
                qam.setAlam(alam);
                qam.setAlqm(alqm);
                
                session.setAttribute("myanswers",qam);
                
                AnswerModel am=new AnswerModel();
                am.setQid(qid);
                am.setUid(uid);
                
                AnswerDao ad=new AnswerDao();
                ad.deleteMyAnswer(am,context);
                
                out.println("Deleted Successfully");
                       
            }
            else if(type.equals("que"))
            {
                int qid=Integer.parseInt(request.getParameter("qid"));
                int index=Integer.parseInt(request.getParameter("index"));
                
                RelatedQuestionModel rqm=(RelatedQuestionModel)session.getAttribute("myquestions");
                ArrayList<QuestionModel> alqm=rqm.getRelatedque();
                alqm.remove(index);
                rqm.setRelatedque(alqm);
                session.setAttribute("myquestions", rqm);
                
                QuestionModel qm=new QuestionModel();
                qm.setQid(qid);
                
                QuestionDao qd=new QuestionDao();
                qd.deleteMyQuestion(qm,context);
                
                out.println("Deleted Successfully");
            }
            else if(type.equals("blog"))
            {
                int bid=Integer.parseInt(request.getParameter("bid"));
                int index=Integer.parseInt(request.getParameter("index"));
                
                AllBlogModel abm=(AllBlogModel)session.getAttribute("myblogs");
                ArrayList<BlogModel> albm=abm.getAbm();
                albm.remove(index);
                abm.setAbm(albm);
                session.setAttribute("myblogs", abm);
                
                BlogModel bm=new BlogModel();
                bm.setBlogId(bid);
                
                BlogDao bd=new BlogDao();
                bd.deleteBlog(bm,context);
                
                out.println("Deleted Successfully");
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
