<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Class Discussion forum</title>
</head>
<body>
      <c:choose>
       <c:when test="${type=='coordinator'}">
	<a href="/korero-maven/major/admin/addCRForm">add class representative</a> <br>
	<a href="/korero-maven/major/admin/showCR">show class representative</a> <br>
		</c:when>
		
		<c:when test="${type=='faculty'}">
		faculty
		</c:when>
	</c:choose>
	
	
	

</body>
</html>