<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Discussion Forum</title>
</head>
<body>
<h1>CLASS DISCUSSION FORUM</h1>
<hr>
<h3>CHOOSE YOUR POST TYPE...</h3>
<a href="/korero-maven/poll/createpoll.jsp?var=classpoll"><button>Create Poll</button></a>
<button>Ask question</button>
<a href="addEventForm"><button>Create Event</button></a>
<a href="startDiscussion"><button>Start Discussion</button></a>

	<select name="SHOW" onchange="location = this.value;">
    	<option selected disabled>Show</option>
	 	<option value="showPoll">Polls</option>
	 	<option value="">Questions</option>
	 	<option value="showDiscussions">Discussions</option>
	 	<option value="">Events</option>
	</select>
	<hr>
	<h3>Class Members</h3>
		<c:forEach var="temp1" items="${classmembers}" > 
			${temp1.name} &nbsp;
		</c:forEach>
	<hr>
	<h3>Class Representative</h3>
		<c:forEach var="temp2" items="${CR}"> 
			 ${temp2.name} &nbsp;
		</c:forEach>
	<hr>
	<h3>Class Coordinator</h3>
		<c:forEach var="temp3" items="${classCoordinator}" > 
			${temp3.name} &nbsp;		
		</c:forEach>
	<hr>
    

</body>
</html>