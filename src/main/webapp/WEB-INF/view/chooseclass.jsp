<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Choose Class</title>
</head>
<body>
	<center>
	<h1>CLASS COORDINATOR</h1>
	<table>
	<c:forEach var="coordinator" items="${coordinatorClassList}">
		<tr>
			<td>--${coordinator.classid}--</td>
			<td>--${coordinator.branch}--</td>
			<td>--${coordinator.sem}--</td>
			<td>--${coordinator.sec}--</td>
			<td>--${coordinator.batch}--</td>
			<td><a href="classdiscussionfaculty?classId=${coordinator.classid}&year=${currentYear}">Go To Class</a></td>
		</tr>
	</c:forEach>
	</table>
	
	<h1>YOUR CLASSES</h1>
	<table>
		<tr>
			<th>CLASS-ID</th>
			<th>SUBJECT</th>
			<th>BRANCH</th>
			<th>SEMESTER</th>
			<th>SECTION</th>
			<th>BATCH</th>
			<th></th>
		</tr>
	<c:forEach var="subjectClass" items="${subjectClassList}">
		<tr>
			<td>--${subjectClass.classid}--</td>
			<td>--${subjectClass.subject.subject}--</td>
			<td>--${subjectClass.branch}--</td>
			<td>--${subjectClass.sem}--</td>
			<td>--${subjectClass.sec}--</td>
			<td>--${subjectClass.batch}--</td>
			<td><a href="classdiscussionfaculty?classId=${subjectClass.classid}&year=${currentYear}">Go To Class</a></td>
		</tr>
	</c:forEach>
	</table>
	<hr>
	<a href="CDFhomefaculty?year=${currentYear-1}">Previous Year</a> <<<<<<<< ${currentYear} >>>>>>> <a href="CDFhomefaculty?year=${currentYear+1}">Next Year</a>
	<hr>
	</center>
</body>
</html>