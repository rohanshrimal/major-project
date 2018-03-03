<%@page import="model.StudentModel"%>
<%@page import="model.FacultyModel"%>
<%@page import="model.DomainModel"%>
<%@page import="model.BlogModel"%>
<%@page import="model.AllBlogModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.AnswerModel"%>
<%@page import="model.QuestionAnswerModel"%>
<%@page import="model.AllAnswerModel"%>
<%@page import="model.QuestionModel"%>
<%@page import="model.UserModel"%>
<%@page import="model.RelatedQuestionModel"%>
<!doctype html>
<%
    UserModel mymodel=(UserModel)session.getAttribute("mymodel");
    RelatedQuestionModel rqm=(RelatedQuestionModel)session.getAttribute("myquestions");
    QuestionAnswerModel qam=(QuestionAnswerModel)session.getAttribute("myanswers");
    AllBlogModel abm=(AllBlogModel)session.getAttribute("myblogs");
    ArrayList<AnswerModel> alam=qam.getAlam();
    ArrayList<QuestionModel> alqm=qam.getAlqm();
    DomainModel dm=(DomainModel)session.getAttribute("myworkspaces");
    
    RelatedQuestionModel rqm1=new RelatedQuestionModel();
    if(alqm!=null)
        rqm1.setRelatedque(alqm);
    session.setAttribute("relques", rqm);
    session.setAttribute("relques1", rqm1);
    
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


<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="MDB Free/img/img1.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Korero</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />

	<!--     Fonts and icons     -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
	<link rel="stylesheet" href="MDB Free/font-awesome-4.7.0/css/font-awesome.min.css" />

	<!-- CSS Files -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/material-kit.css" rel="stylesheet"/>
    
     <script src="https://cdn.quilljs.com/1.2.3/quill.js"></script>
     <script src="https://cdn.quilljs.com/1.2.3/quill.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
     <link href="https://cdn.quilljs.com/1.1.3/quill.snow.css" rel="stylesheet">
     <link href="https://cdn.quilljs.com/1.1.3/quill.bubble.css" rel="stylesheet">
	
	 <style type="text/css">
    	
        .limittext {
    white-space: nowrap; 
    width: 100%; 
    overflow: hidden;
    text-overflow: ellipsis; 
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

.profile-page .gallery img {
  width: auto;
  margin-bottom: 30px;
}


.ans, .editormyans, .myblogeditor{
		  font-family: "roboto";
		  font-size: 21px;
		  font-weight: 300;
		  word-wrap: break-word;
	}
	
	b, strong {
    font-weight: bold;
}

pre{

font-size: 90%;
}

.ql-container.ql-snow {
    border: 0px solid #ccc;
}

    </style>
    
     

</head>

<body class="profile-page">
         <div id="toolbarque" style="display: none"></div>
         <div id="editorque" style="display: none"></div>
         
         <script>
         
         var isNoOne=false;
         var quillAnswers=[];
         
            var toolbarOptions =[
                ['bold','italic','underline','strike'], 
                ['blockquote','code-block'],
                [{'header' : [1,2,3,4,5,6,false] }],
                [{'list': 'ordered'},{'list': 'bullet'}],
                [{'script': 'sub'},{'script': 'super'}],
                [{'indent': '-1'},{'indent': '+1'}],
                [{'direction': 'rtl'}],
                [{'size': ['large','huge']}],
                ['link','image','video','formula'],
                [{'align': []}]
            ];
            
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

            var configwithtool = {
                "theme": "snow",
                "modules": {
                "toolbar": toolbarOptions
               
  },
               "placeholder": 'Write your answer here...'
               
};
           
    
    $('#submit').click(function(){
        
        window.delta=quill.getContents();
        
        $.ajax({
        url: "UpdateMyAnswer?ansindex=",
        type: 'POST',
        dataType: 'json',
        
        data: JSON.stringify(delta),
        contentType: 'application/json',
        mimeType: 'application/json',
        success : function(data) {
            
	}
        });
        
      });
      
      
      function setArg(i){
        window.delta=quill.getContents();
         $.ajax({
        url: "UpdateMyAnswer?ansindex="+i,
        type: 'POST',
        dataType: 'json',
        
        data: JSON.stringify(delta),
        contentType: 'application/json',
        mimeType: 'application/json',
        success : function(data) {
            location.reload();
            
	}
        });}
        
        var quill;
        function edit(i)
            {
            quill=new Quill('#editor'+i,config);
            console.log(quill);
        }
        
            function update(i)
            {
            quill=new Quill('#editor'+i,configwithtool);
            console.log(quill);
        }
        
    
    
            console.log(typeof toolbarOptions);
           
        var quillque;
            quillque=new Quill('#editorque',configque);
            console.log("quillque"+quillque);            
        
        </script>
        
        
         
	<nav class="navbar navbar-info navbar-transparent navbar-fixed-top navbar-color-on-scroll">
    	<div class="container">
        	<!-- Brand and toggle get grouped for better mobile display -->
        	<div class="navbar-header">
        		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example">
            		<span class="sr-only">Toggle navigation</span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
        		</button>
        		<a class="navbar-brand" href="MyFeed">
                <img src="MDB Free/img/logo.png" class="img-fluid" style="width: 180px">
            </a>
        	</div>

        	<div class="collapse navbar-collapse" id="navigation-example">
        		<ul class="nav navbar-nav navbar-right">
					<li>
    					<a href="MyFeed">
    						Home
    					</a>
    				</li>
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
        	</div>
    	</div>
    </nav>

    <div class="wrapper">
		

		<div class="header header-filter" style="background-image: url('img/testd.jpg');">
		<div class="container">
		<br><br><br>
			<div class="col-md-4 text-center"><h2 style="font-weight: bold;color: #ffffff;">Questions Asked:</h2>
				<br><label class="label label-info" style="font-size: 50px;"><%= rqm.getRelatedque().size() %></label>
			</div>
			<div class="col-md-4 text-center"><h2 style="font-weight: bold;color: #ffffff;">Answers Written:</h2>
				<br><label class="label label-info" style="font-size: 50px;"><%= qam.getAlam().size() %></label>
			</div>
			<div class="col-md-4 text-center"><h2 style="font-weight: bold;color: #ffffff;">Blogs: </h2>
				<br><label class="label label-info" style="font-size: 50px;"><%= abm.getAbm().size() %></label>
			</div>
		</div>
</div>

		<div class="main main-raised">
			<div class="profile-content">
	            <div class="container">
	                <div class="row">
	                    <div class="profile">
	                        <div class="avatar">
	                            <img src="ImageLoader?uid=<%= mymodel.getUid() %>" alt="Circle Image" class="img-circle img-responsive img-raised">
	                        </div>
	                        <div class="name">
	                            <h3 class="title"><%= mymodel.getUname() %></h3>
								<h6><%= mymodel.getUtype()+" | "+ mymodel.getDept() %>
                                                                <%if(mymodel.getUtype().equals("Student")){%>
                                                                | Semester <%= mymodel.getSem() %></h6>
                                                                <%}%>
                            <button class="btn btn-info btn-sm" id="followbtn" style="font-size: 16px" onclick="followUser('<%=mymodel.getUid()%>')"></button>
	                        </div>
	                    </div>
	                </div>
	                <div class="description text-center">
                        <p><%= mymodel.getAboutme() %></p><br>
	                </div>
					
					<div class="row">
						<div class="col-md-10 col-md-offset-1">
							<div class="profile-tabs">
			                    <div class="nav-align-center">
									<ul class="nav nav-pills nav-pills-info" role="tablist">
										<li class="active">
											<a href="#questions" role="tab" data-toggle="tab">
												<i class="material-icons">camera</i>
												Questions
											</a>
										</li>
										<li>
				                            <a href="#work" role="tab" data-toggle="tab">
												<i class="fa fa-pencil"></i>
				                                Answers
				                            </a>
				                        </li>

										<li>
				                            <a href="#shows" role="tab" data-toggle="tab">
												<i class="material-icons">palette</i>
												Workspaces
				                            </a>
				                        </li>
				                        <li>
				                            <a href="#blog" role="tab" data-toggle="tab">
												<i class="material-icons">favorite</i>
				                                Blogs
				                            </a>
				                        </li>
				                        
				                    </ul>

				                    <div class="tab-content gallery">
                                                        <div class="tab-pane active" id="questions">
                                                        <%if(rqm!=null){int i=0;for(QuestionModel qm: rqm.getRelatedque()){%>
				                        <div class="row">
										<div class="col-md-12">
										 <div class="card card-content" style="text-align: left;">
						                    <div class="category" style="margin-top: 15px;margin-left: 20px;"><a style="color: #0099cc;"><%=mymodel.getUname() %></a> asked in 
						                    	<label class="label label-info"><a href="WorkSpaceContent?did=<%= qm.getDomain() %>&dname=<%= qm.getdName() %>" style="color: #FFFFFF;"><%=qm.getdName()%></a></label> with 
						                       <%for(String tags:qm.getTags()){%>
                                                                        <label class="label" style="background-color: #ff5d00;"><%=tags%></label>
						                        <%}%>
						            		</div>
                                                                        <h3 style="margin-top: 10px;margin-bottom: 5px;margin-left: 20px; font-weight: bold;"><a href="AllAnswer?id=<%=i%>&cat=cat1" style="color:black"><%=qm.getQue() %></a></h3>

						            		<div class="row" style="padding-left: 5px;">

						            			<div class="col-md-1 col-sm-1"> 
						            				<img src="ImageLoader?uid=<%= qm.getTopAnswerer() %>" alt="Circle Image" class="img-circle img-responsive" style="margin-left: 10px;">
						            			</div>
						            			<div class="col-md-11 col-sm-11" style="padding-left: 1px;">
                                                                                   <%if(qm.getAnswererName().equals("No one")){%><a style="color: #0099cc;"> <%= qm.getAnswererName() %></a><script>isNoOne=true;</script><%}else{%><a href="UserProfile?uid=<%= qm.getTopAnswerer() %>" style="color: #0099cc;"> <%= qm.getAnswererName() %></a><%}%> answered
                                                                                   <br><span class="ansImg" ></span><div class="lead ans" style="margin-bottom: 1px;"></div>
													<a class="read" href="#no" style="color: #0099cc;" onclick="instantiateEditor('<%=i%>')">Read more</a><br>
													<!--  <a class="read" href="#no" style="color: #0099cc;" onclick="show('ans<%=i%>','read<%=i%>')">Read more</a> -->
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
                                                                                            
                                                                                            if(content.length>250)
    	                                                                                        c[<%=i%>].innerText=content.substr(0,250)+"...";
    		                                                                                    
    		                                                                                    else
    		                                                                                    c[<%=i%>].innerText=content;
                                                                                        </script>	
                                                                                </div>
						            		</div>
					            		
						            		<div class="card-footer">
												<div class="stats">
													<i class="material-icons">update</i> <%= qm.getQuedate() %>
												</div>
											</div>
					        		    </div>
        		    		<!--card-1-->		
									</div>
								</div>
                                                        <hr>
                                                               <%i++;}%>
        <script>
        var ansElements = document.querySelectorAll('.ans');
        var readElements = document.querySelectorAll('.read');
       
        for (var i = 0; i < ansElements.length; i++)
        {
            readElements[i].id = 'read' + i;
            ansElements[i].id = 'ans' + i;
        
         }
        
        
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
    
        </script><%}%>
				                        </div>
				                        <div class="tab-pane" id="work">
										<%if(qam!=null){int i=0;for(QuestionModel qm : qam.getAlqm()){%><div class="row">
										<div class="col-md-12">
										 <div class="card card-content" style="text-align: left;">
						                    <div class="category" style="margin-top: 15px;margin-left: 20px;"><a href="UserProfile?uid=<%= qm.getUid() %>" style="color: #0099cc;"> <%= qm.getUname() %></a> asked in 
						                    	<label class="label label-info"><a href="WorkSpaceContent?did=<%= qm.getDomain() %>&dname=<%= qm.getdName() %>" style="color: #FFFFFF;"><%= qm.getdName() %></a></label> with 
						                        <%for(String tags: qm.getTags()){%>
                                                                        <label class="label" style="background-color: #ff5d00;"><%=tags%></label>
						                        <%}%>
						            		</div>
                                                                        <h3 style="margin-top: 10px;margin-bottom: 5px;margin-left: 20px; font-weight: bold;"><a href="AllAnswer?id=<%=i%>&cat=cat2" style="color:black"><%= qm.getQue() %></a></h3>

						            		<div class="row" style="padding-left: 5px;">

						            			<div class="col-md-1 col-sm-1"> 
						            				<img src="ImageLoader?uid=<%= mymodel.getUid() %>" alt="Circle Image" class="img-circle img-responsive" style="margin-left: 10px;">
						            			</div>
						            			<div class="col-md-11 col-sm-11" style="padding-left: 1px;">
                                                                                    <a style="color: #0099cc;"> <%= mymodel.getUname() %></a> answered
						            				<div class="lead" style="margin-bottom: 1px;"> 
                                                                                            <!--<button class="btn btn-info btn-sm" onclick="showAns(<%=i%>)"><i class="fa fa-pencil"></i></button>-->
      
        <form class="edittext">
        <div class="toolbarmyans"></div>
        <div class="editormyans"></div>
        <!--<input type="button" class="btn btn-info btn-sm updatebtn" value="update" style="display: none" onclick="setArg(<%=i%>)"/>-->

        </form>
        
                                                                                        </div>
						            			</div>
						            		</div>
					            		
						            		<div class="card-footer">
												<div class="stats">
                                                                                                    <i class="material-icons">update</i> <%= alam.get(i).getAnsDate() %>
												</div>
											</div>
					        		    </div>
        		    		<!--card-1-->		
									</div>
        </div><hr><%i++;}}%>
												</div>
			                        <div class="tab-pane" id="blog">
<!--    <button id="BlogBtn" onclick="showBlog()" class="btn btn-info btn-sm">Write Blog..</button><br><br>
        <form id="blogform" style="display: none">
        Select Blog Domain<select name="cars" id="blogdid">
    <option value="1">Computer science</option>
    <option value="2">Mechanical</option>
    <option value="3">Information Technology</option>
    <option value="4">Electrical</option>
    <option value="5">Electronics</option>
    <option value="6">Fire Tech</option>
    <option value="7">Chemical</option>
    <option value="8">Civil</option>
    <option value="9">Library</option>
    <option value="10">Sports</option>
    <option value="11">Placement Cell</option>
    <option value="12">Accounts</option>
    <option value="13">Admission Cell</option>
    <option value="14">Scholarship</option>
    <option value="15">Moonstone</option>
    <option value="17">Hostel</option>
    <option value="18">Transportation</option>
    <option value="19">Music Club</option>
    <option value="20">Dance Club</option>
    <option value="21">Literary Club</option>
    <option value="22">STIC</option>
    <option value="24">E-Cell</option>
    <option value="25">Canteen</option>
    <option value="26">Korero</option>
    <option value="27">Other</option>
        </select>&nbsp;&nbsp;&nbsp; 
        Blog Title<input type="text" id="blogtitle"/><br><br>
        <div id="blogtoolbar"></div>
        <div id="blogeditor"></div>
        <br>
        <input type="button" class="btn btn-info btn-sm" value="Post Blog" onclick="postBlog()"/>
        </form>-->
                                                                        <%if(abm!=null){int i=0;for(BlogModel bm : abm.getAbm()){%>
										<div class="row">
										<div class="col-md-12">
										 <div class="card card-content" style="text-align: left;">
						                    <div class="category" style="margin-top: 15px;margin-left: 20px;"><a style="color: #0099cc;"> <%= mymodel.getUname() %> </a>wrote in 
						                    	<label class="label label-info"><a href="WorkSpaceContent?did=<%= bm.getDid() %>&dname=<%= bm.getDname() %>" style="color: #FFFFFF;"> <%= bm.getDname() %></a></label>
						            		</div>
						                        <h3 style="margin-top: 10px;margin-bottom: 5px;margin-left: 20px; font-weight: bold;"><%= bm.getTitle() %></h3>
                                                                        

                                                                        <div class="lead" style="margin-bottom: 1px;margin-left: 20px;">
<!--                                                                         <button onclick="showmyblog(<%=i%>)" class="btn btn-info btn-sm"><i class="fa fa-pencil"></i></button>-->
        <div class="myblogtool"></div>
        <div class="myblogeditor"></div>
<!--        <input type="button" class="btn btn-info btn-sm updateblog" value="update" style="display: none" onclick="setblogarg(<%=i%>)"/>   -->
                                                                        </div>
						            		
						            		<div class="card-footer">
												<div class="stats">
													<i class="material-icons">update</i> <%= bm.getTimestamp() %>
												</div>
											</div>
					        		    </div>
        		    		<!--card-1-->		
									</div>
								</div><hr><% i++;}}%>
												</div>
										<div class="tab-pane text-center" id="shows">
											<div class="row">
												 <table class="table">
                                                                                            <% for(int i=0;i<dm.getDomainList().size();i++) {%>
                                                                                            <tr>
                                                                                                <td> <img src="imagesdomain/<%= dm.getDomainImg().get(i) %>" class="img-rounded" style="width: 150px; height: 150px"/></td>
                                                                                                
                                                                                                
                                                                                                <td>  <h2> <button class="btn btn-info btn-lg"><a href="WorkSpaceContent?did=<%= dm.getDomainIdList().get(i) %>&dname=<%= dm.getDomainList().get(i) %>" style="text-decoration: none;color: white;font-size: 16px"><%= dm.getDomainList().get(i) %></a></button></h2></td>
                                                                                                
                                                                                    </tr>
                                                                                    
                                                                                               <%}%>
                                                                                    </table>  
											</div>
				                        </div>

				                    </div>
								</div>
							</div>
							<!-- End Profile Tabs -->
						</div>
	                </div>

	            </div>
	        </div>
		</div>

    </div>
    <footer class="footer">
        <div class="container">
            
            <div class="copyright pull-right">
                &copy; 2017, made with <i class="fa fa-heart heart"></i> by team Korero
            </div>
        </div>
    </footer>
                                                       




	<script src="js/jquery.min.js" type="text/javascript"> </script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/material.min.js"></script>

	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="js/nouislider.min.js" type="text/javascript"></script>


	<!-- Control Center for Material Kit: activating the ripples, parallax effects, scripts from the example pages etc -->
	<script src="js/material-kit.js" type="text/javascript"></script>
	<script src="MDB Free/js/limittext.js"></script>
        
        
        <script>
        var toolbarElements = document.querySelectorAll('.toolbarmyans');
        var editorElements = document.querySelectorAll('.editormyans');
        var formElements = document.querySelectorAll('.edittext');
        for (var i = 0; i < editorElements.length; i++)
        {
            toolbarElements[i].id = 'toolbar' + i;
            editorElements[i].id = 'editor' + i;
            formElements[i].id=i;
            
        }
        
        <%for(int i=0;i<alam.size();i++){%>
        edit(<%=i%>);
        quill.setContents(<%=alam.get(i).getAnswer()%>);
        quill.enable(false);
        <%}%>
        </script>
        
        <script>
            function showAns(i)
            {
                var btn=document.getElementsByClassName("updatebtn");
                 
        if(btn[i].style.display==="block")
        {
            btn[i].style.display="none";
            var id='toolbar'+i;
    
            var elems = document.getElementsByClassName("ql-toolbar ql-snow");
    for (var k = elems.length - 1; k >= 0; k--) {
        var parent = elems[k].parentNode;
        parent.removeChild(elems[k]);
    }
            
            edit(i);
            quill.enable(false);
        }
        else if(btn[i].style.display==="none")
        {
            btn[i].style.display="block";
            update(i);
            var id='editor'+i;
            document.getElementById(id).className = "editormyans ql-container ql-snow";
        }
    }
        </script>
        
       
       <script>
            var toolbarOptionsBlog =[
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
            
            var configblog = {
                "theme": "snow",
                "modules": {
                "toolbar": toolbarOptionsBlog
               
  },
               "placeholder": 'Write your blog here...'
};

            var configforshowblog = {
                "theme": "snow",
                "modules": {
                "toolbar": false
               
  },
               "placeholder": 'Write your blog here...'
};

          //  console.log(typeof toolbarOptionsBlog);
            var quillblog;
          //  quillblog=new Quill('#blogeditor',configblog);
            
            function instantiatequill()
            {
            var quillblog1;
            quillblog1=new Quill('#blogeditor',configblog);
            }
//            function showBlog()
//            {
//            if(document.getElementById("blogform").style.display==="none")
//            document.getElementById("blogform").style.display="block";
//        
//            else if(document.getElementById("blogform").style.display="block")
//            document.getElementById("blogform").style.display="none";    
//            //quill.enable(false);
//            }
      
      var TT;
      
//       function postBlog(){
//        window.delta=quillblog.getContents();
//        console.log(delta);
//         $.ajax({
//        url: "PostBlog?did="+document.getElementById("blogdid").value+"&title="+document.getElementById("blogtitle").value,
//        type: 'POST',
//        dataType: 'json',
//        
//        data: JSON.stringify(delta),
//        contentType: 'application/json',
//        mimeType: 'application/json',
//        success : function(data) {
//            location.reload();
//            
//	}
//        });
//        
//    }
    
    function setblogarg(i){
        window.delta=quillForShowBlog.getContents();
         $.ajax({
        url: "UpdateMyBlog?blogindex="+i,
        type: 'POST',
        dataType: 'json',
        
        data: JSON.stringify(delta),
        contentType: 'application/json',
        mimeType: 'application/json',
        success : function(data) {
            location.reload();
            
	}
        });
    }  
    
    var quillForShowBlog;
    
     function editblog(i)
            {
            quillForShowBlog=new Quill('#editorblog'+i,configforshowblog);
            
        }
        
         function updateblog(i)
            {
            quillForShowBlog=new Quill('#editorblog'+i,configblog);
            console.log(quill);
        }
        </script>
        
        <script>
        var toolbarblogElements = document.querySelectorAll('.myblogtool');
        var editorblogElements = document.querySelectorAll('.myblogeditor');

        for (var i = 0; i < editorblogElements.length; i++)
        {
            toolbarblogElements[i].id = 'toolbarblog' + i;
            editorblogElements[i].id = 'editorblog' + i;
        }
        
        <%for(int i=0;i<abm.getAbm().size();i++){%>
        editblog(<%=i%>);
        quillForShowBlog.setContents(<%=abm.getAbm().get(i).getBlogContent()%>);
        quillForShowBlog.enable(false);
        <%}%>
        </script>
        
     <script>
            function showmyblog(i)
            {
                var btn=document.getElementsByClassName("updateblog");
                 
        if(btn[i].style.display==="block")
        {
            btn[i].style.display="none";
            var id='toolbarblog'+i;
    
            var elems = document.getElementsByClassName("ql-toolbar ql-snow");
    for (var k = elems.length - 1; k >= 0; k--) {
        var parent = elems[k].parentNode;
        parent.removeChild(elems[k]);
    }
            instantiatequill();
            editblog(i);
            quillForShowBlog.enable(false);
        }
        else if(btn[i].style.display==="none")
        {
            btn[i].style.display="block";
            updateblog(i);
            var id='editorblog'+i;
            document.getElementById(id).className = "myblogeditor ql-container ql-snow";
        }
    }
            
            
            
            var isfollowed= <%=mymodel.isFollowed()%>;

            var id=document.getElementById("followbtn");

            if(isfollowed==true)
            {
            	id.innerHTML="FOLLOWED";
            }
            else
            {
            	id.innerHTML="FOLLOW";
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

            function followUser(uid)
            {
            	console.log(uid);
                request=getXmlHttpRequestObject();
                request.onreadystatechange=userFollowed;
                request.open("post","FollowUser",true);
                request.setRequestHeader ("Content-Type", "application/x-www-form-urlencoded");
                
                var data="uid="+uid+"&isfollowed="+isfollowed;
                request.send(data);
            }

            function userFollowed()
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
        
        
</body>
</html>
