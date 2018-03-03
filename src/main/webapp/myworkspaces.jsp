<%-- 
    Document   : myworkspaces
    Created on : 25 Apr, 2017, 6:33:54 AM
    Author     : rohan
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.DomainModel"%>
<%
DomainModel dm=(DomainModel)session.getAttribute("MyWorkSpaces");
ArrayList<String> myWorkSpaces=dm.getDomainList();
ArrayList<Integer> myWorkSpacesId=dm.getDomainIdList();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My WorkSpaces</title>
    </head>
    <body>
        <h1>Your WorkSpaces are...</h1>
        <%
        if(myWorkSpaces!=null && myWorkSpacesId!=null)
        {
        int i=0;
        for(String ws:myWorkSpaces){%>
        <a href="WorkSpaceContent?did=<%=myWorkSpacesId.get(i)%>&dname=<%=ws%>"><%=ws%></a><br><br>
        <%
        i++;
        }
        }%>
    </body>
</html>
