<%@page import="model.StudentModel"%>
<%@page import="model.FacultyModel"%>
<%@page import="model.QuestionModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.RelatedQuestionModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%RelatedQuestionModel rqm=(RelatedQuestionModel)session.getAttribute("relques");
ArrayList<QuestionModel>alqm=null;

if(rqm!=null)
alqm=rqm.getRelatedque();

String utype=session.getAttribute("utype").toString();
FacultyModel fm;
StudentModel sm;
String uname="",uid="";
if(utype.equals("student"))
{
    sm=(StudentModel)session.getAttribute("userModel");
    uname=sm.getName();
    uid=sm.getSid();
}
else if(utype.equals("faculty"))
{
    fm=(FacultyModel)session.getAttribute("userModel");
    uname=fm.getName();
    uid=fm.getFid();
}

%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png" />
	<link rel="icon" type="image/png" href="MDB Free/img/img1.png" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Korero</title>
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/autocompleter.js"></script>
        <link rel="stylesheet" href="js/jquery-ui.css">
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
        
         <script>
            
            var configForShow = {
                "theme": "snow",
                "modules": {
                "toolbar": false
  				}
                
			};
            var quillShowAns;
            function instantiateEditor(i)
            {
            	ans=quillAnswers[i];
                quillShowAns=new Quill('#ans'+i,configForShow);
                quillShowAns.setContents(ans);
                quillShowAns.enable(false);  
                document.getElementsByClassName("ansImg")[i].innerHTML="";
                document.getElementsByClassName("read")[i].innerHTML="";
            }
            
            
            function destroyHandler()
            {
            	     	window.location="LogOut";
            }
        </script>
         
        

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
<!-- Font Awesome -->
    <link rel="stylesheet" href="MDB Free/font-awesome-4.7.0/css/font-awesome.min.css">

  
    <!-- Bootstrap core CSS     -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <!--  Material Dashboard CSS    -->
    <link href="css/material-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="css/demo.css" rel="stylesheet" />
    
    <script src="https://cdn.quilljs.com/1.2.3/quill.js"></script>
     <script src="https://cdn.quilljs.com/1.2.3/quill.min.js"></script>
     <!--<script src="https://cdnjs.cloudflare.com/ajax/lib<s/jquery/3.1.1/jquery.min.js"></script>-->
     <link href="https://cdn.quilljs.com/1.1.3/quill.snow.css" rel="stylesheet">
     <link href="https://cdn.quilljs.com/1.1.3/quill.bubble.css" rel="stylesheet">
	

    <!--     Fonts and icons     -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
    <style type="text/css">
    	
        .limittext {
    white-space: nowrap; 
    width: 100%; 
    overflow: hidden;
    text-overflow: ellipsis; 
}

img.resize {
  max-width:15%;
  max-height:15%;
  float: right;
}

.card img {
    width: auto;
    height: auto;
}

b, strong {
    font-weight: bold;
}

.ans{
		  font-family: "roboto";
		  font-size: 21px;
		  font-weight: 300;
		  word-wrap: break-word;
	}

pre{

font-size: 90%;
}

.ql-container.ql-snow {
    border: 0px solid #ccc;
}

.ql-snow .ql-editor img {
    max-width: 50%;
    max-height: 50%;
}


    </style>
</head>

<body>
<div id="toolbarque" style="display: none"></div>
<div id="editorque" style="display: none"></div>
         
         <script>
            
         var isNoOne=false;
         var quillAnswers=[];
         var isFullShow=[];
         
            var configque = {
                "theme": "snow",
                "modules": {
                "toolbar": false
  }
  
};
            var config = {
                "theme": "snow",
                "modules": {
                "toolbar": false
  }
               
};
             var quillque;
            quillque=new Quill('#editorque',configque);
            console.log("quillque"+quillque);            
        
        </script>
            
<nav class="navbar navbar-fixed-top navbar-info" role="navigation">
	<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						 <a class="navbar-brand" href="MyFeed">
                <img src="MDB Free/img/logo.png" class="img-fluid" style="width: 180px">
            </a>

					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav">
							<li><a href="MyFeed">Home</a></li>
			        		<li><a href="MyProfile">Profile</a></li>
			        		<li><a href="Post_Question.jsp">Ask a question</a></li>
                                                 <li><a href="AboutUs.jsp">About Us</a></li>
				    		</ul>
						<ul class="nav navbar-nav navbar-right">
							
							<li class="dropdown">
			        			<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="material-icons">person</i></a>
			        			<ul class="dropdown-menu">
								  <li><a href="EditProfile">Edit Profile</a></li>
								  <li class="divider"></li>
								  <li><a href="ChangePassword.jsp?uid=<%=uid%>">Change Password</a></li>
								  <li class="divider"></li>
							      <li><a href="LogOut">Log Out</a></li>
			        			</ul>
			        		</li>
										
						</ul>

						<form class="navbar-form navbar-right" role="search" action="AskQuestion">
							<div class="form-group  is-empty">
								<input type="text" id="search" name="search" class="form-control search" placeholder="Search -- Question,  @Username,  #Workspaces" style="width: 400px;">
								<span class="material-input"></span>
							</div>
							<button type="submit" class="btn btn-white btn-round btn-just-icon">
								<i class="material-icons">search</i>
							</button>
						</form>
					</div>
				</div>
			</nav>
	<div class="wrapper">

	    <div class="sidebar" data-color="blue" data-image="img/testd.jpg" style="margin-top: 50px;">
			<!--
		        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

		        Tip 2: you can also add an image using data-image tag
		    -->

	    	<div class="sidebar-wrapper">
	            <ul class="nav">
	            <li class="container-fluid">
	            	<img src="ImageLoader?uid=<%=uid%>" alt="Circle Image" class="img-circle img-responsive" style="padding: 0px 35px;">
	            <div class="content text-center">
					<h6 class="category text-gray"><%=utype%></h6>
					<h4 class="card-title"><%= uname %></h4>
    			</div>
	            </li>
	                <li>
	                    <a href="MyFeed">
	                        <i class="material-icons">dashboard</i>
	                        <p>My Feed</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="EditProfile">
	                        <i class="material-icons">person</i>
	                        <p>Edit Profile</p>
	                    </a>
	                </li>
	                <li>
                            <a href="poll/pollhome.jsp">
	                        <i class="material-icons">list</i>
	                        <p>Polling</p>
	                    </a>
	                </li>
	                <li>
                            <a href="book advisory/bookhome.jsp">
	                        <i class="material-icons text-gray">book</i>
	                        <p>Book Advisory</p>
	                    </a>
	                </li>
	            </ul>
	    	</div>
	    </div>

	    <div class="main-panel">

			<div class="content" style="padding-top: 50px;margin-top: 20px;">
				<div class="container-fluid">
					<div class="row">
					<div class="col-md-9">
					<div class="row">
						
						
						</div>
				<!--card-1-->		
          
        		    		<!--card-1-->	
                                        <%if(alqm==null){%><h1>No Results Found</h1><%}if(alqm!=null){if(alqm.size()==0){%><h1>No Results Found</h1><%}int i=0;for(QuestionModel qm: alqm){%>
                <div class="card animated fadeInDown">
                    <div class="card-content">
	                    <div class="category"><a href="UserProfile?uid=<%= qm.getUid() %>" style="color: #0099cc;"> <%= qm.getUname() %></a> asked in 
                                <label class="label label-info"><a href="WorkSpaceContent?did=<%= qm.getDomain() %>&dname=<%= qm.getdName() %>" style="color: #FFFFFF;"> <%= qm.getdName() %></a></label> with 
	                        <%for(String tags: qm.getTags() ){%>
                                <label class="label" style="background-color: #F80;"><%=tags%></label><%}%>
	            		</div>
                                <h3 style="margin-top: 5px;margin-bottom: 5px;font-weight: bold;"><a href="AllAnswer?id=<%=i%>&cat=cat1" style="color:black"><%= qm.getQue() %></a></h3>

	            		<div class="row" style="padding-left: 5px;">

	            			<div class="col-md-1 col-sm-1"> 
	            				<img src="ImageLoader?uid=<%= qm.getTopAnswerer() %>" alt="Circle Image" class="img-circle img-responsive">
	            			</div>
	            			<div class="col-md-11 col-sm-11" style="padding-left: 1px;">
	            			<%if(qm.getAnswererName().equals("No one")){%><a style="color: #0099cc;"> <%= qm.getAnswererName() %></a><script>isNoOne=true;</script><%}else{%><a href="UserProfile?uid=<%= qm.getTopAnswerer() %>" style="color: #0099cc;"> <%= qm.getAnswererName() %></a><%}%> answered
	            				<br><span class="ansImg" ></span><div class="lead ans" style="margin-bottom: 1px;"> </div>
                                                <a class="read" href="#no" style="color: #0099cc;" onclick="instantiateEditor('<%=i%>')">Read more</a><br>
                                               <!--   <a class="read" href="#no" style="color: #0099cc;" onclick="show('ans<%=i%>','read<%=i%>')">Read more</a>-->
                                                                                        <script>
                                                                       
                                                                                            
                                                            
                                        									if(!isNoOne)
                                        									{
                                        										quillAnswers.push(<%= qm.getMostUpvotedAnswer() %>);
                                        										
                                        		
                                        									}
                                        									else
                                        									{
                                        										quillAnswers.push({"ops":[{"insert":""}]});
                                        										document.getElementsByClassName("read")[<%=i%>].innerHTML="";
                                        						
                                        										isFullShow.push(false);
                                        									}
                                        									
                                                                        quillque.setContents(<%= qm.getMostUpvotedAnswer() %>); 
                                                                        window.delta=quillque.getContents();
                                                                        var content="";
                                                                    	var imgObj,count=0,count1=0;
                                                                                                     
                                        								for(var i=0;i<delta.ops.length;i++)
                                        								{
                                        									var del=delta.ops[i];
                                        								
                                        									
                                        								
                                        									if(typeof del.insert!=='object' && count1==1)
                                        									{
                                        										console.log(del.insert);
                                        										console.log("-->"+i);
                                        										content=content+del.insert.substr(1,del.insert.length);
                                        										count1=0;
                                        										continue;
                                        									}
                                        									
                                        									if(typeof del.insert!=='object')
                                        									{
                                        										console.log(del.insert);
                                        										console.log("////////"+i);
                                        										content=content+del.insert;
                                        									}
                                        									
                                        									else if(count==0)
                                        									{
                                        										console.log(del.insert);
                                        										console.log("@@@@@"+i);
                                        										count++;
                                        										imgObj=del.insert;
                                        										count1=1;
                                        									}
                                        								}
                                        							
                                        								if(imgObj!== undefined)
                                        								{
                                        									var opsarr={"ops":[{"insert":""}]};
                                        									opsarr.ops[0].insert=imgObj;
                                        									quillque.setContents(opsarr);
                                        									var imgarea=document.getElementsByClassName("ansImg")[<%=i%>];
                                        									imgarea.innerHTML=quillque.root.innerHTML;
                                        									var imgTag=imgarea.getElementsByTagName('p')[0].childNodes[0];
                                        									imgTag.setAttribute("class","resize");
                                        									imgObj=undefined;
                                        									
                                        								}
                                                                                                           
                                                                                                                     
                                                                         	var c=document.getElementsByClassName("ans");
                                                                         
                                                                         	if(content.length>100)
                                                                          	{
                                                                         		console.log(content);
                                                                         		console.log("\n"+content.length);
                                                                         		c[<%=i%>].innerText=content.substr(0,100)+"...";
                                                                         		isFullShow.push(false);
                                                                          	}
                                                                       
                                                                       		else if(!isNoOne)
                                                                       		{
                                                                       			console.log("i am else");
                                                                       			console.log(content);
                                                                       			console.log("\n"+content.length);
                                                                       			c[<%=i%>].innerText=content;
                                                                       			isFullShow.push(true);
                                                                       		}
                                                                       		else
                                                                       		{
                                                                       			isNoOne=false;
                                                                       
                                                                       			c[<%=i%>].innerText=content;
                                                                       		}


                                                                                        </script>
                                        </div>
	            			
	            			
	            		</div>
            		</div>
	            		<div class="card-footer">
							<div class="stats">
								<i class="material-icons">update</i> <%= qm.getQuedate() %>
							</div>
							
						</div>
        		    </div>
                <%i++;}%>
                <script>
        var ansElements = document.querySelectorAll('.ans');
        var readElements = document.querySelectorAll('.read');
       
        for (var i = 0; i < ansElements.length; i++)
        {
            readElements[i].id = 'read' + i;
            ansElements[i].id = 'ans' + i;
        
            if(isFullShow[i])
            {
            	instantiateEditor(i);
            }
         }</script> 
                <%}%>
				</div>
		
				
				
		
			<div class="col-md-3 col-sm-12 animated fadeInDown">
				
				</div>
			</div>
		</div>

			</div>
			

			<footer class="footer">
				<div class="container-fluid">
					<nav >
					</nav>
					<p class="copyright pull-right">
						&copy; <script>document.write(new Date().getFullYear())</script> , made with love <i class="fa fa-heart"></i>by team Korero
					</p>
				</div>
			</footer>
	
	</div>
	
		
	
<script src="js/material.min.js" type="text/javascript"></script>

	<!--  Notifications Plugin    -->
	<script src="js/bootstrap-notify.js"></script>

	
	<!-- Material Dashboard javascript methods -->
	<script src="js/material-dashboard.js"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
	<!-- Material Dashboard DEMO methods, don't include it in your project! -->
	<script src="js/demo.js"></script>
	<script src="MDB Free/js/limittext.js"></script>
        
</body>

	<!--   Core JS Files   -->
	<!--<script src="js/jquery-3.1.0.min.js" type="text/javascript"></script>-->
	
	
	 

</html>
