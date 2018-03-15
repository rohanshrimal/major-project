package service.springservice;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.springdao.ClassDAO;
import model.FacultyModel;
import model.StudentModel;
import model.pollmodel.CreateNewPollModel;
import model.springmodel.Events;
import model.springmodel.ClassDiscussion;
import model.springmodel.ClassPosts;

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
	public List<CreateNewPollModel> showPoll(String classid) {
		
		return classdao.showPoll(classid);
		
	}

	@Override
	@Transactional
	public Boolean checkCoordinator(String fid) {
		return classdao.checkCoordinator(fid);
	}

	@Override
	@Transactional
	public int addDiscussion(ClassDiscussion cd) {
		return classdao.addDiscussion(cd);
		
	}

	@Override
	@Transactional
	public void addClassPost(ClassPosts cp) {
		classdao.addClassPost(cp);
		
	}

	@Override
	@Transactional
	public List<ClassDiscussion> showDiscussions(String classId) {
		return classdao.showDiscussions(classId);
	}

	
	@Override
	@Transactional
	public Set<String> getClassDetails(String fid) {
		
		return classdao.getClassDetails(fid);
		 
	}

	@Override
	@Transactional
	public List<Events> showEvents(String classid) {
		return classdao.showEvents(classid);
	}
	
	
	
	}

