<%@page import="model.FacultyModel"%>
<%@page import="model.StudentModel"%>
<!DOCTYPE html>
<%
Cookie c[]=request.getCookies();
String id="",pwd="";
if(c!=null)
{    
    for(int i=0;i<c.length;i++)
    {
        String name=c[i].getName();
        if(name.equals("uid"))
            id=c[i].getValue();
    
        else if(name.equals("pwd"))
            pwd=c[i].getValue();
    }
}    
%>

<%
String qc=request.getParameter("qc");
String ac=request.getParameter("ac");
String uvc=request.getParameter("uvc");
String uc=request.getParameter("uc");
String tc=request.getParameter("tc");
String bc=request.getParameter("bc");
String pc=request.getParameter("pc");
String boc=request.getParameter("boc");
String cat=request.getParameter("cat");
%>
<%
String utype=(String)session.getAttribute("utype");
Object umodel=session.getAttribute("userModel");
String ustatus=(String)session.getAttribute("ustatus");
if(umodel!=null && ustatus!=null && ustatus.trim().equals("4"))
{
    response.sendRedirect("MyFeed");
}
%>
<html lang="en">

<head>
   
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/png" href="MDB Free/img/img1.png" />
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    
    <title>Korero</title>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="MDB Free/font-awesome-4.7.0/css/font-awesome.min.css">

    <!-- Bootstrap core CSS -->
    <link href="MDB Free/css/bootstrap.min.css" rel="stylesheet">

    <!-- Material Design Bootstrap -->
    <link href="MDB Free/css/mdb.min.css" rel="stylesheet">

    <!-- Your custom styles (optional) -->
    <link href="MDB Free/css/iam.css" rel="stylesheet">

</head>

<body>
    <header>
        <!--Navbar-->
        <nav class="navbar navbar-toggleable-md navbar-dark fixed-top bg-info">
            <div class="container">
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNav1" aria-controls="navbarNav1" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                 <a class="navbar-brand" href="index.html">
                <img src="MDB Free/img/logo.png" class="img-fluid" style="width: 180px">
            </a>
                <div class="collapse navbar-collapse" id="navbarNav1">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a href="index.html" class="nav-link">Home </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="GetStarted.jsp">Get started</a>
                        </li>
                         <li class="nav-item active">
                        <a class="nav-link">Log In<span class="sr-only">(current)</span></a>
                    </li>
                        <li class="nav-item">
                            <a class="nav-link" href="About.jsp">About Us</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!--/.Navbar-->
    </header>

    <main style="background-image: url('img/testd.jpg');">          

        <div class="container">
            
            <div class="row">
             <div class="view hm-stylish-strong mask animated slideInLeft">
                        <div class="mask">
                            <p class="white-text">strong overlay</p>
                        </div>
   
                <div class="col-md-5">
                    <span2>
                        <p class="text-center pb-0 mb-0">
                        <i class="fa fa-circle-o-notch fa-spin fa-fw"></i>
                        <span class="sr-only">Loading...</span><label class="badge badge-info">We Have</label>
                        <i class="fa fa-circle-o-notch fa-spin fa-fw"></i>
                        <span class="sr-only">Loading...</span></p>
                        <b>
                          <span1 class="text-center">
                            
                            <label class="badge badge-info"><%=uc%>+ </label> Users<br />
                            <label class="badge badge-info"><%=uvc%>+ </label> Voilà's<br />
                            <label class="badge badge-info"><%=bc%>+ </label> Blogs<br />
                            <label class="badge badge-info"><%=pc%>+</label> Polls<br />
                            <label class="badge badge-info"><%=qc%>+</label> Questions<br />
                            <label class="badge badge-info"><%=tc%>+</label> Tags<br />
                            <label class="badge badge-info"><%=boc%>+</label> Advises<br />
			    <label class="badge badge-info"><%=ac%>+</label> Answers<br />
                      
                        </span1>
                        </b>
                    </span2>
                    </div>
                </div>

                <div class="col-md-7">
                 <div class="row" style="margin-top: 100px;">
                 <div class="col-md-2"></div>
                 <div class="col-md-10">
                    <!--Form with header-->
                    <div class="card animated fadeInDown">
                        <div class="card-block">
                        <br>
                            <!--Header-->
                            <div class="form-header blue lighten-2">
                                <h3><i class="fa fa-lock"></i> Login:</h3>
                            </div>
                            <!--Body-->
                            
                            <form action="VerifyUser" method="post">             
                            <div class="md-form animated fadeIn" style="animation-delay: 0.6s;">
                                <i class="fa fa-user prefix"></i>
                                <input type="text" name="id" id="form2" class="form-control" value="<%=id%>" required>
                                <label for="form2">Your User Id</label>
                                </div>
                            
                            <div class="md-form animated fadeIn" style="animation-delay: 0.7s;">
                                <i class="fa fa-lock prefix"></i>
                                <input type="password" name="pwd" id="form4" value="<%=pwd%>" class="form-control">
                                <label for="form4">Your password</label>
                            </div>
                         
                            <br>
							<input type="checkbox" name="rememberme" value="yes"/> REMEMBER-ME<br>
                            <div class="text-center">
                                <button class="btn btn-primary animated fadeInUp" type="submit" style="animation-delay: 0.8s;">Login</button>
                            </div>
                            </form>
                            <br>
                            <hr>
                            
                            Not a member?<a href="" data-toggle="modal" data-target="#myModal"> Sign up</a><br><br>
                            Forgot password?<a href="ForgotPassword.jsp"> Recover here</a>

                        </div>
                    </div>
                    <!--/Form with header-->
                </div>
            </div>
            </div>
            </div>
        </div>
                            
                       
    </main>

                            <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <!--Content-->
        <div class="modal-content">
            <!--Header-->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title w-100" id="myModalLabel">&nbsp; Hello! Choose your User Type</h4>
            </div>
            <!--Body-->
            <div class="modal-body text-center">
                
                <button type="button" onclick="setType('faculty')" class="btn btn-primary">Faculty</button>
            <button type="button" onclick="setType('student')" class="btn btn-info">Student</button>
            
            </div>
            <!--Footer-->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                
            </div>
        </div>
        <!--/.Content-->
    </div>
</div>
                            
                            
    <!--Footer-->
   <footer class="page-footer center-on-small-only mt-0 bg-info" id="footer">

        <div class="container-fluid text-center" style="padding-bottom: 10px;">
            © 2017 Made with <i class="fa fa-heart" aria-hidden="true" style="color: #ff4444;"></i> by team Korero
        </div>
    <!--/.Copyright-->

</footer>
 <!--/.Footer-->


    <!-- SCRIPTS -->

    <!-- JQuery -->
    <script type="text/javascript" src="MDB Free/js/jquery-2.2.3.min.js"></script>

    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="MDB Free/js/tether.min.js"></script>

    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="MDB Free/js/bootstrap.min.js"></script>

    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="MDB Free/js/mdb.min.js"></script>

<!--    <script type="text/javascript">
         function validateForm() {
    var e = document.forms["email"]["emailcontrol"].value;
    var p = document.forms["password"]["passvalidate"].value;

    if (e=="") {
        alert("Mandatory fields must be filled out");
        return false;
    }
    var atpos = e.indexOf("@");
    var dotpos = e.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=e.length ||dotpos.length>3) {
        alert("Not a valid e-mail address");
        return false;
    }
    if (p.length<9) {
        alert("password must be greater than 8 characters");
    }
 
}
    </script>-->

<script>
    function setType(type)
    {
        window.location.href="KoreroContent?utype="+type;
    }
    var cat="<%=cat%>";
    if(cat!==null && cat==="invalid")
        alert("Invalid User details");
    else if(cat!==null && cat==="mailsent")
        alert("Password has been sent to your registered mail id");
</script>

 
</body>

</html>