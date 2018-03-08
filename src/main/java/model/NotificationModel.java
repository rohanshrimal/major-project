package model;

public class NotificationModel {

	private int nid;
	private String message;
	private String uid;
	private boolean isViewed;
	private long timestamp;
	
	public long getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
	}
	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public boolean isViewed() {
		return isViewed;
	}
	public void setViewed(boolean isViewed) {
		this.isViewed = isViewed;
	}
	
	
	
}
