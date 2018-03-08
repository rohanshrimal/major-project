package dao.springdao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.springmodel.Events;

@Repository
public class EventDAOImpl implements EventDAO {
	
	@Autowired
	private SessionFactory sessionFactory ;
	

	@Override
	public int addEvent(Events theEvents) {
		
		Session currentSession= sessionFactory.getCurrentSession();
		int id= (Integer)currentSession.save(theEvents);
		System.out.println("final event--"+theEvents.toString());
		return id;

	}

}
