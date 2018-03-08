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
<h2>students</h2>

<table>
	<th>
	Class Members
	</th>
		
		
		<c:forEach var="temp1" items="${classmembers}" > 
			<tr>
				<td> ${temp1.name} </td>
				
			</tr>
		
		</c:forEach>
	
	<th>
	Class Representative
	</th>
	<c:forEach var="temp2" items="${CR}"> 
			<tr>
				<td> ${temp2.name} </td>
				
			</tr>
		
		</c:forEach>
	<th>
	Class Coordinator
	</th>
	<c:forEach var="temp3" items="${classCoordinator}" > 
			<tr>
				<td> ${temp3.name} </td>
				
			</tr>
		
		</c:forEach>
</table>

<a href="/korero-maven/poll/createpoll.jsp?var=classpoll"><button>Create Poll</button></a>
<button>Ask question</button>
<a href=addEventForm><button>Create Event</button></a>
<button>Create Post</button>
<br><br><br>
	<select name="SHOW" onchange="location = this.value;">
    	<option selected disabled>Show</option>
	 	<option value="showPoll">Polls</option>
	 	<option value="">Questions</option>
	 	<option value="">Answers</option>
	 	<option value="">Events</option>
	</select>

</body>
</html>