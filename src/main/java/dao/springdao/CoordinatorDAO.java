package dao.springdao;

import java.util.List;

import model.springmodel.ClassRepresentative;
import model.springmodel.Coordinator;

public interface CoordinatorDAO {

	void addCoordinator(Coordinator theCoordinator);

	List<Coordinator> getCoordinators();

	void addCR(ClassRepresentative theCR);

	List<ClassRepresentative> showCR();

	 

}
