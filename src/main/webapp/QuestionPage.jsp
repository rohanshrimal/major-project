<%-- 
    Document   : QuestionPage
    Created on : 9 Apr, 2017, 1:10:06 PM
    Author     : rohan
--%>

<%@page import="model.AnswerModel"%>
<%@page import="model.AllAnswerModel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean scope="session" id="currQues" class="model.QuestionModel"/>

<% 
String flag;
flag=request.getParameter("flag");
%>
<%
AllAnswerModel aam=(AllAnswerModel)session.getAttribute("allAns");
AnswerModel am1=(AnswerModel)session.getAttribute("currAns");
int ansindex=0;
String utype=session.getAttribute("utype").toString();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Question Page</title>
        <script src="https://cdn.quilljs.com/1.2.3/quill.js"></script>
        <script src="https://cdn.quilljs.com/1.2.3/quill.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <link href="https://cdn.quilljs.com/1.1.3/quill.snow.css" rel="stylesheet">
        <link href="https://cdn.quilljs.com/1.1.3/quill.bubble.css" rel="stylesheet">
        
        <script>
            
            var index;
            var utype="<%=utype%>";
            
            
function setReportButton(x)
{
    var repClass=document.getElementsByClassName("report");
    if(utype==="faculty")
    {repClass[x].innerHTML="DELETE";}
}
            
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

function upvote(x)
{   
    index=x;
    var up=document.getElementsByClassName("up");
    var val=up[x].value;
    request=getXmlHttpRequestObject();
    request.onreadystatechange=showVoteCount;
    request.open("post","UpDown",true);
    request.setRequestHeader ("Content-Type", "application/x-www-form-urlencoded");
    
    var data="uvote="+val;
    request.send(data);
}

function downvote(x)
{   
    index=x;
    var down=document.getElementsByClassName("down");
    var val=down[x].value;
    request=getXmlHttpRequestObject();
    request.onreadystatechange=showVoteCount;
    request.open("post","UpDown",true);
    request.setRequestHeader ("Content-Type", "application/x-www-form-urlencoded");
    
    var data="uvote="+val;
    request.send(data);
}

function report(x)
{
    
    var rep=document.getElementsByClassName("report");
    var val=rep[x].value;
    var type;
    request=getXmlHttpRequestObject();
    request.onreadystatechange=showAlert;
    request.open("post","ReportAnswer",true);
    request.setRequestHeader ("Content-Type", "application/x-www-form-urlencoded");
    if(rep[x].innerHTML==="DELETE")
        type="faculty";
    
    else if(rep[x].innerHTML==="REPORT ABUSE")
        type="student";
    
    val=val+"&type="+type+"&index="+x;
    var data=val;
    request.send(data);
    
}

function showVoteCount()
{
    if(request.readyState===4 && request.status===200){
        var p=document.getElementsByClassName("votecount");
        p[index].innerHTML=request.responseText;
    }
}

function showAlert()
{
    if(request.readyState===4 && request.status===200){
       alert(request.responseText);
       location.reload();
    }
    
}
</script>


 

        
        
       
        
    </head>
    <body>
        <jsp:getProperty name="currQues" property="uname"/> asked on <jsp:getProperty name="currQues" property="quedate"/><br>
        Domain :--<jsp:getProperty name="currQues" property="dName"/><br>
        Tags   :--<jsp:getProperty name="currQues" property="tags"/>
        <h1><jsp:getProperty name="currQues" property="que"/></h1>
        <input type=button onclick="show()" id="ansbtn">
        <form style="display: none" id="answerarea">
            <!--<textarea cols="50" rows="10" name="answer" id="ans" placeholder="Write your answer here" ><%=am1.getText()%></textarea>-->
            <div id="toolbar"></div>
            <div id="editor"></div>
            <input type="button" name="submit" value="Post Answer" id="subAns"/>
        </form><hr>
        
 
<%
if(aam!=null)
        {int i=0;
        for(AnswerModel am: aam.getAllans())
        {
            if(am1.getUid().equals(am.getUid()))
            {
            ansindex=i;
            %>
            <script>
                document.getElementById("answerarea").setAttribute("action","PostAnswer?ansindex=<%=i%>");
            </script>
        <%
            }
            %> <%=am.getUname()+"  answered on  "+am.getAnsDate()%><br><br>
            <div class="toolbarans"></div>
            <div class="editorans"></div>
            <br><br>
            
            <button value="upvote&qid=<%=am.getQid()%>&uid=<%=am.getUid()%>" class="up" onclick="upvote(<%=i%>)"> UPVOTE </button>
            <span class="votecount"> <%=am.getUpvotes()%></span>
            <button value="downvote&qid=<%=am.getQid()%>&uid=<%=am.getUid()%>" class="down" onclick="downvote(<%=i%>)">DOWNVOTE </button>
            <button value="qid=<%=am.getQid()%>&uid=<%=am.getUid()%>" class="report" onclick="report(<%=i%>)"> REPORT ABUSE </button>
            <script>setReportButton(<%=i%>);</script>
            <hr> <%
            i++;
        }%>
        
        <%
        }
        %>
        
    
    
    <script>
            var toolbarOptions =[
                ['bold','italic','underline','strike'], 
                ['blockquote','code-block'],
                [{'header' : [1,2,3,4,5,6,false] }],
                [{'list': 'ordered'},{'list': 'bullet'}],
                [{'script': 'sub'},{'script': 'super'}],
                [{'indent': '-1'},{'indent': '+1'}],
                [{'direction': 'rtl'}],
                [{'size': ['small',false,'large','huge']}],
                ['link','image','video','formula'],
                [{'align': []}]
            ];
            
            var config = {
                "theme": "snow",
                "modules": {
                "toolbar": toolbarOptions
  },
                "placeholder": 'Write your answer here...'
};
            console.log(typeof toolbarOptions);
            var quill;
           quill=new Quill('#editor',config);
           
            
          //  var quill=new Quill('#editor',config);
            //quill.enable(false)
      
      var TT;
      
       $('#subAns').click(function(){
        
        window.delta=quill.getContents();
//        TT=JSON.stringify(delta);
//        console.log(delta);
//        var arg="PostAnswer?ansindex=<%=ansindex%>&json="+TT;
//        document.getElementById("answerarea").setAttribute("action",arg);
//        console.log(arg);
         $.ajax({
        url: "PostAnswer?ansindex=<%=ansindex%>&btnvalue="+document.getElementById("subAns").value,
        type: 'POST',
        dataType: 'json',
        data: JSON.stringify(delta),
        contentType: 'application/json',
        mimeType: 'application/json',
        success : function(data) {
            
            window.location="QuestionPage.jsp?flag=true";
            
        //quill.setContents({"ops": [{"insert": "\n"}]});
	}
        });

       });
           
        
        </script>
        
        
        
        <script>
        checkFlag();
        function checkFlag()
        {
            var flag= "<%=flag%>" ;
            if(flag==="true")
                document.getElementById("ansbtn").value="Edit Answer";
            else if(flag==="false")
                document.getElementById("ansbtn").value="Write Answer";
        }
        function show()
        {
         quill.setContents(<%=am1.getAnswer()%>);
         
           if(document.getElementById("answerarea").style.display==="none")
        {
           document.getElementById("answerarea").style.display="block";
           console.log(quill);
            if(document.getElementById("ansbtn").value==="Edit Answer")
            {
              document.getElementById("subAns").value="Update Answer";
            }
        }
        else if(document.getElementById("answerarea").style.display==="block")
        {
            
            document.getElementById("answerarea").style.display="none";
        }
        
}
    </script>
    
    <!--now for showing answers-->
    <script>
            
            var configForShow = {
                "theme": "snow",
                "modules": {
                "toolbar": false
  }
                
};
            var quillShow;
            function instantiateEditor(i)
            {
            quillShow=new Quill('#editor'+i,configForShow);
        }
        </script>
    

     <script>
        var toolbarElements = document.querySelectorAll('.toolbarans');
        var editorElements = document.querySelectorAll('.editorans');
        for (var i = 0; i < editorElements.length; i++)
        {
            toolbarElements[i].id = 'toolbar' + i;
            editorElements[i].id = 'editor' + i;
            
        }
        
        <%for(int i=0;i<aam.getAllans().size();i++){%>
        instantiateEditor(<%=i%>);
        quillShow.setContents(<%=aam.getAllans().get(i).getAnswer()%>);
        quillShow.enable(false);
        <%}%>
        </script>
    </body>
    
</html>
