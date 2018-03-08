package controller.springcontroller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.FacultyModel;
import model.StudentModel;
import model.UserModel;
import model.pollmodel.CreateNewPollModel;
import model.springmodel.Events;
import model.springmodel.ClassDiscussion;
import model.springmodel.ClassPosts;
import model.springmodel.ClassRepresentative;
import model.springmodel.Coordinator;
import service.springservice.ClassService;
import service.springservice.CoordinatorService;
import service.springservice.EventService;

@Controller
@RequestMapping("/class")
public class ClassController 
{	
	@Autowired
	private ClassService classservice;
	@Autowired
	private EventService eventservice;
	
	@GetMapping("/CDFhomestudent")
	public String CDFhome(HttpServletRequest request,Model theModel)
	{	
		HttpSession session=request.getSession();
		Object object=session.getAttribute("userModel");
		StudentModel sm=null;
		
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
			
			return "CDFhomestudent";
		}
		return null;
	
	}
	
	@GetMapping("/CDFhomefaculty")
	public String showCDF(@ModelAttribute("type")String type,HttpServletRequest request,Model theModel)
	{	
		HttpSession session=request.getSession();
		Object object=session.getAttribute("userModel");
		FacultyModel fm=null;
		
		if(object instanceof FacultyModel)
		{
			fm=(FacultyModel)object;
			String fid=fm.getFid();
			
			Boolean coordinatorflag= classservice.checkCoordinator(fid);
			
			if(coordinatorflag)
			{	String utype="coordinator";
				theModel.addAttribute("type",utype);
			}
			else
			{	String utype="faculty";
				theModel.addAttribute("type",utype);	
			}
			
			
	}
		return "CDFhomefaculty";		
	}
	
	@GetMapping("/addPoll")
	public String addPoll(@RequestParam("pollid") int pollid, HttpSession session)
	{	
		ClassPosts theclassposts=new ClassPosts();
		theclassposts.setClassid(""+session.getAttribute("classid"));
		theclassposts.setPost_type("poll");
		theclassposts.setPostid(pollid);
		
		classservice.addClassPost(theclassposts);
		return "redirect:/major/class/CDFhomestudent";
	}
	
	@GetMapping("/showPoll")
	public String showPoll(HttpServletRequest request, Model theModel)
	{	
		HttpSession session=request.getSession();
		
		String classid= (String) session.getAttribute("classid");
		List<CreateNewPollModel> theCreateNewPollModel =classservice.showPoll(classid);
		
		theModel.addAttribute("showpoll", theCreateNewPollModel);
		return "showpoll";
	}
	
	@GetMapping("/addEventForm")
	public String addEventForm(Model theModel )
	{	
		Events theEvents = new Events();
		theModel.addAttribute("Events",theEvents);
		return "addevent";
	}
	
	@PostMapping("/addEvent")
	public String addClassEvent(@ModelAttribute ("Events") Events theEvents,HttpServletRequest request)
	{	
		HttpSession session=request.getSession();
		
		String creatorid=new UserModel().getUserId(session.getAttribute("userModel"));
		
		theEvents.setCreatorid(creatorid);
		theEvents.setPending(false);
		int id= eventservice.addEvent(theEvents);
		
		ClassPosts theclasspost = new ClassPosts();
		theclasspost.setClassid((String)session.getAttribute("classid"));
		theclasspost.setPost_type("event");
		theclasspost.setPostid(id);
		
		classservice.addClassPost(theclasspost);
	    return "redirect:/major/class/CDFhomestudent";
 
	}
	
	@GetMapping("/startDiscussion")
	public String addPost(Model theModel)
	{
		ClassDiscussion cd=new ClassDiscussion();
		theModel.addAttribute("ClassDiscussionModel",cd);
		return "classDiscussions";
	}
	
	@PostMapping("/saveDiscussion")
	public String savePost(@ModelAttribute ("ClassDiscussionModel") ClassDiscussion cd,HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		
		cd.setCreatorId(new UserModel().getUserId(session.getAttribute("userModel")));
		cd.setTimeStamp(new Date().getTime());
		int id=classservice.addDiscussion(cd);
		
		ClassPosts cp=new ClassPosts();
		cp.setClassid((String)session.getAttribute("classid"));
		cp.setPost_type("discussion");
		cp.setPostid(id);
		
		classservice.addClassPost(cp);
		return "redirect:/major/class/CDFhomestudent";
		
	}
	
	@GetMapping("/showDiscussions")
	public String showDiscussions(HttpServletRequest request,Model model)
	{
		ClassDiscussion cd=new ClassDiscussion();
		model.addAttribute("ClassDiscussionModel",cd);
		
		HttpSession session=request.getSession();
		String classId=(String)session.getAttribute("classid");
		
		List<ClassDiscussion> discussionsList=classservice.showDiscussions(classId);
		model.addAttribute("discussionsList",discussionsList);
		
		return "classDiscussions";
	}
}
	
	


