package controller.springcontroller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import model.springmodel.ClassRepresentative;
import model.springmodel.ClassSubjectFaculty;
import model.springmodel.Coordinator;
import service.springservice.CoordinatorService;


@Controller
@RequestMapping("/admin")
public class AdminController {
	
	
	@GetMapping("/home")
	public String adminHome(Model theModel)
	{	
		
		return "adminhome";
	}
	
	@Autowired
	private CoordinatorService coordinatorService;
	
	@GetMapping("/addformCoordinators")
	public String addformCoordinators(Model theModel)
	{	
		Coordinator theCoordinator= new Coordinator();
		theModel.addAttribute("coordinator",theCoordinator);
		return "addcoordinators";
	}
	
	@PostMapping("/addCoordinators")
	public String addCoordinators(@ModelAttribute ("coordinator") Coordinator theCoordinator)
	{
		theCoordinator.setClassid();
		coordinatorService.addCoordinator(theCoordinator);
		
		return "adminhome";
	}
	
	
	
	@GetMapping("/showCoordinators")
	public String showCoordinators(Model theModel)
	{	
		List<Coordinator> theCoordinators= coordinatorService.getCoordinators();
		
		theModel.addAttribute("coordinators",theCoordinators);
		
		return "showcoordinators";
	}
	
	@GetMapping("/addCRForm")
	public String addCRForm(Model theModel )
	{	
		ClassRepresentative theCR = new ClassRepresentative();
		
		theModel.addAttribute("CR",theCR);
		return "addCR";
	}
	
	@PostMapping("/addCR")
	public String addCR(@ModelAttribute ("CR") ClassRepresentative theCR)
	{	
		theCR.setClassid();
		coordinatorService.addCR(theCR);
		return "adminhome";
	}
	
	@GetMapping("/showCR")
	public String showCR(Model theModel)
	{	
		List<ClassRepresentative> theCR= coordinatorService.showCR();
		
		theModel.addAttribute("CR",theCR);
		
		return "showCR";
	}
	
	@GetMapping("/addformFaculty")
	public String addformFaculty(Model theModel)
	{	
		ClassSubjectFaculty thefaculty= new ClassSubjectFaculty();
		theModel.addAttribute("faculty",thefaculty);
		return "addsubjectfaculty";
	}
	
	/*@PostMapping("/addFaulty")
	public String addCR(@ModelAttribute ("CR") ClassRepresentative theCR)
	{	
		theCRd.setClassid();
		coordinatorService.addCR(theCR);
		return "adminhome";
	}*/
	
	

}
