package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.AnswerDao;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.AnswerModel;
import model.QuestionAnswerModel;
import model.QuestionModel;

/**
 * Servlet implementation class UpdateMyAnswer
 */
public class UpdateMyAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMyAnswer() {
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
            
            int ansindex=Integer.parseInt(request.getParameter("ansindex"));
            String json=null;
            
             BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            if(br != null){
          json = br.readLine();}
            
            System.out.println(json+ansindex);
            QuestionAnswerModel qam=(QuestionAnswerModel)session.getAttribute("myanswers");
            ArrayList<AnswerModel> alam=qam.getAlam();
            
            AnswerModel am=alam.get(ansindex);
            am.setText(json);
            am.setAnswer(json);
            am.setAnsDate(DateFormat.getDateInstance().format(new Date()).toString());
            
            AnswerDao ad=new AnswerDao();
            alam.remove(ansindex);
            ad.updateAnswer(am,context);
            alam.add(ansindex,am);
            
            qam.setAlam(alam);
            session.setAttribute("myanswers",qam);
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
