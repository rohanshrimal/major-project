<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Class Discussion Forum </title>
</head>
<body>
	<table>
		<tr>
			<th>ID</th>
			<th>NAME</th>
			<th> Class ID </th>				
		</tr>			
		
		<c:forEach var="temp" items="${CR}"> 
		<tr>
			<td> ${temp.userModel.uid} </td>
			<td>${temp.userModel.uname}</td>
			<td> ${temp.classid} </td> 	
			</tr>
		</c:forEach>		
	</table>	
</body>
</html>