package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.UserDao;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class ImageUploader
 */
public class ImageUploader extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageUploader() {
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
	            /* TODO output your page here. You may use following sample code. */
	            ServletContext context=getServletContext();
	            DiskFileItemFactory factory=new DiskFileItemFactory();
	            ServletFileUpload upload=new ServletFileUpload(factory);
	            try {
	                List<FileItem> item;
	                item = upload.parseRequest(request);
	                String uid=request.getParameter("uid");
	           
	                for(FileItem items:item )
	                {
	                    String s=items.getFieldName();
	                    
	                    if(s.equals("image"))
	                    {
	                        out.print("image");
	                        int size;
	                        size = (int)items.getSize();
	                        byte b[]=new byte[size];
	                        try (InputStream is = items.getInputStream()) {
	                            is.read(b);
	                        }
	                        
	                       String fname=items.getName();
	                        try (FileOutputStream fos = new FileOutputStream(getServletConfig().getServletContext().getRealPath("/")+"Images\\UserImg\\"+fname)) {
	                            fos.write(b);
	                        }
	                        UserDao ud=new UserDao();
	                        String imgpath=getServletConfig().getServletContext().getRealPath("/")+"Images\\UserImg\\"+fname;
	                        ud.saveImagePath(uid,imgpath,context);
	                        response.sendRedirect("MyProfile");
	                    }
	                    
	                    
	                }
	            } catch (FileUploadException | IOException ex) {
	                out.println(ex);
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
