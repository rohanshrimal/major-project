<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Choose Class</title>
</head>
<body>

	<form:form action="classdiscussionfaculty" modelAttribute="classsubjectfaculty" method="POST" >
		
		<c:forEach var="temp" items="${classList}"> 
		
		<form:radiobutton path="classid" value="${temp.classid}"/> <b>Branch:</b> ${temp.branch} <b>Sem :</b>  ${temp.sem} <b>Sec:</b> ${temp.sec} <b>Batch :</b> ${temp.batch}<br>
		
		
		
		</c:forEach>
		
		<input type="submit" value="Submit" />
  </form:form>
</body>
</html>