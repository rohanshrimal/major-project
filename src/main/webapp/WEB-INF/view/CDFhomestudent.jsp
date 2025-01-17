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
<select name="Session" onchange="location = this.value;">
    	<option selected disabled>Semester</option>
    	<c:forEach varStatus="sem" begin="1" end="${currentsem}">
    	
	 	<option value="showSession?sem=${sem.index}">${sem.index}</option> 
	  	
	 	 </c:forEach>
	</select>
	
<a href="../../MyFeed">MY FEED</a>
<hr>
<h3>CHOOSE YOUR POST TYPE...</h3>
<a href="../../poll/createpoll.jsp?var=classpoll"><button id="create_poll">Create Poll</button></a>
<a href="../../Post_Question.jsp?classQue=true"><button id="create_que">Ask question</button></a>
<a href="addEventForm"><button id="create_event">Create Event</button></a>
<a href="startClassDiscussion"><button id="create_disc">Start Discussion</button></a>

	<select name="SHOW" onchange="location = this.value;">
    	<option selected disabled>Show</option>
	 	<option value="showPoll">Polls</option>
	 	<option value="showClassQuestions">Questions</option>
	 	<option value="showDiscussions">Discussions</option>
	 	<option value="showEvents">Events</option>
	</select>
	<hr>
	<h3>Class Members</h3>
		<c:forEach var="temp1" items="${classmembers}" > 
			${temp1.name} &nbsp;
		</c:forEach>
	<hr>
	<h3>Class Representative</h3>
		<c:forEach var="temp2" items="${CR}"> 
			 ${temp2.userModel.uname} &nbsp;
		</c:forEach>
	<hr>
	<h3>Class Coordinator</h3>
		<c:forEach var="temp3" items="${classCoordinator}" > 
			${temp3.name} &nbsp;		
		</c:forEach>
	<hr>
    <script>
    	if('${selectedsem}'!='${currentsem}')
    	{
    		document.getElementById("create_que").disabled = true;
    		document.getElementById("create_event").disabled = true;
    		document.getElementById("create_poll").disabled = true;
    		document.getElementById("create_disc").disabled = true;
    	}
    </script>

</body>
</html>