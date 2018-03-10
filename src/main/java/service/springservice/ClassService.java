package service.springservice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import model.FacultyModel;
import model.StudentModel;
import model.pollmodel.CreateNewPollModel;
import model.springmodel.Events;
import model.springmodel.ClassDiscussion;
import model.springmodel.ClassDiscussionComment;
import model.springmodel.ClassPosts;
import model.springmodel.ClassRepresentative;

public interface ClassService {

	List<StudentModel> showClassMembers(StudentModel sm);

	List<StudentModel> showClassCR(StudentModel sm);

	List<FacultyModel> showClassCoordinator(StudentModel sm);

	List<CreateNewPollModel> showPoll(String classid);

	Boolean checkCoordinator(String fid);

	int addDiscussion(ClassDiscussion cd);

	void addClassPost(ClassPosts cp);

	List<ClassDiscussion> showDiscussions(String classId);

	void postComment(ClassDiscussionComment cdc);

	
}
