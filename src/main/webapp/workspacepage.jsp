<%-- 
    Document   : workspacepage
    Created on : 26 Apr, 2017, 4:30:04 PM
    Author     : rohan
--%>
<%@page import="model.QuestionModel"%>
<%@page import="model.DomainContentModel"%>
<%DomainContentModel dcm=(DomainContentModel)session.getAttribute("workspacecontent");
String id=request.getParameter("id");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
 function getXmlHttpRequestObject()
{
var xmlHttpReq;

if(window.XMLHttpRequest){
    request=new window.XMLHttpRequest();
}
else if(window.ActiveXObject){
    request=new window.ActiveXObject();
}
else{
    request=null;
}
return request;
}

function follow(x)
{   
    var followstatus=document.getElementById("followbtn").value;
    console.log(followstatus);
    request=getXmlHttpRequestObject();
    
    request.onreadystatechange=setFollowButton;
    request.open("post","FollowUnfollow",true);
    request.setRequestHeader ("Content-Type", "application/x-www-form-urlencoded");
    var data="did="+x+"&isfollow="+followstatus;
    request.send(data);
}

function setFollowButton()
{
    if(request.readyState===4 && request.status===200){
        document.getElementById("followbtn").value=request.responseText;
        if(request.responseText.search("FOLLOWED")!==-1)
        {
        <% dcm.setFollowersCount(dcm.getFollowersCount()+1); %>
        var count=document.getElementById("followers").innerHTML;
        console.log(count);
        document.getElementById("followers").innerHTML=parseInt(count)+1;
        }
        else if((request.responseText).search("FOLLOW")!==-1)
        {
        <% dcm.setFollowersCount(dcm.getFollowersCount()-1); %>;           
        var count=document.getElementById("followers").innerHTML;
        console.log(count);
        document.getElementById("followers").innerHTML=parseInt(count)-1;
        }
         
    }
}

        </script>
    </head>
    <body>
       
       
        <h1> <%=dcm.getDname()%> </h1><input type="button" id="followbtn" onclick="follow(<%=dcm.getDid()%>)"><br>
        
        FOLLOWERS       <span id="followers"><%= dcm.getFollowersCount() %></span><br>
        TAGS            <%= dcm.getTagCount() %><br>
        TOP-USERS       <%for(String users : dcm.getTopUsers()) {%>
                        <%=users+"   "%>
                        <%}%><br>
        TRENDING TAGS   <%for(String tags : dcm.getTrendingTags() ){%>
                        <%=tags+"   "%>
                        <%}%><br>
                        QUESTIONS       <%=dcm.getQuestionsCount() %><br>
        
        <hr>
        <%for(QuestionModel q : dcm.getAlqm()){%>
        <%=q.getUname()+" asked on "+q.getQuedate() %> <br>
        <a href=""><%=q.getQue()%></a><br>
        Tags   :
        <%for(String tag:q.getTags())
            out.println(tag+" ");%>
            <br><%if(q.getMostUpvotedAnswer()!=null && q.getMostUpvotedAnswer().length()>=150){%><%= "ANSWER:  "+q.getMostUpvotedAnswer().substring(0,149)+"..."%><a>Read More</a><%
            }
            else if(q.getMostUpvotedAnswer()!=null){%><%= "ANSWER:  "+q.getMostUpvotedAnswer().substring(0,q.getMostUpvotedAnswer().length())%><%}%><hr>
        <%
        }
        
        %>
        
        
         <script>
             
             
            var isFollowed=<%= dcm.isIsFollowed() %>;
            if(isFollowed===true)
                document.getElementById("followbtn").value="FOLLOWED";
            else if(isFollowed===false)
                document.getElementById("followbtn").value="FOLLOW";
            
            console.log("initial---->"+isFollowed);
        </script>
    </body>
</html>
