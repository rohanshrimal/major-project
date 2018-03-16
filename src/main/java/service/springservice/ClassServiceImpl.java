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
import model.springmodel.PollQueDetails;
import model.springmodel.ClassDiscussion;
import model.springmodel.ClassDiscussionComment;
import model.springmodel.ClassPosts;
import model.springmodel.ClassSubjectFaculty;

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
	public List<PollQueDetails> showPoll(String classid) {
		
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
	public Set<String> getClassDetails(String fid,boolean isCurrent) {
		
		return classdao.getClassDetails(fid,isCurrent);
		 
	}
	
	@Override
	@Transactional
	public List<ClassSubjectFaculty> getSubjectClassDetails(String fid, boolean isCurrent) {
		return classdao.getSubjectClassDetails(fid,isCurrent);
	}


	@Override
	@Transactional
	public List<String> getCoordiatorDetails(String fid, boolean isCurrent) {
		return classdao.getCoordinatorDetails(fid,isCurrent);
	}

	@Override
	@Transactional
	public List<Events> showEvents(String classid) {
		return classdao.showEvents(classid);
  }
	@Override
	@Transactional
	public void postComment(ClassDiscussionComment cdc) {
		classdao.postComment(cdc);		
	}

	
	}

