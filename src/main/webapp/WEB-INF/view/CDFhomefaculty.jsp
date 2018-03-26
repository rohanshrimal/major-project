<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Class Discussion forum</title>
</head>
<body>

<h1>Welcome to Class ${classid}</h1>
	<c:choose>
		<c:when test="${type=='coordinator' && isCurrentYear==true}">
			<a href="../admin/addCRForm">Add Class Representative</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="../admin/showCR">Show Class Representative</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<a href="../admin/addformFaculty">Add Subject Faculty</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<a href="../admin/showFaculty">Show Subject Faculty</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</c:when>
		
		<c:when test="${type=='coordinator' && isCurrentYear==false}">
			Hello Ex Coordinator
			<a href="../admin/showCR">Show Class Representative</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="../admin/showFaculty">Show Subject Faculty</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</c:when>
		
		<c:when test="${type=='faculty'}">
		faculty
		</c:when>
	</c:choose>
</body>
</html>