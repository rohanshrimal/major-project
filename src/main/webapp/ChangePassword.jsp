<!DOCTYPE html>
<%
String uid=request.getParameter("uid");
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

   
</head>

<body>
    
    <!--Navbar-->
    <nav class="navbar navbar-toggleable-md navbar-dark fixed-top bg-info">
        <div class="container">
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNav1" aria-controls="navbarNav1" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
             <a class="navbar-brand">
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
                        <a class="nav-link" href="Post_Question.jsp ">Ask a question</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AboutUs.jsp">About Us</a>
                    </li>
                    <li class="nav-item ml-5 pl-5">
                        <a class="nav-link"><i class="fa fa-circle"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"><i class="fa fa-circle-o"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">Change your password</a>
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
    
    
<main>
<div class="container mt-2">
    <div class="row">
        <div class="jumbotron">
            <br><h1 class="h1-responsive mb-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Change your Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h1>
            <!--<p class="lead">Please enter the correct OTP here below for proceeding further to create your account.</p>--><br>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6 col-sm-12">
                    
                    <!--Password validation-->
                    <form id='pwdform' onsubmit='return setAtr()' method='post'>
                        <div class="md-form mt-1">
                        <i class="fa fa-lock prefix"></i>
                        <input type="password" id="form01" name='pass' onchange='checkPwd()' class="form-control" >
                        <label for="form01" data-error="wrong">Type your current password</label>
                    </div> 
                    <div class="md-form mt-1">
                        <i class="fa fa-lock prefix"></i>
                        <input type="password" id="form10" name='pass' class="form-control" disabled>
                        <label for="form10" data-error="wrong">Type your new password</label>
                    </div>      
                    <div class="md-form">
                        <i class="fa fa-lock prefix"></i>
                        <input type="password" id="form11" class="form-control" disabled>
                        <label for="form11" data-error="wrong">Retype new password</label>
                    </div>
                    <br>
                    <div class="text-center">
                        
                        <button type="submit" id='donebtn' onclick="return checkEqual()" class="btn btn-primary" >done</button>
                    </div>
                    </form>
                </div>
            </div>
            <hr class="my-2 mt-1">
             
        </div>
        <!--/.Jumbotron-->
        
    </div>
</div>
</main>

    <footer class="page-footer center-on-small-only mt-0" id="footer">

        <div class="container-fluid text-center" style="padding-bottom: 10px;">
            © 2017 Made with <i class="fa fa-heart" aria-hidden="true" style="color: #ff4444;"></i> by team Korero
        </div>
    <!--/.Copyright-->


</footer>
    <!-- Start your project here-->

    <!-- /Start your project here-->
    

    <!-- SCRIPTS -->

    <!-- JQuery -->
    <script type="text/javascript" src="MDB Free/js/jquery-2.2.3.min.js"></script>

    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="MDB Free/js/tether.min.js"></script>

    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="MDB Free/js/bootstrap.min.js"></script>

    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="MDB Free/js/mdb.min.js"></script>

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

function checkPwd()
{   
    var uid="<%=uid%>";
    var pwd=document.getElementById("form01").value;
    request=getXmlHttpRequestObject();
    request.onreadystatechange=isValidPwd;
    request.open("post","CheckPwd",true);
    request.setRequestHeader ("Content-Type", "application/x-www-form-urlencoded");
    
    var data="uid="+uid+"&pwd="+pwd;
    request.send(data);
}

function isValidPwd()
{
    if(request.readyState===4 && request.status===200){
        console.log(request.responseText);
        if(request.responseText.search("true")!=-1)
        {
            
            document.getElementById("form10").disabled=false;
            document.getElementById("form11").disabled=false;
            document.getElementById("form10").focus();
    }
    else
    {
        document.getElementById("form10").disabled=true;
        document.getElementById("form11").disabled=true;
        document.getElementById("form01").focus();
        document.getElementById("form01").value="";
        alert("Invalid Current Password");
    }
}
}

function setPwd(){
    document.getElementById("donebtn").disabled=true;
    document.getElementById("form11").value="";
}

function setRPwd(){
    var form10=document.getElementById("form10").value;
    var form11=document.getElementById("form11").value;
    if(form10===form11)
    {
        document.getElementById("donebtn").disabled=false;
    }
    else
    {
        document.getElementById("form10").value="";
        document.getElementById("form11").value="";
        document.getElementById("form10").focus();
        document.getElementById("donebtn").disabled=true;
    }
    
}

function setAtr()
{
    var form10=document.getElementById("form10").value;
    if(form10.length<8)
    {
        alert("Password should be of atleast 8 characters");
        return false;
    }
    
    document.getElementById("pwdform").setAttribute("action","UpdatePassword?uid=<%=uid%>&pwd="+document.getElementById("form11").value);
    return true;
}

function checkEqual()
{
    var form10=document.getElementById("form10").value;
    var form11=document.getElementById("form11").value;
    
    if(form10===form11)
        return true;
    else
    {
        alert("Password does not match");
        document.getElementById("form10").value="";
        document.getElementById("form11").value="";
        document.getElementById("form10").focus();
        return false;
    }
}
</script>
    
    
</body>

</html>