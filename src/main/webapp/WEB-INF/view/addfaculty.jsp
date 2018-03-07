<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add faculty</title>
</head>
<body>
			<h2>Add Faculty</h2>
			<form:form action="addFaculty" modelAttribute="faculty" method="POST">
				
				
				<table>
				<tr>
					<td><label>ID</label></td>
					 <td><form:input path="id"/></td>
				</tr>
				
				<tr>
					<td><label>Branch</label></td>
					 <td><form:input path="branch"/></td>
				</tr>
				
				<tr>
					<td><label>Semester</label></td>
					 <td><form:input path="sem"/></td>
				</tr>
				
				<tr>
					<td><label>Section</label></td>
					 <td><form:input path="sec"/></td>
				</tr>
				
				<tr>
					<td><label>Batch</label></td>
					 <td><form:input path="batch"/></td>
				</tr>
				
				
				<tr>
					<td><label></label></td>
					<td><input type="submit" value="ADD" /></td>
					
				</tr>
			</table>
				
				
			</form:form>
			
		
	
</body>
</html>