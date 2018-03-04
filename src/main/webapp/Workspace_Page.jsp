<%@page import="model.StudentModel"%>
<%@page import="model.FacultyModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.RelatedQuestionModel"%>
<!DOCTYPE html>
<%@page import="model.QuestionModel"%>
<%@page import="model.DomainContentModel"%>
<%DomainContentModel dcm=(DomainContentModel)session.getAttribute("workspacecontent");
ArrayList<QuestionModel> alqm=dcm.getAlqm();
RelatedQuestionModel rqm=new RelatedQuestionModel();
if(alqm!=null)
{    
rqm.setRelatedque(alqm);
session.setAttribute("relques",rqm);
}
String id=request.getParameter("id");


%>
<html lang="en">

<head>
    
    

        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/autocompleter.js"></script>
        <link rel="stylesheet" href="js/jquery-ui.css">
             <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/png" href="MDB Free/img/img1.png" />
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>Korero</title>
<!--<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">-->
    <!-- Font Awesome -->
    <link rel="stylesheet" href="MDB Free/font-awesome-4.7.0/css/font-awesome.min.css">

    <!-- Bootstrap core CSS -->
    <link href="MDB Free/css/bootstrap.min.css" rel="stylesheet">

    <!-- Material Design Bootstrap -->
    <link href="MDB Free/css/mdb.min.css" rel="stylesheet">
    
     <script src="https://cdn.quilljs.com/1.2.3/quill.js"></script>
     <script src="https://cdn.quilljs.com/1.2.3/quill.min.js"></script>
     <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>-->
     <link href="https://cdn.quilljs.com/1.1.3/quill.snow.css" rel="stylesheet">
     <link href="https://cdn.quilljs.com/1.1.3/quill.bubble.css" rel="stylesheet">
     
     
     
       
     
    <!-- Template styles -->
    <style rel="stylesheet">
        /* TEMPLATE STYLES */
        /* Necessary for full page carousel*/
        
        html,
        body {
            height: 100%;
        }
        /* Navigation*/
        
        .navbar {
            background-color: transparent;
        }
        
        .top-nav-collapse {
            background-color: #0099cc;
        }
        
        footer.page-footer {
            background-color: #0099cc;
        }
        
        @media only screen and (max-width: 768px) {
            .navbar {
                background-color: #4285F4;
            }
        }
        
        .scrolling-navbar {
            -webkit-transition: background .5s ease-in-out, padding .5s ease-in-out;
            -moz-transition: background .5s ease-in-out, padding .5s ease-in-out;
            transition: background .5s ease-in-out, padding .5s ease-in-out;
        }
        /* Carousel*/
        
        .carousel {
            height: 50%;
        }
        
        @media (max-width: 776px) {
            .carousel {
                height: 100%;
            }
        }
        
        .carousel-item,
        .active {
            height: 100%;
        }
        
        .carousel-inner {
            height: 100%;
        }
        
        /*Caption*/
        
        .flex-center {
            color: #fff;
        }

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
           
           
        	var quillque;
            quillque=new Quill('#editorque',configque);
            console.log("quillque"+quillque);            
        
            
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
        </script>
    <!--Navbar-->
    <nav class="navbar navbar-toggleable-md navbar-dark fixed-top scrolling-navbar">
        <div class="container">
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNav1" aria-controls="navbarNav1" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
             <a class="navbar-brand" href="MyFeed">
                <img src="MDB Free/img/logo.png" class="img-fluid" style="width: 180px">
            </a>
            <div class="collapse navbar-collapse" id="navbarNav1">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a href="MyFeed" class="nav-link">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a href="MyProfile" class="nav-link">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a href="BlogContent?did=<%= dcm.getDid() %>" class="nav-link">Blogs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AboutUs.jsp">About Us</a>
                    </li>
                    
                   
                </ul>
                <form action="AskQuestion" class="form-inline waves-effect waves-light">
                    <br>
                    <input id="search" name="search" class="form-control search" type="text" placeholder="Search -- Question,  @Username,  #Workspaces" style="width: 400px;">
                    <button type="submit" class="btn btn-info btn-sm"><i class="fa fa-search"></i></button>
					
                </form>
                                            
            </div>
        </div>
    </nav>
    <!--/.Navbar-->

    <!--Carousel Wrapper-->
    <div id="carousel-example-3" class="carousel slide carousel-fade" data-ride="carousel" data-interval="false">
        <!--Indicators-->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-3" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-3" data-slide-to="1"></li>
            <li data-target="#carousel-example-3" data-slide-to="2"></li>
        </ol>
        <!--/.Indicators-->

        <!--Slides-->
        <div class="carousel-inner" role="listbox">

            <!-- First slide -->
            <div class="carousel-item active view hm-black-strong" style="background-image: url('img/testd.jpg');background-repeat: repeat-x;">
                
                <!-- Caption -->
                <div class="full-bg-img flex-center">
                    <div class="animated fadeIn col-md-12">
                        <div class="row mt-4">
                        	<div class="col-md-1">
                        		
                        	</div>
                        	<div class="col-md-2">
                                    <img class="img-responsive rounded-circle img-fluid mb-4 mt-1" src="imagesdomain/<%= dcm.getImagePath() %>" alt="Generic placeholder image">
                           	</div>
                                <div class="col-md-1"></div>
                           	<div class="col-md-4 text-center">
			                    <ul class="animated fadeIn col-md-12">
			                        <li>
			                            <h1 class="h1-responsive lead mt-1" style="font-weight: bold;"><%= dcm.getDname() %> </h1>
			                        </li>
			                        <li>
			                            <p>Followers <label id="followers" class="badge blue"><%= dcm.getFollowersCount() %></label> | Tags <label class="badge blue"><%= dcm.getTagCount() %></label></p>
			                            
			                        </li>
			                        <li>
                                                    <input type="button" class="btn btn-info btn-sm" id="followbtn" onclick="follow(<%=dcm.getDid()%>)" >
                                                    
			                        </li>
			                    </ul>
                    		</div>
                    		<div class="col-md-3">
                    			<ul class="animated fadeIn col-md-12 mt-1">
			                        <li>
			                            <h2 class="h2-responsive mt-2" style="margin-top: 30px;"><i class="fa fa-bookmark"></i> Top Users </h2>
			                        </li>
			                        <li>
			                        	<br>
                                                        <%
                                                        for(String topuser:dcm.getTopUsers()){
                                                        %>
			                            <h3 style="font-style: italic;"><i class="fa fa-trophy"></i> <%= topuser%></h3>
			                            <%}%>
			                            
			                        </li>
			                    </ul>
                    		</div>
                        </div>
                    </div>
                </div>
                <!-- /.Caption -->
                
            </div>
            <!--/.First slide-->

            <!-- Second slide -->
            <div class="carousel-item view hm-cyan-strong" style="background-image: url('img/testd.jpg'); background-repeat: no-repeat; background-size: cover;">
                
                <!-- Caption -->
                <div class="full-bg-img flex-center white-text">
                    <ul class="animated fadeIn col-md-12 mt-3">
                    <div class="row">
                    <div class="col-md-1"></div>
                    	<div class="col-md-3 text-center">
                        <li>
                        <br>
                            <h1 class="h1-responsive" style="font-weight: bold;color: #000000;">Trending Top tags:</h1>
                        </li>
                    		
                    	</div>
                    	<div class="col-md-3">
                        <li>
                            <h2 class="h2-responsive badge blue"><%= dcm.getTrendingTags().get(0) %></h2>
                        </li>
                        <li>
                             <h2 class="h2-responsive badge blue"><%= dcm.getTrendingTags().get(1) %></h2>
                        </li>
                    		
                    	</div>
                    	<div class="col-md-2">
                    		                        <li>
 						<h2 class="h2-responsive badge blue"><%= dcm.getTrendingTags().get(2) %></h2>
                         </li>
                        <li>
                             <h2 class="h2-responsive badge blue"><%= dcm.getTrendingTags().get(3) %></h2>
                        </li>
 <li>
                
                    	
                    	</div>
                    	<div class="col-md-3">
                        <li>
                             <h2 class="h2-responsive badge blue"><%= dcm.getTrendingTags().get(4) %></h2>
                        </li>
                        <li>
                             <h2 class="h2-responsive badge blue"><%= dcm.getTrendingTags().get(5) %></h2>
                        </li>
                       	
                    	</div>
                    </div>
                    </ul>
                </div>
                <!-- /.Caption -->
                
            </div>
            <!--/.Second slide -->

            <!-- Third slide -->
            <div class="carousel-item view hm-black-strong" style="background-image: url('img/testd.jpg'); background-repeat: no-repeat; background-size: cover;">
                
                <!-- Caption -->
                <div class="full-bg-img flex-center white-text">
                    <ul class="animated fadeIn col-md-12">
                    <div class="row">
                    <div class="col-md-1"></div>
                    	<div class="col-md-3">
                	        <li><h1 class="h1-responsive">Total Questions asked</h1></li>
                	        <li><h2 class="h2-responsive"><label class="badge blue"><%= dcm.getQuestionsCount() %></label></h2></li>
                    	</div>
                    	<div class="col-md-4">
                	        <li><h1 class="h1-responsive">Total question Answered</h1></li>
                	        <li><h2 class="h2-responsive"><label class="badge blue"><%= dcm.getAnswersCount() %></label></h2></li>

                    	</div>
                    	<div class="col-md-3">
                	        <li><h1 class="h1-responsive">Total number of blogs</h1></li>
                	        <li><h2 class="h2-responsive"><label class="badge blue"><%= dcm.getBlogsCount() %></label></h2></li>

                    	</div>

                    	<div class="col-md-1"></div>
                    </div>
                    </ul>
                </div>
                <!-- /.Caption -->
                
            </div>
            <!--/.Third slide-->
        </div>
        <!--/.Slides-->

        <!--Controls-->
        <a class="carousel-control-prev" href="#carousel-example-3" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carousel-example-3" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
        <!--/.Controls-->
    </div>
    <!--/.Carousel Wrapper-->

    <br>
<main>
    <!--Content-->
    <div class="container">
        <%if(dcm.getAlqm()!=null){int i=0; for(QuestionModel qm: dcm.getAlqm()){%>
        <div class="row mb-2">
            <!--First columnn-->
            <div class="col-lg-12">
                <!--Card-->
                <div class="card wow fadeIn" data-wow-delay="0.2s">
                    <div class="card-block">
	                    <a href="UserProfile?uid=<%= qm.getUid() %>" style="color: #0099cc;"><%= qm.getUname() %></a> asked in 
	                    	<label class="badge blue"><a style="color: #FFFFFF;"> <%= dcm.getDname() %></a></label> with 
	                       <%for(String tags: qm.getTags()){%>
                                <label class="badge" style="background-color: #ff5d00;"><%=tags%></label>
	                        <%}%>
	            		
                                <h3 style="margin-top: 5px;margin-bottom: 5px;font-weight: bold;"><a href="AllAnswer?id=<%=i%>&cat=cat1" style="color: black"><%=qm.getQue()%></a></h3>

	            		<div class="row" style="padding-left: 5px;">

	            			<div class="col-md-1 col-sm-1"> 
                                            <img src="ImageLoader?uid=<%= qm.getTopAnswerer() %>" alt="Circle Image" class="rounded-circle img-responsive">
	            			</div>
	            			<div class="col-md-11 col-sm-11" style="padding-left: 1px;">
	            				<%if(qm.getAnswererName().equals("No one")){%><a style="color: #0099cc;"> <%= qm.getAnswererName() %></a><script>isNoOne=true;</script><%}else{%><a href="UserProfile?uid=<%= qm.getTopAnswerer() %>" style="color: #0099cc;"> <%= qm.getAnswererName() %></a><%}%> answered
	            				<br><span class="ansImg" ></span><div class="lead ans" style="margin-bottom: 1px;"></div>	    
	            			<!--  	<a class="read" onclick="show('ans<%=i%>','read<%=i%>')" href="#no">Read more</a>  -->
                                 <a class="read" href="#no" style="color: #0099cc;" onclick="instantiateEditor('<%=i%>')">Read more</a><br>               
                                                <script>
                                    
                                              
									if(!isNoOne)
									{
										quillAnswers.push(<%= qm.getMostUpvotedAnswer() %>);
		
									}
									else
									{
										quillAnswers.push({"ops":[{"insert":""}]});
										document.getElementsByClassName("read")[<%=i%>].innerHTML="";
										isNoOne=false;
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
	            				<hr>        				
           		 			

	            			</div>

	            		</div>
            		</div>
    		    </div>
      		</div>
  		</div>
        <%i++;}%><script>
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
        
         }
        
        	
        
        </script><%}%>
       		    		<!--card-1-->		
    
             
                
                <!--/.Card-->
            </div>
            <!--First columnn-->
        
    <!--/.Content-->


   </main>
    <!--Footer-->
   <footer class="page-footer center-on-small-only mt-3" id="footer">

        <div class="container-fluid text-center" style="padding-bottom: 10px;">
            © 2017 Made with <i class="fa fa-heart" aria-hidden="true" style="color: #ff4444;"></i> by team Korero
        </div>
    <!--/.Copyright-->

</footer>
 <!--/.Footer-->

    <!-- SCRIPTS -->

    <!-- JQuery -->
    <!--<script type="text/javascript" src="MDB Free/js/jquery-2.2.3.min.js"></script>-->

    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="MDB Free/js/tether.min.js"></script>

    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="MDB Free/js/bootstrap.min.js"></script>

    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="MDB Free/js/mdb.min.js"></script>
    <script type="text/javascript" src="MDB Free/js/limittext.js"></script>
    <script>
    new WOW().init();
    $('.carousel').carousel({
  interval: 4000
})
    </script>
    
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


var isFollowed=<%= dcm.isIsFollowed() %>;

function setFollowButton()
{
    if(request.readyState===4 && request.status===200){
        document.getElementById("followbtn").value=request.responseText;
        if(request.responseText.search("FOLLOWED")!==-1)
        {
        isFollowed=true;
        <% dcm.setFollowersCount(dcm.getFollowersCount()+1); %>
        var count=document.getElementById("followers").innerHTML;
        console.log(count);
        document.getElementById("followers").innerHTML=parseInt(count)+1;
        }
        else if((request.responseText).search("FOLLOW")!==-1)
        {
        isFollowed=false;
        <% dcm.setFollowersCount(dcm.getFollowersCount()-1); %>;           
        var count=document.getElementById("followers").innerHTML;
        console.log(count);
        document.getElementById("followers").innerHTML=parseInt(count)-1;
        }
         
    }
}

        </script>
        
        <script>
             
             
           
            if(isFollowed===true)
                document.getElementById("followbtn").value="FOLLOWED";
            else if(isFollowed===false)
                document.getElementById("followbtn").value="FOLLOW";
            
            console.log("initial---->"+isFollowed);
        </script>

</body>

</html>