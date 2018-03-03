<!DOCTYPE html>

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
             <a class="navbar-brand" href="index.html">
                <img src="MDB Free/img/logo.png" class="img-fluid" style="width: 180px">
            </a>
            <div class="collapse navbar-collapse" id="navbarNav1">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="GetStarted.jsp">Get Started</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogInContent">Log In</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="About.jsp">About Us</a>
                    </li>
                    <li class="nav-item ml-5 pl-5">
                        <a class="nav-link"><i class="fa fa-circle"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"><i class="fa fa-circle-o"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">Forgot Password</a>
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
            <br><h1 class="h1-responsive mb-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Enter Verification Details&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h1>
            <!--<p class="lead">Please enter the correct OTP here below for proceeding further to create your account.</p>--><br>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6 col-sm-12">
                    
                    <!--Password validation-->
                    <form id='pwdform' onsubmit='return checkValidate()' method='post'>
                        <div class="md-form wow fadeInDown">
                        
                            <i class="fa fa-user prefix"></i>
                            <input type="text" id='id' name="id" class="form-control">
                            <label for="idvalidate" style="height: 19px;">User ID</label>
                        
                        </div>
                        
                        <div class="md-form mt-1">
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
                    
                    <div class="md-form mt-1">
                        <i class="fa fa-lock prefix"></i>
                        <input type="text" id="form10" name='sans' class="form-control">
                        <label for="form10" data-error="wrong">Type Security Answer</label>
                    </div>      
                    
                    <br>
                    <div class="text-center">
                        
                        <button type="submit" id='donebtn' class="btn btn-primary" >done</button>
                    </div>
                    </form>
                    </div> 
                </div>
            </div>
            <hr class="my-2 mt-1">
             
        </div>
        <!--/.Jumbotron-->
        
    </div>
</div>
</main>

    <footer class="footer">
				<div class="container-fluid">
					<nav >
					</nav>
					<p class="copyright pull-right">
						&copy; <script>document.write(new Date().getFullYear())</script> , made with love <i class="fa fa-heart"></i> by team Korero
					</p>
				</div>
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
    var sque,count=0;
        function myfunct4(id) {
    document.getElementById("dropdownMenu4").innerHTML = document.getElementById(id).innerHTML;
    sque=document.getElementById(id).innerHTML;
    count++;
}

function checkValidate(){
    var id=document.getElementById("id").value;
    var sans=document.getElementById("form10").value;
    if(id==="" || sans==="" || count<1)
    {
        alert("Please fill all details");
        return false;
    }
    else
    {
        document.getElementById("pwdform").setAttribute("action","CheckDetails?sque="+sque);
        return true;
}
}
    
</script>
    
    
</body>

</html>