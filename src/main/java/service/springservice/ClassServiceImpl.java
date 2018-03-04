package service.springservice;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import dao.springdao.ClassDAO;
import model.FacultyModel;
import model.StudentModel;
import model.springmodel.ClassPosts;
import model.springmodel.ClassRepresentative;

@Service
public class ClassServiceImpl implements ClassService {
	
	@Autowired
	private ClassDAO classdao;
	
	@Override
	@Transactional
	public List<StudentModel> showClassMembers(StudentModel sm) {
		return classdao.showClassMembers(sm);
		
	}

	@Override
	@Transactional
	public List<StudentModel> showClassCR(StudentModel sm) {
		return classdao.showClassCR(sm);
	}

	@Override
	@Transactional
	public List<FacultyModel> showClassCoordinator(StudentModel sm) {
		
		return classdao.showClassCoordinator(sm);
	}


	@Override
	@Transactional
	public void addPoll(ClassPosts theclassposts) {
		
		classdao.addPoll(theclassposts);
	}

	
	}

