<%-- 
    Document   : QuePage
    Created on : May 1, 2017, 2:45:06 AM
    Author     : rohan
--%>

<%@page import="model.StudentModel"%>
<%@page import="model.FacultyModel"%>
<%@page import="model.RelatedQuestionModel"%>
<%@page import="model.AllAnswerModel"%>
<%@page import="model.AnswerModel"%>
<%@page import="model.QuestionModel"%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
String flag,cat;
int index;
flag=request.getParameter("flag");
%>
<%
AllAnswerModel aam=(AllAnswerModel)session.getAttribute("allAns");
AnswerModel am1=(AnswerModel)session.getAttribute("currAns");
int ansindex=0;
String utype=session.getAttribute("utype").toString();
QuestionModel qm=(QuestionModel)session.getAttribute("currQues");
RelatedQuestionModel rqm1=(RelatedQuestionModel)session.getAttribute("RelatedQuestions");

 

%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/png" href="MDB Free/img/img1.png" />
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/autocompleter.js"></script>
    <link rel="stylesheet" href="js/jquery-ui.css">
    
    <script src="https://cdn.quilljs.com/1.2.3/quill.js"></script>
    <script src="https://cdn.quilljs.com/1.2.3/quill.min.js"></script>
<!--    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>-->
    <link href="https://cdn.quilljs.com/1.1.3/quill.snow.css" rel="stylesheet">
    <link href="https://cdn.quilljs.com/1.1.3/quill.bubble.css" rel="stylesheet">
     <link rel="icon" type="image/png" href="../images/logo.png" /> 
    <title>Korero</title>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="MDB Free/font-awesome-4.7.0/css/font-awesome.min.css">

    <!-- Bootstrap core CSS -->
    <link href="MDB Free/css/bootstrap.min.css" rel="stylesheet">

    <!-- Material Design Bootstrap -->
    <link href="MDB Free/css/mdb.min.css" rel="stylesheet">
    
    <link href="MDB Free/css/quepage.css" rel="stylesheet">

    <!-- Template styles -->
    <style rel="stylesheet">
        /* TEMPLATE STYLES */
        
        main {
            padding-top: 25px;
            padding-bottom: 2rem;
        }
        
        .widget-wrapper {
            padding-bottom: 2rem;
            border-bottom: 1px solid #e0e0e0;
            margin-bottom: 2rem;
        }
                
        footer.page-footer {
            background-color: #53463d;
            margin-top: 2rem;
         
        }
        
  
  		#editor{
		  font-family: "roboto";
		  font-size: 21px;
		  font-weight: 300;
		 
		}
		
		.editorans{
		  font-family: "roboto";
		  font-size: 21px;
		  font-weight: 300;
		  word-break: break-word;
		}
		
		b, strong {
    font-weight: bold;
}


pre{

font-size: 90%;
}

.ql-snow .ql-editor img {
    max-width: 50%;
}
    </style>
 
</head>

<body>
    <script>
    
    	var isviewed=[];
        var utype="<%=utype%>";
            console.log(utype);
            
function setReportButton(x)
{
    var repClass=document.getElementsByClassName("report");
    console.log("here see me");
    if(utype==="faculty")
    {repClass[x].innerHTML="DELETE";
    console.log("here");
        }
}

    </script>

    <header>

        <!--Navbar-->
        <nav class="navbar fixed-top navbar-toggleable-md navbar-dark bg-info" >
            <div class="container" >
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNav1" aria-controls="navbarNav1" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                 <a class="navbar-brand" href="MyFeed">
                <img src="MDB Free/img/logo.png" class="img-fluid" style="width: 180px">
            </a>
                <div class="collapse navbar-collapse" id="navbarNav1">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="MyFeed">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="MyProfile">Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Post_Question.jsp">Ask a question</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="AboutUs.jsp">About Us</a>
                        </li>
                        
                        
                    </ul>
                
                    
                    <ul class="navbar-nav ml-auto">
                    <form class="form-inline waves-effect waves-light navbar-form navbar-right" action="AskQuestion" role="search">
                        <input class="form-control" type="text" placeholder="Search -- Question,  @Username,  #Workspaces" id="search" name="search" style="width:400px"  >
                       <button type="submit" class="btn btn-info btn-sm" >
								<i class="fa fa-search"></i><div class="ripple-container"></div>
							</button>
                    </form>

                        
                      
                
                    </ul>
                    </div>
            </div>
        </nav>
	    <!--/.Navbar-->

    </header>

    <main class="mt-3" style="margin-right: 0px;">

        <!--Main layout-->
        <div class="container" style="margin-left: 60px;margin-right:0px;">
            <div class="row">

                <!--Main column-->
                <div class="col-lg-9">
                <!--Jumbotron-->
                <%if(qm!=null){%>
                    <div class="jumbotron">
                        <mark> <a href="UserProfile?uid=<%= qm.getUid() %>"><%= qm.getUname() %></a> asked
                        </mark>
                        <h1 class="h1-responsive"><strong><%= qm.getQue() %></strong></h1>
                        <hr class="my-2">
                        <p>On date <%= qm.getQuedate() %> in <mark class="mr-2"><a href="WorkSpaceContent?did=<%= qm.getDomain() %>&dname=<%= qm.getdName() %>"><%= qm.getdName() %></a></mark>
                        </p>
                        
                        <p>
                            <%for(String tags: qm.getTags()){ %>
                        <span class=" orange badge badge-primary" ><%=tags%></span>
                        <%}%>

                        </p>
                      <button class="btn btn-info btn-sm" onclick="show()" id="ansbtn" style="font-size: 16px"></button>	<button class="btn btn-info btn-sm" id="followbtn" style="font-size: 16px" onclick="followQuestion('<%=qm.getQid() %>')"></button>
                        <form style="display: none" id="answerarea">
                            <div id="toolbar"></div>
                            <div id="editor"></div>
                            <div style="text-align: center"> <input  type="button" class="btn btn-info btn-md" name="submit" style="font-size: 20px" value="POST ANSWER" id="subAns" /></div>
                        </form>
                    </div>
                        <%}%>
                    <!--/.Jumbotron-->
                    <!--Post-->
                    <%if(aam!=null){  
                    int i=0;    
                    
                    for(AnswerModel am: aam.getAllans()){   
                        
                        if(am1.getUid().equals(am.getUid()))
            {
            ansindex=i;
            %>
            <script>
                document.getElementById("answerarea").setAttribute("action","PostAnswer?ansindex=<%=i%>");
            </script>
        <%
            }
            %>
                    <div class="post-wrapper wow fadeIn" data-wow-delay="0.2s">
                        <div class="col-md-12">
                            <!--First review-->
                            <div class="media mb-1">
                                <a class="media-left waves-light">
                                    <img class="rounded-circle" src="<%="ImageLoader?uid="+ am.getUid()  %>"  alt="Generic placeholder image" class="img-circle img-responsive" style="width:100px; height: 100px;">
                                </a>
                                <div class="media-body">
                                    <h5 class="media-heading"><a href="UserProfile?uid=<%= am.getUid() %>"><%= am.getUname() %></a></h5>
                                    <small class="text-muted">answered on <%= am.getAnsDate() %></small>
                                    <br><br>
                                    <p>
                                        <div class="toolbarans"></div>
                                        <div class="editorans"></div>
                                        <br><br>
                                    </p>
                                    VIEWS
                                    <span class="viewcount"> <%=am.getViews()%></span>
                                    <button value="upvote&qid=<%=am.getQid()%>&uid=<%=am.getUid()%>&index=<%=i%>" class="up btn btn-info" onclick="upvote(<%=i%>)"><i class="fa fa-smile-o"></i>&nbsp;&nbsp;Voilà!</button>
                                    <span class="upvotecount"> <%=am.getUpvotes()%></span>
                                    <button value="downvote&qid=<%=am.getQid()%>&uid=<%=am.getUid()%>&index=<%=i%>"  class=" down btn btn-unique" onclick="downvote(<%=i%>)"><i class=" fa fa-meh-o"></i>&nbsp;&nbsp;Bléh!</button>
                                    <span class="downvotecount"><%=am.getDownvotes() %></span>
                                    <button value="qid=<%=am.getQid()%>&uid=<%=am.getUid()%>" class="report btn btn-danger " onclick="report(<%=i%>)">REPORT ABUSE <i class="fa fa-ban float-right"></i></button>    
                                    <script>setReportButton(<%=i%>); isviewed.push(<%=am.isViewed()%>); </script>
                                </div>
                            </div>
                        </div>
                    </div>
                        <!--/.Post-->
<hr>
<% i++; }

}%>
                
<hr>
<!--                        Pagination
                    <nav>
                        <ul class="pagination flex-center pg-dark  wow fadeIn" data-wow-delay="0.2s">
                            Arrow left
                            <li class="page-item">
                                <a class="page-link" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>

                            Numbers
                            <li class="page-item active"><a class="page-link">1</a></li>
                            <li class="page-item"><a class="page-link">2</a></li>
                            <li class="page-item"><a class="page-link">3</a></li>
                            <li class="page-item"><a class="page-link">4</a></li>
                            <li class="page-item"><a class="page-link">5</a></li>

                            Arrow right
                            <li class="page-item">
                                <a class="page-link" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                    /.Pagination-->

                </div>

<!--           Sidebar-->
                <div class="col-lg-3" style="max-width: 100%;">

                    <div class="widget-wrapper wow fadeIn" id="stck" data-wow-delay="0.4s">
                        <h4 id="stck">Related Questions:</h4>
                        <br>
                        <%if(rqm1!=null && rqm1.getRelatedque()!=null ){int i=0;for(QuestionModel qm1 : rqm1.getRelatedque()){%>
                        <div class="card card-block">
                           
                            <a href="AllAnswer?id=<%=i%>&cat=cat3"><%=qm1.getQue() %></a>
                          
                        </div>
                        <%i++;}}%>
                    </div>
                </div>
<!--                /.Sidebar-->
            </div>
        </div>
        <!--/.Main layout-->

    </main>

   


    <!-- SCRIPTS -->
    <!-- JQuery -->
<!--    <script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>-->

    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="MDB Free/js/tether.min.js"></script>

    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="MDB Free/js/bootstrap.min.js"></script>

    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="MDB Free/js/mdb.min.js"></script>
    <script type="text/javascript" src="MDB Free/js/sticky/jquery.sticky.js"></script>

    <script>
    new WOW().init();
    </script>
  <script type="text/javascript">
    $(window).load(function(){
      $("#stck").sticky({ topSpacing: 70 });
    });
    </script>
    
    <script>
            
            var index;
            
            
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
    var type="";
    var yo=rep[x].innerHTML;
    request=getXmlHttpRequestObject();
    request.onreadystatechange=showAlert;
    request.open("post","ReportAnswer",true);
    request.setRequestHeader ("Content-Type", "application/x-www-form-urlencoded");
    if(yo.search("DELETE")!==-1)
        type="faculty";
    
    else if(yo.search("REPORT ABUSE")!==-1)
        type="student";
    
    val=val+"&type="+type+"&index="+x;
    var data=val;
    request.send(data);
    
}

function showVoteCount()
{
    if(request.readyState===4 && request.status===200){
        var up=document.getElementsByClassName("upvotecount");
        var down=document.getElementsByClassName("downvotecount");
        var updowncount=JSON.parse(request.responseText);
        up[index].innerHTML=updowncount.uvotes;
        down[index].innerHTML=updowncount.dvotes;
    }
}

function showAlert()
{
    if(request.readyState===4 && request.status===200){
       alert(request.responseText);
       location.reload();
    }
    
}

var isfollowed=<%=qm.isFollowed() %>;

console.log("hello");
var id=document.getElementById("followbtn");

if(isfollowed==true)
{
	id.innerHTML="FOLLOWED";
}
else
{
	id.innerHTML="FOLLOW";
}	


function followQuestion(qid)
{
	console.log(qid);
    request=getXmlHttpRequestObject();
    request.onreadystatechange=queFollowed;
    request.open("post","FollowQuestion",true);
    request.setRequestHeader ("Content-Type", "application/x-www-form-urlencoded");
    
    var data="qid="+qid+"&isfollowed="+isfollowed;
    request.send(data);
}

function queFollowed()
{
	if(request.readyState===4 && request.status===200)
	{
	       var data=request.responseText;
	       console.log(data);
	       if(data.trim()=="follow")
	       {
	    	   isfollowed=true;
	    	   document.getElementById("followbtn").innerHTML="FOLLOWED";
	       }
	       else if(data.trim()=="unfollow")
	       {
	    	   isfollowed=false;
	    	   document.getElementById("followbtn").innerHTML="FOLLOW";
	       }
	}
	
}
</script>


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
		var content="";
		for(var i=0;i<delta.ops.length;i++)
		{
			var del=delta.ops[i];
			content=content+del.insert;
		}
	
		if(content.replace(/\n/g, '').trim().length===0)
		{
			
			alert("You Cannot Post Empty Answer...!!!!");
		}
		else
		{	
         $.ajax({
        url: "PostAnswer?ansindex=<%=ansindex%>&btnvalue="+document.getElementById("subAns").value,
        type: 'POST',
        dataType: 'json',
        data: JSON.stringify(delta),
        contentType: 'application/json',
        mimeType: 'application/json',
        success : function(data) {
        	
        	websocket.send(JSON.stringify(data));
        	console.log("hello "+data);
            alert("Answer Posted Successfully...!!!");
            window.location="Question_Page.jsp?flag=true";
            
        //quill.setContents({"ops": [{"insert": "\n"}]});
	}
        });
		}

       });
           
        
        </script>
        
        
        
        <script>
        checkFlag();
        function checkFlag()
        {
            var flag= "<%=flag%>" ;
            if(flag==="true")
                document.getElementById("ansbtn").innerHTML="EDIT ANSWER";
            else if(flag==="false")
                document.getElementById("ansbtn").innerHTML="WRITE ANSWER";
        }
        function show()
        {
         quill.setContents(<%=am1.getAnswer()%>);
         
           if(document.getElementById("answerarea").style.display==="none")
        {
           document.getElementById("answerarea").style.display="block";
           
            if(document.getElementById("ansbtn").innerHTML.search("EDIT ANSWER")!=-1)
            {
              document.getElementById("subAns").value="UPDATE ANSWER";
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
        <script>
					            var elements = document.querySelectorAll(".editorans");
								var length = elements.length;
								
								var flag= new Array(length);
        function reveal()
        {

            for(var count = 0; count < length; count++)
           {
               /* offsetParent may not be the body if the element container is positioned. Therefore we need to find the distance from the body by adding all the offsetTop's of all offsetParent's.  */
              var offsetParentTop = 0;
               var temp = elements[count];
			var temp1 = elements[count];
			var outerheight=$(temp1).outerHeight(true);
			//console.log(outerheight);
               do
               {
                   if(!isNaN(temp.offsetTop))
                   {
                        offsetParentTop += temp.offsetTop;
                   }
               }while(temp = temp.offsetParent);
               
			//   console.log("parent"+offsetParentTop);
               var pageYOffset = window.pageYOffset;
               var viewportHeight = window.innerHeight;       
               
               if( offsetParentTop < (pageYOffset + viewportHeight) && flag[count]== undefined && (offsetParentTop + outerheight >= pageYOffset || offsetParentTop > pageYOffset))
               {	flag[count]= true;
                   console.log(elements[count].id+ " is visible");
				   window.setTimeout(isViewed,1000,count);
                }
				else if(flag[count]==true && ((offsetParentTop + outerheight) <= pageYOffset || offsetParentTop>=pageYOffset+viewportHeight))
				{
				    flag[count]= undefined;
					console.log(elements[count].id+ " is out of view");
				}
            }
        }
        
        /* Attach event handlers to resize and scroll event */
        window.addEventListener("resize",reveal);
        window.addEventListener("scroll",reveal);
		
        var countIndex;
		function isViewed(count)
		{
			if(flag[count]==true)
			{
				if(isviewed[count]==false)
				{
					countIndex=count;
					countAsView(count);
					console.log("This Is Viewed-->>"+count);
				}
			
				else
				console.log("Already Viewed-->>"+count);
			}
			else
				console.log("This Is Not Viewed-->>"+count);
		}
		
		
		function countAsView(x)
		{   
		    var val=x
		    request=getXmlHttpRequestObject();
		    request.onreadystatechange=viewed;
		    request.open("post","CountAsView",true);
		    request.setRequestHeader ("Content-Type", "application/x-www-form-urlencoded");
		    var data="index="+val;
		    request.send(data);
		}

		function viewed()
		{
		    if(request.readyState===4 && request.status===200)
		    {
		    	isviewed[countIndex]=true;
		        document.getElementsByClassName("viewcount")[countIndex].innerHTML=request.responseText;
		    }
		}
		
    </script>
    
   <script src="js/Notifications.js"></script>
</body>

</html>
