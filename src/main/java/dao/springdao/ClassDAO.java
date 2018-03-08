package dao.springdao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import model.FacultyModel;
import model.StudentModel;
import model.pollmodel.CreateNewPollModel;
import model.springmodel.Events;
import model.springmodel.ClassPosts;

public interface ClassDAO {

	List<StudentModel> showClassMembers(StudentModel sm);

	List<StudentModel> showClassCR(StudentModel sm);

	List<FacultyModel> showClassCoordinator(StudentModel sm);

	void addPoll(ClassPosts theClassPosts);

	List<CreateNewPollModel> showPoll(String classid);

	void addEvent(ClassPosts theclasspost);

	Boolean checkCoordinator(String fid);

	
}
