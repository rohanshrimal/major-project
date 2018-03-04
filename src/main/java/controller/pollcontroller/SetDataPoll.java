/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.pollcontroller;

import dao.polldao.CreateNewPollDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserModel;
import model.pollmodel.CreateNewPollModel;

/**
 *
 * @author rohan
 */
public class SetDataPoll extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
             ServletContext context=getServletContext();
                    HttpSession session;
                     String que=request.getParameter("que");
                     String check=request.getParameter("var");
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
                     session=request.getSession();
                     CreateNewPollDao cpd=new CreateNewPollDao();
                     boolean flag;
                     flag=cpd.insertpoll(cpm, context,session);
                     System.out.println("---------------"+flag);
                     if(flag)
                     {
                    	 System.out.println("var------>"+check);
                         
                    	 if(check.equalsIgnoreCase("class"))
                    	 	{
                    		 int pollqid= cpm.getPollqueid();
                    		 response.sendRedirect("/korero-maven/major/class/addPoll?pollid="+pollqid);
                    	 	}
                    	
                    	 else
                    	 {
                    		 int pollqueid= cpm.getPollqueid();
                    		 System.out.println("poll :"+pollqueid);
                    		 response.sendRedirect("poll/setpriviledges.jsp?msg=1");
                    	 }
                     }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
