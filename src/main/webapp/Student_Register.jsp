<!DOCTYPE html>

<%
String quescount=request.getParameter("qc");
String upcount=request.getParameter("upc");
String usercount=request.getParameter("uc");
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
    <link rel="stylesheet" type="text/css" href="MDB Free/css/blogstyle.css">

    <!-- Template styles -->
    <style rel="stylesheet">
        /* TEMPLATE STYLES */
        /* Necessary for full page carousel*/
        
        html,
        body {
            height: 100%;
            background-color: #bbdefb;
        }
        /* Navigation*/
        
        .navbar {
            background-color: transparent;
        }
        
        .top-nav-collapse {
            background-color: #33b5e5;
        }
        
        footer.page-footer {
            background-color: #33b5e5;
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
    </style>

</head>

<body>


    <!--Navbar-->
    <nav class="navbar navbar-toggleable-md navbar-dark fixed-top scrolling-navbar">
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
                        <a class="nav-link" href="index.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="GetStarted.jsp">Get started</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="About.jsp">About Us</a>
                    </li>
                    <li class="nav-item ml-5 pl-5">
                        <a class="nav-link"><i class="fa fa-dot-circle-o"></i> Enter your details</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"><i class="fa fa-circle-o"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"><i class="fa fa-circle-o"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"><i class="fa fa-circle-o"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"><i class="fa fa-circle"></i></a>
                    </li>

                </ul>
            </div>
        </div>
    </nav>
    <!--/.Navbar-->

    <!--Carousel Wrapper-->
    <div id="carousel-example-3" class="carousel slide carousel-fade white-text" data-ride="carousel" data-interval="false">
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
            <div class="carousel-item active view hm-black-strong" style="background-image: url('img/testd.jpg'); background-repeat: no-repeat; background-size: cover;">
                
                <!-- Caption -->
                <div class="full-bg-img flex-center white-text">
                    <ul class="animated fadeIn col-md-12 mt-2">
                        <li>
                            <h1 class="h1-responsive" style="font-size: 60px;">People on Korero</h1>
                        </li>
                        <li>
                            <p>Total number of people experiencing this awesomeness</p>
                        </li>
                        <li>
                        <h1>
                           <label class="badge badge-info animated infinite jello"><%=usercount%></label>
                        </h1>
                        </li>
                    </ul>
                </div>
                <!-- /.Caption -->
                
            </div>
            <!--/.First slide-->

            <!-- Second slide -->
            <div class="carousel-item view hm-indigo-strong" style="background-image: url('img/testd.jpg'); background-repeat: no-repeat; background-size: cover;">
                
                <!-- Caption -->
                <div class="full-bg-img flex-center white-text">
                    <ul class="animated fadeIn col-md-12 mt-2">
                        <li>
                            <h1 class="h1-responsive" style="font-size: 60px;">Questions on Korero</h1>
                        </li>
                        <li>
                            <p>Total number of queries resolved</p>
                        </li>
                        <li>
                        <h1>
                           <label class="badge badge-info animated infinite tada"><%=quescount%></label>
                        </h1>
                        </li>
                    </ul>
                </div>
                <!-- /.Caption -->
                
            </div>
            <!--/.Second slide -->

            <!-- Third slide -->
            <div class="carousel-item view hm-teal-strong" style="background-image: url('img/testd.jpg'); background-repeat: no-repeat; background-size: cover;">
                
                <!-- Caption -->
                <div class="full-bg-img flex-center white-text">
                    <ul class="animated fadeIn col-md-12 mt-2">
                        <li>
                            <h1 class="h1-responsive" style="font-size: 60px;">Voilàs! on Korero</h1></li>
                        <li>
                            <p>The <i class="fa fa-smile-o"></i> shared on Korero</p>
                        </li>
                        <li>
                        <h1>
                           <label class="badge badge-info animated infinite rubberBand"><%=upcount%></label>
                        </h1>
                        </li>
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

    <!--Content-->
    <main>
    <div class="container mt-3">
        <div class="row">
        <div class="col-md-3"></div>
            <div class="col-md-6">
                <!--Form with header-->
                <div class="card">
                    <div class="card-block">
                        <!--Header-->
                        <div class="form-header" style="background-color: #33b5e5;">
                            <h3><i class="fa fa-user"></i> Register:</h3>
                        </div>

                        <!--Body-->
                        <form id='studentform' onsubmit="return validateForm();" method="post">
                        <div class="md-form wow fadeInDown">
                        
                            <i class="fa fa-user prefix"></i>
                            <input type="text" id='namevalidate' name="namevalidate"  class="form-control">
                            <label for="namevalidate" style="height: 19px;">Your name</label>
                        
                        </div>
                        <div class="md-form wow fadeInDown">
                        
                            <i class="fa fa-user prefix"></i>
                            <input type="text" id='idvalidate' onchange="checkUser()" name="idvalidate" class="form-control">
                            <label for="idvalidate" style="height: 19px;">ID</label>
                        
                        </div>

                        <div class="md-form wow fadeInDown">
                              
                                <i class="fa fa-envelope prefix"></i>
                                <input name="emailcontrol" id='emailcontrol' onchange="checkmail()" type="text" class="form-control">
                                <label for="emailcontrol" style="height: 19px;" data-error="wrong" data-success="right">Your email</label>
                            
                            
                        </div>
                        <div class="md-form wow fadeInDown">
                            <i class="fa fa-tag prefix"></i>
                            <li class="nav-item btn-group">
                                <a class="nav-link dropdown-toggle ml-5" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Branch</a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                    <a class="dropdown-item" id="cs" onclick="myfunct1(this.id);dep();">Computer Science</a>
                                    <a class="dropdown-item" id="it" onclick="myfunct1(this.id);dep();">Information Technology</a>
                                    <a class="dropdown-item" id="me" onclick="myfunct1(this.id);dep();">Mechanical</a>
                                    <a class="dropdown-item" id="ce" onclick="myfunct1(this.id);dep();">Civil</a>
                                    <a class="dropdown-item" id="el" onclick="myfunct1(this.id);dep();">Electrical</a>
                                    <a class="dropdown-item" id="ex" onclick="myfunct1(this.id);dep();">Electronics</a>
                                    <a class="dropdown-item" id="ft" onclick="myfunct1(this.id);dep();">Fire Tech & Safety</a>
                                </div>
                            </li>
                            <li class="nav-item btn-group">
                                <a class="nav-link dropdown-toggle" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Semester</a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                    <a class="dropdown-item" id="1" onclick="myfunct2(this.id);sem();">1</a>
                                    <a class="dropdown-item" id="2" onclick="myfunct2(this.id);sem();">2</a>
                                    <a class="dropdown-item" id="3" onclick="myfunct2(this.id);sem();">3</a>
                                    <a class="dropdown-item" id="4" onclick="myfunct2(this.id);sem();">4</a>
                                    <a class="dropdown-item" id="5" onclick="myfunct2(this.id);sem();">5</a>
                                    <a class="dropdown-item" id="6" onclick="myfunct2(this.id);sem();">6</a>
                                    <a class="dropdown-item" id="7" onclick="myfunct2(this.id);sem();">7</a>
                                    <a class="dropdown-item" id="8" onclick="myfunct2(this.id);sem();">8</a>

                                </div>
                            </li>
                            <li class="nav-item btn-group">
                                <a class="nav-link dropdown-toggle" id="dropdownMenu3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Section</a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenu3">
                                    <a class="dropdown-item" id="a" onclick="myfunct3(this.id);sec();">A</a>
                                    <a class="dropdown-item" id="b" onclick="myfunct3(this.id);sec();">B</a>
                                    <a class="dropdown-item" id="c" onclick="myfunct3(this.id);sec();">C</a>
                                    <a class="dropdown-item" id="d" onclick="myfunct3(this.id);sec();">D</a>
                                    <a class="dropdown-item" id="e" onclick="myfunct3(this.id);sec();">E</a>
                                </div>
                            </li>
                       </div>
                        <div class="md-form wow fadeInDown">
                         <i class="fa fa-key prefix"></i>
                             <li class="nav-item btn-group">
                                <a class="nav-link dropdown-toggle ml-5" id="dropdownMenu4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Select your security Question</a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenu4">
                                    <a class="dropdown-item" id="s1" onclick="myfunct4(this.id)">WHAT'S YOUR NICKNAME?</a>
                                    <a class="dropdown-item" id="s2" onclick="myfunct4(this.id)">WHAT'S YOUR PET'S NAME?</a>
                                    <a class="dropdown-item" id="s3" onclick="myfunct4(this.id)">WHO'S YOUR IDEAL?</a>
                                    <a class="dropdown-item" id="s4" onclick="myfunct4(this.id)">WHICH BOOK DO YOU READ?</a>
                                    <a class="dropdown-item" id="s5" onclick="myfunct4(this.id)">WHAT'S YOUR MOTHER'S BIRTH DATE?</a>
                                </div>
                            </li>                   
                        </div>

                    <div class="md-form wow fadeInDown">
                    
                        <i class="fa fa-pencil prefix"></i>
                        <input type="text" id='securityvalidate' name="securityvalidate" class="form-control">
                        <label for="securityvalidate" style="height: 19px;">Type your answer here</label>
                    
                    </div>
                <div class="md-form text-center wow fadeInUpBig"><input type="submit" class="btn btn-info"></div>

                    </form>
                    </div>
                </div>
                <!--/Form with header-->

            </div>
        </div>
    </div>
    <!--/.Content-->
</main>


    <!--Footer-->
  <footer class="page-footer center-on-small-only">

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
    <script type="text/javascript" src="MDB Free/js/select.js"></script>

    
    <script>
    new WOW().init();
    $('.carousel').carousel({
  interval: 2000
})
    </script>
    <script type="text/javascript">
        var dep1=0,sem1=0,sec1=0;
        var flag="true",flag1=true;
        function dep()
        {
            dep1++;
        }
        function sem()
        {
            sem1++;
        }
        function sec()
        {
            sec1++;
        }
        function validateForm() {
    var e = document.getElementById("emailcontrol").value;
    var n = document.getElementById("namevalidate").value;
    var i = document.getElementById("idvalidate").value;
    var s = document.getElementById("securityvalidate").value;
 
    
    if(flag=="false")
    {
        alert("User Already Exists");
        return false;
    }
    
    if(flag=="null")
    {
        alert("User Already Exists only E-mail Verification is required");
        return false;
    }
    
     if(flag1=="false")
    {
        alert("E-Mail Already Exists");
        return false;
    }
    
    if(flag1=="null")
    {
        alert("E-Mail Already Exists only Verification is required");
        return false;
    }
    console.log("n-->"+n+"e-->"+e+"i-->"+i+"s-->"+s);
    if (n == ""||e==""||i==""||s=="") {
        alert("Mandatory fields must be filled out");
        return false;
    }
    var atpos = e.indexOf("@");
    var dotpos = e.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=e.length ||dotpos.length>3) {
        alert("Not a valid e-mail address");
        return false;
    }
    if (sec1<1||sem1<1||dep1<1) {
        alert("Choose your academic details correctly");
        return false;
    }
    if(s.length>100)
    {
        alert("Security answer must be within 100 characters");
        return false;
    }
       setAction();
}

function setAction()
{
    var dept=document.getElementById("dropdownMenu1").innerHTML;
    var sem=document.getElementById("dropdownMenu2").innerHTML;
    var sec=document.getElementById("dropdownMenu3").innerHTML;
    var sque=document.getElementById("dropdownMenu4").innerHTML;
    document.getElementById("studentform").setAttribute("action","SaveTempUser?utype=Student&branch="+dept+"&sem="+sem+"&sec="+sec+"&sque="+sque);
}
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

function checkUser()
{   
    var id=document.getElementById("idvalidate").value;
    request=getXmlHttpRequestObject();
    request.onreadystatechange=isUserIdExist;
    request.open("post","CheckUser",true);
    request.setRequestHeader ("Content-Type", "application/x-www-form-urlencoded");
    
    var data="id=s"+id;
    request.send(data);
}

function isUserIdExist()
{
    if(request.readyState===4 && request.status===200){
        console.log(request.responseText);
        if(request.responseText.search("false")!=-1)
        {
            flag="false";
            alert("User Already Exists");
    }
    else if(request.responseText.search("null")!=-1)
        {
            flag="null";
            alert("User Already Exists only E-mail Verification is required");
    }
    
    else
        flag="true";
}
}


function checkmail()
{   
    var id=document.getElementById("emailcontrol").value;
    request=getXmlHttpRequestObject();
    request.onreadystatechange=isEmailExist;
    request.open("post","CheckUserEmail",true);
    request.setRequestHeader ("Content-Type", "application/x-www-form-urlencoded");
    
    var data="email="+id+"&utype=student";
    request.send(data);
}

function isEmailExist()
{
    if(request.readyState===4 && request.status===200){
        console.log(request.responseText);
        if(request.responseText.search("false")!=-1)
        {
            flag1="false";
            alert("E-Mail Already Exists");
    }
    else if(request.responseText.search("null")!=-1)
        {
            flag1="null";
            alert("E-Mail Already Exists only Verification is required");
    }
    
    else
        flag1="true";
}
}

</script>
    
</body>

</html>