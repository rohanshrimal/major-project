<%@page import="model.BlogModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.AllBlogModel"%>
<!DOCTYPE html>
<html lang="en">

    <%
    AllBlogModel abm=(AllBlogModel)session.getAttribute("domainblogs");
    ArrayList<BlogModel> albm=abm.getAbm();
    String dname=request.getParameter("dname");
    String did=request.getParameter("did");
    String domain[]=dname.split(" ");
    dname="";
    for(String d:domain)
    {
        dname+=d.charAt(0)+d.substring(1).toLowerCase()+" ";
    }
    %>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/png" href="MDB Free/img/img1.png" />
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>Korero</title>

      <script src="js/jquery-1.10.2.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/autocompleter.js"></script>
        <link rel="stylesheet" href="js/jquery-ui.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="MDB Free/font-awesome-4.7.0/css/font-awesome.min.css">

    <!-- Bootstrap core CSS -->
    <link href="MDB Free/css/bootstrap.min.css" rel="stylesheet">

    <!-- Material Design Bootstrap -->
    <link href="MDB Free/css/mdb.min.css" rel="stylesheet">
    
    <link href="MDB Free/css/blogstyle.css" rel="stylesheet">
    
    
    <script src="https://cdn.quilljs.com/1.2.3/quill.js"></script>
    <script src="https://cdn.quilljs.com/1.2.3/quill.min.js"></script>
<!--    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>-->
    <link href="https://cdn.quilljs.com/1.1.3/quill.snow.css" rel="stylesheet">
    <link href="https://cdn.quilljs.com/1.1.3/quill.bubble.css" rel="stylesheet">

    <!-- Template styles -->
    <style rel="stylesheet">
        /* TEMPLATE STYLES */
        
        main {
            padding-top: 3rem;
            padding-bottom: 2rem;
        }
        
        .widget-wrapper {
            padding-bottom: 2rem;
            border-bottom: 1px solid #e0e0e0;
            margin-bottom: 2rem;
        }
        
           
        footer.page-footer {

            margin-top: 2rem;
         
        }
    </style>
 
</head>

<body>


    <header>

        <!--Navbar-->
        <nav class="navbar fixed-top navbar-toggleable-md navbar-dark bg-info">
            <div class="container">
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNav1" aria-controls="navbarNav1" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                 <a class="navbar-brand" href="MyFeed">
                <img src="MDB Free/img/logo.png" class="img-fluid" style="width: 180px">
            </a>
                <div class="collapse navbar-collapse" id="navbarNav1">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a href="MyFeed" class="nav-link">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a href="MyProfile" class="nav-link">Profile</a>
                        </li>
                        <li class="nav-item">
                            <a href="Post_Question.jsp" class="nav-link">Ask a question</a>
                        </li>
                        
                         <li class="nav-item">
                            <a href="AboutUs.jsp" class="nav-link">About Us</a>
                        </li>
                    </ul>
                    <form class="form-inline waves-effect waves-light" action="AskQuestion">
                        <input class="form-control search" type="text" id="search" name="search" placeholder="Search -- Question,  @Username,  #Workspaces" style="width: 400px;">
                        
                        <button class="btn btn-primary btn-sm" type="submit" ><i class="fa fa-search"></i></button>
                    </form>
                </div>
            </div>
        </nav>
	    <!--/.Navbar-->

    </header>

    <main>

        <!--Main layout-->
        <div class="container mt-2">
            <div class="row">
                <!--Main column-->
                <div class="col-lg-8">
                	<h1 class="h1-responsive animated fadeInDown" style="font-size: 72px;">Blogs <span style="font-size: 50px;float: right;"><small class="text-muted"><%= dname %></small></span></h1>
                	<hr class="my-2 mb-2" style="">
                    <!--Post-->
                    <% if(albm!=null){
                        int i=0;
                        for(BlogModel bm:albm){
                    %>
                    <div class="post-wrapper wow fadeIn" data-wow-delay="0.2s">
                        <!--Post data-->
                        <h2 class="h2-responsive" style="font-weight: bold;"><%= bm.getTitle().toUpperCase() %><small class="text-muted"></small></h2>
                        <h5>Written by <a href="UserProfile?uid=<%= bm.getUid() %>"><%= bm.getUname() %></a>, <%= bm.getTimestamp() %></h5>

                        <br>

<!--                        Featured image 
                        <div class="view overlay hm-white-light z-depth-1-half">
                            <img src="http://mdbootstrap.com/img/Photos/Slides/img%20(116).jpg" class="img-fluid " alt="">
                            <div class="mask">
                            </div>
                        </div>-->

                        <br>

                        <!--Post excerpt-->
                        <div class="blogtoolbar"></div>
                        <div class="blogeditor"></div>
                        
                        
                        <button value="upvote&bid=<%= bm.getBlogId() %>&index=<%=i%>" class="up btn btn-info" onclick="upvote(<%=i%>)"><i class="fa fa-smile-o"></i>&nbsp;&nbsp;Voilà!</button>
                        <span class="votecount"> <%=bm.getUpvotes()%></span>
                        <button value="downvote&bid=<%=bm.getBlogId() %>&index=<%=i%>"  class="down btn btn-unique " onclick="downvote(<%=i%>)"><i class=" fa fa-meh-o"></i>&nbsp;&nbsp;Bléh!</button>
                        
                        
                        <!--"Read more" button-->
<!--                        <button class="btn btn-info">Read more</button>-->
                    </div>
                        
                        
                    <!--/.Post-->

                    <hr class="my-2 mt-1">
                    <% i++;
                        }}%>
                    
<!--                    Pagination
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

                <!--Sidebar-->
                <div class="col-lg-4">

                    <div class="widget-wrapper wow fadeIn" data-wow-delay="0.4s">
                        <h4>Other suggested blogs:</h4>
                        <br>
                        <div class="list-group">
                            <a href="BlogContent?did=1" class="list-group-item active">Computer Science</a>
                            <a href="BlogContent?did=3" class="list-group-item">Information Technology</a>
                            <a href="BlogContent?did=2" class="list-group-item">Mechanical</a>
                            <a href="BlogContent?did=8" class="list-group-item">Civil</a>
                            <a href="BlogContent?did=4" class="list-group-item">Electrical</a>
                            <a href="BlogContent?did=5" class="list-group-item">Electronics</a>
                            <a href="BlogContent?did=24" class="list-group-item">Korero</a>
                            <a href="BlogContent?did=25" class="list-group-item">Other</a>
                        </div>
                    </div>



                    <div class="widget-wrapper wow fadeIn" data-wow-delay="0.6s">
                        <a href="WorkSpaceContent?did=<%= did %>&dname=<%= dname %>"><p>Go back to workspace <i class="fa fa-arrow-right"></i></p></a>
                        <a><p>Answer some questions <i class="fa fa-arrow-right"></i></p></a>
                        <a href="MyFeed"><p>Read your feed <i class="fa fa-arrow-right"></i></p></a>
                        <a href="MyProfile"><p>My profile <i class="fa fa-arrow-right"></i></p></a>

                    </div>

                </div>
                <!--/.Sidebar-->
            </div>
        </div>
        <!--/.Main layout-->

    </main>
   <!--Footer-->
   <footer class="page-footer center-on-small-only mt-0" id="footer">

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

    <script>
    new WOW().init();
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
    request.open("post","UpDownBlogs",true);
    request.setRequestHeader ("Content-Type", "application/x-www-form-urlencoded");
    
    var data="status="+val;
    request.send(data);
}

function downvote(x)
{   
    index=x;
    var down=document.getElementsByClassName("down");
    var val=down[x].value;
    request=getXmlHttpRequestObject();
    request.onreadystatechange=showVoteCount;
    request.open("post","UpDownBlogs",true);
    request.setRequestHeader ("Content-Type", "application/x-www-form-urlencoded");
    
    var data="status="+val;
    request.send(data);
}


function showVoteCount()
{
    if(request.readyState===4 && request.status===200){
        var p=document.getElementsByClassName("votecount");
        console.log(request.responseText);
        p[index].innerHTML=request.responseText;
    }
}

</script>
    
    
    <script>
            
            
            var configforshowblog = {
                "theme": "snow",
                "modules": {
                "toolbar": false
               
  }};
            function instantiatequill()
            {
            var quillblog1;
            quillblog1=new Quill('#blogeditor',configblog);
            }
      var TT;
      

    var quillForShowBlog;
    
     function editblog(i)
            {
            quillForShowBlog=new Quill('#editorblog'+i,configforshowblog);
            
            }
        var toolbarblogElements = document.querySelectorAll('.blogtoolbar');
        var editorblogElements = document.querySelectorAll('.blogeditor');

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
    
</body>

</html>