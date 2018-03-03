<%@page import="model.StudentModel"%>
<%@page import="model.FacultyModel"%>
<%@page import="model.QuestionModel"%>
<%@page import="model.RelatedQuestionModel"%>
<%
RelatedQuestionModel rlqm=(RelatedQuestionModel)session.getAttribute("relques");
RelatedQuestionModel rlqm1=(RelatedQuestionModel)session.getAttribute("relques1");

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

String uvc=request.getParameter("uvc");
String tc=request.getParameter("tc");

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
     <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>-->
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
.card{
	margin: 15px 0;
}


img.resize {
  max-width:25%;
  max-height:25%;
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
    </style>
</head>

<body>
<div id="toolbarque" style="display: none"></div>
<div id="editorque" style="display: none"></div>
         
         <script>
         
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
							<li class="active"><a href="MyFeed">Home</a></li>
			        		<li><a href="MyProfile">Profile</a></li>
			        		<li><a href="Post_Question.jsp">Ask a question</a></li>
                                                 <li><a href="AboutUs.jsp">About Us</a></li>
				    		</ul>
						<ul class="nav navbar-nav navbar-right">
							
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="material-icons">notifications_active</i></a>
			        			<ul class="dropdown-menu" id="notifications">
								 
								 
								 
			        			</ul>
								
							</li>
							<li class="dropdown">
			        			<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="material-icons">person</i></a>
			        			<ul class="dropdown-menu">
								 
								 
								  <li><a href="EditProfile">Edit Profile</a></li>
								  <li class="divider"></li>
								  <li><a href="ChangePassword.jsp?uid=<%=uid%>">Change Password</a></li>
								  <li class="divider"></li>
							      <li><a onclick="destroyHandler()">Log Out</a></li>
			        			</ul>
			        		</li>
										
						</ul>

						<form class="navbar-form navbar-right" role="search" action="AskQuestion">
							<div class="form-group  is-empty">
								<input type="text" class="form-control search" placeholder="Search -- Question,  @Username,  #Workspaces" id="search" name="search" style="width: 400px;">
								<span class="material-input"></span>
							</div>
							<button type="submit" class="btn btn-white btn-round btn-just-icon">
								<i class="material-icons">search</i>
                                                                <!--<div class="ripple-container"></div>-->
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
	                <li class="active">
                            
	                    <a>
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
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="card card-stats animated fadeInDown">
								<div class="card-header" data-background-color="orange">
									<i class="material-icons">mood</i>
								</div>
								<div class="card-content">
									<p class="category">Total Voilà's!</p>
									<h3 class="title"><%=uvc%></h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">mood</i> hey, get going!
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="card card-stats animated fadeInDown">
								<div class="card-header" data-background-color="green">
									<i class="material-icons">stars</i>
								</div>
								<div class="card-content">
									<p class="category">Area of interests</p>
									<h3 class="title"><%=tc%></h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">stars</i> keep surfing :)
									</div>
								</div>
							</div>
						</div>
						</div>
				<!--card-1-->		
          
        		    		<!--card-1-->	
                 <%if(rlqm!=null){int i=0;for(QuestionModel qm: rlqm.getRelatedque()){%>
                <div class="card animated fadeInDown" style="animation-delay:<%=i%6%>s;">
                    <div class="card-content">
	                    <div class="category"><a href="UserProfile?uid=<%= qm.getUid() %>" style="color: #0099cc;"> <%= qm.getUname() %></a> asked in 
	                    	<label class="label label-info"><a href="WorkSpaceContent?did=<%= qm.getDomain() %>&dname=<%= qm.getdName() %>" style="color: #FFFFFF;"> <%= qm.getdName() %></a></label> with 
	                        <%for(String tags: qm.getTags() ){%>
                                <label class="label" style="background-color: #F80;"><%=tags%></label><%}%>
	            		</div>
                                <h3 style="margin-top: 5px;margin-bottom: 5px;font-weight: bold;"><a href="AllAnswer?id=<%=i%>&cat=cat1" style="color : black "><%= qm.getQue() %></a></h3>
                                
	            		<div class="row" style="padding-left: 5px;">

	            			<div class="col-md-1 col-sm-1"> 
	            				<img src="ImageLoader?uid=<%= qm.getTopAnswerer() %>" alt="Circle Image" class="img-circle img-responsive">
	            			</div>
	            			<div class="col-md-11 col-sm-11" style="padding-left: 1px;">
                                            <%if(qm.getAnswererName().equals("No one")){%><a style="color: #0099cc;"> <%= qm.getAnswererName() %></a><%}else{%><a href="UserProfile?uid=<%= qm.getTopAnswerer() %>" style="color: #0099cc;"> <%= qm.getAnswererName() %></a><%}%> answered
	            			<br><span class="ansImg" ></span><div class="lead ans" style="margin-bottom: 1px;"></div>
                                                <a class="read" href="#no" style="color: #0099cc;" onclick="instantiateEditor('<%=i%>')">Read more</a><br>
                                               <!--   <a href="#no" style="color: #0099cc;" onclick="instantiateEditor('<%=i%>')">Read more quill</a>-->
                                                                                        <script>
                                                                                        	
                                                                                        	quillAnswers.push(<%= qm.getMostUpvotedAnswer() %>);
                                                                                            quillque.setContents(<%= qm.getMostUpvotedAnswer() %>); 
                                                                                            //var htmlcontent=quillque.root.innerHTML;
                                                                                            //var htmlcontent=quillque.getText();
                                                                                            window.delta=quillque.getContents();
                                                                                            var content="";
                                                                                        	var imgObj,count=0,count1=0;
                                                                                        	console.log(delta);
																							for(var i=0;i<delta.ops.length;i++)
																							{
																								var del=delta.ops[i];
																							
																								console.log(del.insert);
																							
																								if(typeof del.insert!=='object' && count1==1)
																								{
																									count1=0;
																									continue;
																								}
																								
																								if(typeof del.insert!=='object')
																									content=content+del.insert;
																								
																								else if(count==0)
																								{
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
		                                                                                    	c[<%=i%>].innerText=content.substr(0,100)+"...";
		                                                                                    	isFullShow.push(false);
	                                                                                        }
		                                                                                    
		                                                                                    else
		                                                                                    {
		                                                                                    	c[<%=i%>].innerText=content;
		                                                                                    	isFullShow.push(true);
		                                                                                    	
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
				<div class="card">
						<div class="card-content card-title">
							<h4>Questions For You </h4>
							<%if(rlqm1!=null && rlqm1.getRelatedque()!=null ){int i=0;for(QuestionModel qm: rlqm1.getRelatedque()){ %>
							<p>
                                                            <a href="AllAnswer?id=<%=i%>&cat=cat2" style="color: #0099cc;"><%= qm.getQue() %></a>
							</p>
                                                        <%i++;}}%>
						</div>
					</div>
				</div>
			</div>
		</div>

			</div>
			

			<footer class="footer">
				<div class="container-fluid">
					<nav >
					</nav>
					<p class="copyright pull-right">
						&copy; <script>document.write(new Date().getFullYear())</script> , made with love <i class="fa fa-heart"></i> by team Korero
					</p>
				</div>
			</footer>
	
	</div>
                                                
              
                                           
                                                
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/material.min.js" type="text/javascript"></script>

	<!--  Notifications Plugin    -->
	<script src="js/bootstrap-notify.js"></script>

	
	<!-- Material Dashboard javascript methods -->
	<script src="js/material-dashboard.js"></script>

	<!-- Material Dashboard DEMO methods, don't include it in your project! -->
	<script src="js/demo.js"></script>
	<script src="MDB Free/js/limittext.js"></script>
	
	<script src="js/Notifications.js"></script> 
	
	<script>
	websocket.onmessage=function processMessage(message){
		var jsonData=JSON.parse(message.data);
		console.log(jsonData);
		if(jsonData.message!=null)
			{
				document.getElementById("notifications").innerHTML=document.getElementById("notifications").innerHTML+'<li><a href="#" >'+jsonData.message+'</a></li><li class="divider"></li>';	
				  
			}
		
	}

	
	</script>

</body>

	<!--   Core JS Files   -->
	<!--<script src="js/jquery-3.1.0.min.js" type="text/javascript"></script>-->
	

</html>
