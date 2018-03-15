<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>add Event</title>
</head>
<body>



	<form:form action="addEvent" modelAttribute="Events" method="POST" onsubmit=" return setlongdates()">
			
			<table>
				<tr>
					<td><label>Title</label></td>
					 <td><form:input path="title"/></td>
				</tr>
				
				<tr>
					<td><label>Description</label></td>
					 <td><form:textarea  path="description"/></td>
				</tr>
				
				<tr>
					<td><label>Start Date</label></td>
					 <td><input type="datetime-local"  id="start"/></td>
					 <form:hidden id="startLong" path="startdate"/>
				</tr>
				
				<tr>
					<td><label>End Date</label></td>
					 <td><input type="datetime-local"  id="end"/></td>
					 <form:hidden id="endLong" path="enddate"/>
				</tr>
				
				
				<tr>
					<td><label></label></td>
					<td><input type="submit" value="ADD" /></td>
					
				</tr>
			</table>
			
			<a href="#" onclick="show()">show</a>
				
  
  	</form:form>
  	
  	<script type="text/javascript">
  		function setlongdates()
  		{
  		
  		
  		
  		document.getElementById("startLong").value=new Date(document.getElementById("start").value).getTime();
  		document.getElementById("endLong").value=new Date(document.getElementById("end").value).getTime();
  		};
  	</script>

</body>
</html>