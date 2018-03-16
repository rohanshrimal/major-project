package controller.springcontroller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;

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
import model.springmodel.PollQueDetails;
import model.springmodel.ClassDiscussion;
import model.springmodel.ClassDiscussionComment;
import model.springmodel.ClassPosts;
import model.springmodel.ClassRepresentative;
import model.springmodel.ClassSubjectFaculty;
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
	public String showCDF(HttpServletRequest request,Model theModel)
	{	
		HttpSession session=request.getSession();
		Object object=session.getAttribute("userModel");
		FacultyModel fm=null;
		
		if(object instanceof FacultyModel)
		{
			fm=(FacultyModel)object;
			String fid=fm.getFid();
					
		Set<String> classdetails =classservice.getClassDetails(fid);
		
		ClassSubjectFaculty subjectFaculty=null;
		List<ClassSubjectFaculty> classList=new ArrayList<>();
		for(String classId:classdetails)
		{
			subjectFaculty=new ClassSubjectFaculty();
			subjectFaculty.setClassAttributes(classId);
			classList.add(subjectFaculty);
		}
			ClassSubjectFaculty theclasssubjectfaculty= new ClassSubjectFaculty();
			theModel.addAttribute("classList", classList);
			theModel.addAttribute("classsubjectfaculty",theclasssubjectfaculty);
		}
		
		return "chooseclass";		
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
		List<PollQueDetails> theCreateNewPollModel =classservice.showPoll(classid);
		
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
	
	
	
	@PostMapping("/saveDiscussion")
	public String savePost(@ModelAttribute ("ClassDiscussionModel") ClassDiscussion cd,HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		
		UserModel um=new UserModel();
		String uid=um.getUserId(session.getAttribute("userModel"));
		um.setUid(uid);
		
		cd.setUserModel(um);
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
		
		ClassDiscussionComment cdc=new ClassDiscussionComment();
		model.addAttribute("ClassCommentModel",cdc);
		
		HttpSession session=request.getSession();
		String classId=(String)session.getAttribute("classid");
		
		List<ClassDiscussion> discussionsList=classservice.showDiscussions(classId);
		model.addAttribute("discussionsList",discussionsList);
		
		return "classDiscussions";
	}
	

	@PostMapping("/classdiscussionfaculty")
	public String classdiscussionfaculty(@ModelAttribute ("classsubjectfaculty") ClassSubjectFaculty csf,HttpServletRequest request,Model theModel)
	{
		HttpSession session=request.getSession();
		Object object=session.getAttribute("userModel");
		
		String classid=csf.getClassid();
		System.out.println("---------==>"+classid);
		session.setAttribute("classid", classid);
		FacultyModel fm=null;
		
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
		theModel.addAttribute("classid", classid);
		return "CDFhomefaculty";
		
	}
	
	@GetMapping("/showEvents")
	public String showEvents(HttpServletRequest request, Model theModel)
	{
		
		HttpSession session= request.getSession();
		String classid=(String)session.getAttribute("classid");
		List<Events> eventlist=classservice.showEvents(classid);
		theModel.addAttribute("eventlist", eventlist);
		System.out.println(eventlist);
		return "classevents";
		
	}
	
	
	@PostMapping("/postComment")
	public String postComment(@RequestParam("disId") int disId,@ModelAttribute("ClassCommentModel") ClassDiscussionComment cdc,HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		
		UserModel um=new UserModel();
		um.setUid(um.getUserId(session.getAttribute("userModel")));
		
		ClassDiscussion cd=new ClassDiscussion();
		cd.setId(disId);
		
		cdc.setClassDiscussion(cd);
		cdc.setUserModel(um);
		cdc.setTimestamp(new Date().getTime());
		
		classservice.postComment(cdc);
		
		return "redirect:/major/class/CDFhomestudent";
	}
}


	
	


