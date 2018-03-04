package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.AnswerDao;
import dao.NotificationDao;

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

import com.google.gson.Gson;

import model.AllAnswerModel;
import model.AnswerModel;
import model.FacultyModel;
import model.NotificationModel;
import model.QuestionModel;
import model.StudentModel;


/**
 * Servlet implementation class PostAnswer
 */
public class PostAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostAnswer() {
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
          
         
          int ansindex=Integer.parseInt(request.getParameter("ansindex"));
          String btnvalue=request.getParameter("btnvalue");
          String json=null;
          BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
         
          if(br != null)
          {
          json = br.readLine();
          }
            
          
          QuestionModel qm=(QuestionModel)session.getAttribute("currQues");
         
          AnswerModel am=(AnswerModel)session.getAttribute("currAns");
          AllAnswerModel aam=(AllAnswerModel)session.getAttribute("allAns");
          ArrayList<AnswerModel> answers = null;
          if(aam!=null)
          answers=aam.getAllans();
         
          
          am.setText(json);
          am.setAnswer(json);
          am.setAnsDate(DateFormat.getDateInstance().format(new Date()).toString());
          
          AnswerDao ad=new AnswerDao();
          NotificationDao nd=new NotificationDao();
          NotificationModel nm=new NotificationModel();
          String returnJSON="";
          ArrayList<NotificationModel> alnm=null;
          
          if(btnvalue.equals("POST ANSWER"))
          {
              ad.insertAnswer(am,context);
              answers.add(am);
           
              nm.setUid(qm.getUid());
              nm.setMessage(am.getUname()+" answered: "+qm.getQue());
              alnm=nd.notifyWhenAnswered(nm,qm.getQid(), context);
              
              Gson gsonObj = new Gson();
              returnJSON=gsonObj.toJson(alnm);
              
              
          }
          else
          {
              if(!(am.getReportAbuseCount()>=5))
              { 
                answers.remove(ansindex);
                ad.updateAnswer(am,context);
                answers.add(ansindex,am);
              }
              else
              {
                ad.updateAnswer(am,context);
                answers.add(am);
              }
              
              nm.setUid(qm.getUid());
              nm.setMessage(am.getUname()+" updated answer of: "+qm.getQue());
              alnm=nd.notifyWhenAnswered(nm,qm.getQid(), context);
              
              Gson gsonObj = new Gson();
              returnJSON=gsonObj.toJson(alnm);
              
                  
          }
          aam.setAllans(answers);
          session.setAttribute("allAns",aam);
          session.setAttribute("currAns",am);
           
          System.out.println(returnJSON);
          response.getWriter().write(returnJSON);
         
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
