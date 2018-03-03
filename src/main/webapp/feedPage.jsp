<%-- 
    Document   : feedPage
    Created on : 22 Apr, 2017, 3:43:29 PM
    Author     : rohan
--%>
<%@page import="model.QuestionModel"%>
<%@page import="model.RelatedQuestionModel"%>
<%
RelatedQuestionModel rlqm=(RelatedQuestionModel)session.getAttribute("relques");
RelatedQuestionModel rlqm1=(RelatedQuestionModel)session.getAttribute("relques1");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>WELCOME..</h1>
        <a href="MyQuestions">My Questions</a>&nbsp;&nbsp;
        <a href="MyAnswers">My Answers</a>&nbsp;&nbsp;
        <a href="MyBlogs">My Blogs</a>&nbsp;&nbsp;
        <a href="QuestionSearchProcessor">SEARCH</a>&nbsp;&nbsp;
        <a href="MyWorkSpaces">My WorkSpaces</a>&nbsp;&nbsp;
        <a href="MyProfile">My Profile</a>
        <br>
        <h2>Feed For You</h2>
        <%
        if(rlqm!=null){int i=0;
        for(QuestionModel qm: rlqm.getRelatedque())
        {
        %>
        <a href="AllAnswer?id=<%=i%>"><%= qm.getQue() %></a>
        <br>
        <%
        i++;}
        }
        %>
        <br><hr><br>
        <h2>Question For You</h2>
         <%
        if(rlqm1!=null){int i=0;
        for(QuestionModel qm: rlqm1.getRelatedque())
        {
        %>
        <a href="AllAnswer?id=<%=i%>"><%= qm.getQue() %></a>
        <br>
        <%
        i++;}
        }
        %>
    </body>
</html>
