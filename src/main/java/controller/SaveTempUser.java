package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mailmodule.OtpGenerator;
import mailmodule.SendMailSSL;
import model.TempUserModel;

/**
 * Servlet implementation class SaveTempUser
 */
public class SaveTempUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveTempUser() {
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
           
           String utype=request.getParameter("utype");
           TempUserModel tum=new TempUserModel();
           OtpGenerator og=new OtpGenerator();
           Integer otp=og.generateOtp();
           
           if(utype.equals("Student"))
           {
               String uname=request.getParameter("namevalidate");
               String branch=request.getParameter("branch");
               String sem=request.getParameter("sem");
               String sec=request.getParameter("sec");
               String uid=request.getParameter("idvalidate");
               String sque=request.getParameter("sque");
               String email=request.getParameter("emailcontrol");
               String sans=request.getParameter("securityvalidate");
               
               tum.setBranch(branch);
               tum.setEmail(email);
               tum.setSans(sans);
               tum.setSec(sec);
               tum.setSem(sem);
               tum.setSque(sque);
               tum.setUid("S"+uid);
               tum.setUname(uname);
               tum.setUtype(utype);
               tum.setOtp(otp.intValue());
               
               UserDao ud=new UserDao();
               ud.saveTempUser(tum,context);
           }
           
           else if(utype.equals("Faculty"))
           {
               String uname=request.getParameter("namevalidate");
               String branch=request.getParameter("branch");
               String uid=request.getParameter("idvalidate");
               String sque=request.getParameter("sque");
               String email=request.getParameter("emailcontrol");
               String sans=request.getParameter("securityvalidate");
               
               tum.setBranch(branch);
               tum.setEmail(email);
               tum.setSans(sans);
               tum.setSque(sque);
               tum.setUid("F"+uid);
               tum.setUname(uname);
               tum.setUtype(utype);
               tum.setOtp(otp.intValue());
               
               UserDao ud=new UserDao();
               ud.saveTempUser(tum,context);
           }
           SendMailSSL sms=new SendMailSSL();
           sms.verification(tum.getEmail(),tum.getUid() ,otp.toString());
           response.sendRedirect("OtpPage.jsp");
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
