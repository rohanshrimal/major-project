package controller.springcontroller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.FacultyModel;
import model.StudentModel;
import model.springmodel.ClassPosts;
import model.springmodel.ClassRepresentative;
import model.springmodel.Coordinator;
import service.springservice.ClassService;
import service.springservice.CoordinatorService;

@Controller
@RequestMapping("/class")
public class ClassController 
{	
	@Autowired
	private ClassService classservice;
	
	@GetMapping("/CDFhome")
	public String CDFhome(HttpServletRequest request,Model theModel)
	{	
		HttpSession session=request.getSession();
		Object object=session.getAttribute("userModel");
		StudentModel sm=null;
		FacultyModel fm=null;
		
		if(object instanceof StudentModel)
		{
			sm=(StudentModel)object;
			String classid=sm.getBranch()+"-"+sm.getSemester()+"-"+sm.getSection()+"-"+sm.getBatch();
			session.setAttribute("classid",classid);
			
			List<StudentModel> theClassMembers= classservice.showClassMembers(sm);
			theModel.addAttribute("classmembers", theClassMembers);
			
			List<StudentModel> theCR= classservice.showClassCR(sm);
			theModel.addAttribute("CR", theCR);
			
			List<FacultyModel> theClassCoordinator= classservice.showClassCoordinator(sm);
			theModel.addAttribute("classCoordinator", theClassCoordinator);
			
			
		}
		else if(object instanceof FacultyModel)
		{
			fm=(FacultyModel)object;
		}
		
		if(fm==null)
		{
			System.out.println(sm.getName());
		}
		else if(sm==null)
		{
			System.out.println(fm.getName());
		}
			
		
		return "CDFhome";
	}
	
	@GetMapping("/addPoll")
	public String addPoll(@RequestParam("pollid") int pollid, HttpSession session)
	{	
		System.out.println("-------------------classid"+session.getAttribute("classid"));
		ClassPosts theclassposts=new ClassPosts();
		theclassposts.setClassid(""+session.getAttribute("classid"));
		theclassposts.setPost_type("poll");
		theclassposts.setPostid(pollid);
		
		classservice.addPoll(theclassposts);
		return "poll";
	}

}
