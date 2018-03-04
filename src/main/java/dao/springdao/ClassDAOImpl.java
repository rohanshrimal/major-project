package dao.springdao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import model.FacultyModel;
import model.StudentModel;
import model.springmodel.ClassPosts;

@Repository
public class ClassDAOImpl implements ClassDAO {
	
	@Autowired
	private SessionFactory sessionFactory ;
	
	@Override
	public List<StudentModel> showClassMembers(StudentModel sm) 
	{
		System.out.println(sm.toString());
		Session currentSession= sessionFactory.getCurrentSession();
		/*Query<StudentModel> qr= currentSession.createQuery("from StudentModel  where branch='"+sm.getBranch()+
				"' AND semester='"+sm.getSemester()+
				"' AND section='"+sm.getSection()+
				"'",StudentModel.class);*/
		Query<StudentModel> qr= currentSession.createQuery("from StudentModel where branch =:branch AND  semester =:semester"
				+ " AND section =:section",StudentModel.class);
		
		qr.setParameter("branch", sm.getBranch());
		qr.setParameter("semester", sm.getSemester());
		qr.setParameter("section", sm.getSection());
		
		 List<StudentModel> classmembers =qr.getResultList();
		 
		 System.out.println("class members->"+classmembers.toString());
			
		return classmembers;
	}

	@Override
	public List<StudentModel> showClassCR(StudentModel sm) {
		
		Session currentSession= sessionFactory.getCurrentSession();
		String id=sm.getBranch()+"-"+sm.getSemester()+"-"+sm.getSection()+"-"+sm.getBatch();
		
		Query<StudentModel> qr2= currentSession.createQuery("from StudentModel  where id IN("+
		"select id from ClassRepresentative where classid =:classid"+")",StudentModel.class);
		
		qr2.setParameter("classid", id);
		 List<StudentModel> classCR =qr2.getResultList();
		 
		 System.out.println("CR->"+classCR.toString());
		 return classCR;
	}

	@Override
	public List<FacultyModel> showClassCoordinator(StudentModel sm) {
		
		Session currentSession= sessionFactory.getCurrentSession();
		String id=sm.getBranch()+"-"+sm.getSemester()+"-"+sm.getSection()+"-"+sm.getBatch();
		Query<FacultyModel> qr2= currentSession.createQuery("from FacultyModel  where id IN("+
				"select id from Coordinator where classid =:classid"+")",FacultyModel.class);
		qr2.setParameter("classid", id);
		
		 List<FacultyModel> classCoordinator =qr2.getResultList();
		 
		 System.out.println("class coordinator=>"+classCoordinator.toString());
		 return classCoordinator;
		
		
		
	}

	@Override
	public void addPoll(ClassPosts theclassposts) 
	{
		
		Session currentSession=sessionFactory.getCurrentSession();
		System.out.println(theclassposts.toString());
		currentSession.save(theclassposts);
		
		
	}
		 
				 
		 
				 
		

	}


