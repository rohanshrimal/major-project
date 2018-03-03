package controller.pollcontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.polldao.CreateNewPollDao;
import java.io.PrintWriter;
import java.util.Arrays;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import model.UserModel;
import model.pollmodel.CreateNewPollModel;

/**
 * Servlet implementation class SetDataPoll
 */
public class SetDataPoll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetDataPoll() {
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
                    HttpSession session;
                     String que=request.getParameter("que");
                     String option[]=request.getParameterValues("option");
                     session=request.getSession();
                     Object um = session.getAttribute("userModel");
                     CreateNewPollModel cpm=new CreateNewPollModel();
                     cpm.setQue(que);
                     cpm.setOption(option);
                     cpm.setCreatorId(new UserModel().getUserId(um));
                     cpm.setCreatorName(new UserModel().getUserName(um));
                     System.out.println(cpm.getQue());
                     
                     String arr[]=cpm.getOption();
                     System.out.println(Arrays.toString(arr));
                     
                     for(String ab : arr)
                     {
                          System.out.println("inloop"+ab+"\n");
                      }

                     CreateNewPollDao cpd=new CreateNewPollDao();
                     boolean flag;
                     flag=cpd.insertpoll(cpm, context,session);
                     System.out.println("---------------"+flag);
                     if(flag)
                     {int pollqueid= cpm.getPollqueid();
                        System.out.println("poll :"+pollqueid);
                         response.sendRedirect("poll/setpriviledges.jsp?msg=1");
                     
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
