package dao.springdao;

import java.util.List;

import org.springframework.ui.Model;

import model.FacultyModel;
import model.StudentModel;
import model.springmodel.ClassPosts;

public interface ClassDAO {

	List<StudentModel> showClassMembers(StudentModel sm);

	List<StudentModel> showClassCR(StudentModel sm);

	List<FacultyModel> showClassCoordinator(StudentModel sm);

	void addPoll(ClassPosts theClassPosts);

}
