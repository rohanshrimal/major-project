package service.springservice;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.springdao.EventDAO;
import model.springmodel.Events;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	private EventDAO eventDAO;
	
	
	
	@Override
	@Transactional
	public int addEvent(Events theEvents) {
		
		return eventDAO.addEvent(theEvents);
	}

}
