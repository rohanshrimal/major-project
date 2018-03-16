package service.springservice;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.springdao.CoordinatorDAO;
import model.springmodel.ClassRepresentative;
import model.springmodel.ClassSubjectFaculty;
import model.springmodel.Coordinator;

@Service
public class CoordinatorServiceImpl implements CoordinatorService {
	
	@Autowired
	private CoordinatorDAO coordinatorDAO;
	
	@Override
	@Transactional
	public void addCoordinator(Coordinator theCoordinator) 
	{	System.out.println("in coordinatorservice impl");
		System.out.println(theCoordinator.toString());
		coordinatorDAO.addCoordinator(theCoordinator);
	}

	@Override
	@Transactional
	public List<Coordinator> getCoordinators() {
			
	return coordinatorDAO.getCoordinators();
	}

	@Override
	@Transactional
	public void addCR(ClassRepresentative theCR) {
		coordinatorDAO.addCR(theCR);
	}

	@Override
	@Transactional
	public List<ClassRepresentative> showCR() {

		return coordinatorDAO.showCR();
	}

	@Override
	@Transactional
	public void addFaculty(ClassSubjectFaculty theFaculty) {
		
		coordinatorDAO.addFaculty(theFaculty);
	}

	@Override
	@Transactional
	public List<ClassSubjectFaculty> showFaculty(String classid) {
		return coordinatorDAO.showFaculty(classid);
	}

}
