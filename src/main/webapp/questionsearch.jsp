<%-- 
    Document   : questionsearch
    Created on : 17 Mar, 2017, 5:19:40 PM
    Author     : rohan
--%>

<%@page import="model.QuestionModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.RelatedQuestionModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%RelatedQuestionModel rqm=(RelatedQuestionModel)session.getAttribute("relques");
ArrayList<QuestionModel>alqm=null;

if(rqm!=null)
alqm=rqm.getRelatedque();

String utype=session.getAttribute("utype").toString();
%>
<!DOCTYPE html>
<html>
    
    <head>
 
    <style>
    
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 80%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0} 
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}
</style>
        
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ask question here...</title>
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/autocompleter.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
        
        
        <script>
    var utype="<%=utype%>";
    
    function setReportButton(x)
{
    var repClass=document.getElementsByClassName("reportque");
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
    
    function reportque(x)
    {
    
    var rep=document.getElementsByClassName("reportque");
    var val=rep[x].value;
    var type;
    request=getXmlHttpRequestObject();
    request.onreadystatechange=showAlert;
    request.open("post","ReportQuestion",true);
    request.setRequestHeader ("Content-Type", "application/x-www-form-urlencoded");
    if(rep[x].innerHTML==="DELETE")
        type="faculty";
    
    else if(rep[x].innerHTML==="REPORT ABUSE")
        type="student";
    
    val=val+"&type="+type+"&index="+x;
    var data=val;
    request.send(data);
    
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

        <a href="MyFeed">feed</a>
        
         <h1>SEARCH</h1> 
        <form action="AskQuestion">
        <input type="text" id="search" name="search" style="width: 40%" class="search" placeholder="SEARCH YOUR QUESTION HERE.."/>
        <input type="submit" value="Search" />
        </form>
        <br>
        <button id="myBtn">Ask Question</button>
        <br><br>
        <%if(rqm!=null && alqm!=null){%>
        <h1>RELATED QUESTIONS ARE</h1><br><br>
        <%int i=0; 
        for(QuestionModel q : alqm){%>
        <%=q.getUname()+" asked on "+q.getQuedate() %> <br>
        <a href="AllAnswer?id=<%=i%>"><%=q.getQue()%></a><button value="qid=<%=q.getQid()%>" class="reportque" onclick="reportque(<%=i%>)">REPORT ABUSE</button><br>
        <script>setReportButton(<%=i%>);</script>
        DOMAIN :<%=q.getdName()%><br>
        Tags   :
        <%for(String tag:q.getTags())
            out.println(tag+" ");%>
            <br><%= "ANSWER:  "+q.getMostUpvotedAnswer()%><a href="AllAnswer?id=<%=i%>">Read More</a>
           <hr>
        <%
          i++;
        }
        }%>
        <!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2>WRITE YOUR QUESTION</h2>
    </div>
    <div class="modal-body">
        <form action="PostQuestion" method="get">
            
            CHOOSE THE QUESTION DOMAIN <select name="domain" ><option value="1">Computer Science</option>
                                                                      <option value="2">Mechanical</option>
                                                                      <option value="3">Information Technology</option>
                                                                      <option value="4">Electrical</option>
                                                                      <option value="5">Electronics</option>
                                                                      </select>
            <br><br>
            <textarea rows="5" cols="50" name="askedquestion" placeholder="Write your question here..." ></textarea><br><br>
            
            <input type="text" name="tags" placeholder="Add Your Relevant Tags" id="tags" style="width: 40%"/><br><br>
       <input type="submit" value="Post Question"/>
        </form>
    </div>
      
    
  </div>

</div>
 
<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>




    </body>
</html>
