package notifier;

import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonWriter;
import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mchange.v2.c3p0.impl.NewPooledConnection;

import model.NotificationModel;
import model.UserModel;

@ServerEndpoint(value="/ServerEndPoint",configurator = GetHttpSessionConfigurator.class)
public class ServerEndPoint {

	private HttpSession session;
	
	static List<SessionId> users=new ArrayList<SessionId>();
	
	@OnOpen
	public void handleOpen(Session userSession, EndpointConfig config)
	{
		System.out.println("here i am");
		this.session = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
		{
			userSession.getUserProperties().put("userModel",session.getAttribute("userModel"));
			
			SessionId sid=new SessionId();
			sid.setSession(userSession);
			sid.setUserId(new UserModel().getUserId(session.getAttribute("userModel")));
			
			users.add(sid);
			System.out.println(sid.getSession());
			System.out.println("added.."+sid.getUserId());
		}
		System.out.println(users.size());
	}
	
	@OnClose
	public void handleClose(Session userSession)
	{
		SessionId sid=new SessionId();
		sid.setSession(userSession);
		sid.setUserId(new UserModel().getUserId(userSession.getUserProperties().get("userModel")));
		
		System.out.println(sid.getSession());
		System.out.println("Removed...");
		int index=-1,removeIndex=-1;
		for(SessionId s:users)
		{
			index++;
			if(s.getSession().equals(userSession))
			{
				removeIndex=index;
				break;
			}
		}
		users.remove(removeIndex);
		System.out.println(users.size());
	}
	
	
	@OnMessage
	public void handleMessage(String message, Session userSession)
	{   
	    Gson gson=new Gson();
	    List<NotificationModel> alnm= gson.fromJson(message, new TypeToken<List<NotificationModel>>(){}.getType());
	   
	    for(NotificationModel nm:alnm)
	    {
	    	List<Integer> allIndexes =
	    	        IntStream.range(0, users.size()).boxed()
	    	                .filter(i -> users.get(i).equals(new SessionId(null,nm.getUid())))
	    	                .collect(Collectors.toList());
	    	
	    	System.out.println(allIndexes);
	    	if(allIndexes!=null && allIndexes.size()>=0)
	    	{
	    		for(int index :allIndexes)
	    		{
	    			try {
	    				SessionId sid=users.get(index);
	    				Session u=sid.getSession();
	    				u.getBasicRemote().sendText(buildJsonData(nm));
	    			} catch (IOException e) {
					
					e.printStackTrace();
	    			}
	    		}
	    	}
	    }
	}
	
	private String buildJsonData(NotificationModel nm)
	{
		Gson gsonObj = new Gson();
        String returnJSON=gsonObj.toJson(nm);
        return returnJSON;
	}
	
}

class SessionId
{
	private Session session;
	private String userId;
	
	public SessionId()
	{
		
	}
	
	public SessionId(Session session,String userId)
	{
		this.session=session;
		this.userId=userId;
	}
	
	public Session getSession() {
		return session;
	}
	public void setSession(Session session) {
		this.session = session;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Override
	public boolean equals(Object obj) 
	{
		if(obj instanceof SessionId)
		{
			SessionId sessionId=(SessionId)obj;
			if(sessionId.getUserId().equalsIgnoreCase(this.getUserId()))
				return true;
			else
				return false;
		}
		else
			return false;
	}

	
	
	
}
