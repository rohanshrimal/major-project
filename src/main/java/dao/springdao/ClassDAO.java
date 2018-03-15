package dao.springdao;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import model.FacultyModel;
import model.StudentModel;
import model.pollmodel.CreateNewPollModel;
import model.springmodel.Events;
import model.springmodel.ClassDiscussion;
import model.springmodel.ClassPosts;

public interface ClassDAO {

	List<StudentModel> showClassMembers(StudentModel sm);

	List<StudentModel> showClassCR(StudentModel sm);

	List<FacultyModel> showClassCoordinator(StudentModel sm);

	List<CreateNewPollModel> showPoll(String classid);

	Boolean checkCoordinator(String fid);

	int addDiscussion(ClassDiscussion cd);

	void addClassPost(ClassPosts cp);

	List<ClassDiscussion> showDiscussions(String classId);

	
	Set<String> getClassDetails(String fid);

	List<Events> showEvents(String classid);

	
}
