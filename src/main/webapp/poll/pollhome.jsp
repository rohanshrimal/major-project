<%-- 
    Document   : pollhome
    Created on : Apr 14, 2017, 1:44:00 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="../MDB Free/img/img1.png" />
        <title>Korero</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.9/semantic.min.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.9/semantic.min.js">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js">
<!--           <link rel="icon" type="image/png" href="../images/logo.png" />-->
          
          <link href="../css/bootstrap.min.css" rel="stylesheet" />

    <!--  Material Dashboard CSS    -->
    <link href="../css/material-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="../css/demo.css" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href="../MDB Free/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
    
    <script src="../js/jquery-3.1.0.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
	<script src="../js/material.min.js" type="text/javascript"></script>

	 
        <script src="../js/chartist.min.js"></script>
    
	<script src="../js/bootstrap-notify.js"></script>

	
	<script src="../js/material-dashboard.js"></script>
  <%@include file="../nav-sidebar/navbar.jsp" %>      
<%@include file="../nav-sidebar/sidebar.jsp" %>
 <style>
/*     mario*/
html{
}
     body{
	background-image: url('../images/background-001.jpg');
  width: 168px;
  margin: 0 auto;
}
.rotate{
  background: url('http://martindrapeau.github.io/backbone-game-engine/docs/super-mario-sprite.png') 0 0 no-repeat; 
  width: 32px;
  height: 68px;
  
  float: left;
  position: relative;
  top:170px;
  left: 660px;
}

.clockwise, .anticlockwise{
  color: #000;
  cursor: pointer;
  font-size: 40px;
  font-weight: bold;
  font-family: sans-serif;
}

.clockwise{
  float: right;
}

.clockwise:hover ~ .rotate{
  animation: rotate-clockwise 6s steps(21) infinite;
}

.auto{
  margin-top: 40px;
}

.auto:checked ~ .rotate{
  animation: rotate-clockwise 6s steps(21) infinite;
}

.auto:checked ~ .clockwise{
  color: #fff;
}

.auto:checked ~ .anticlockwise{
  color: #fff;
}


.anticlockwise:hover ~ .rotate{
  animation: rotate-anticlockwise 6s steps(21) infinite;
}

.auto{
  display: inline-block;
  margin-left: 0;
}

.auto-rotate{
  color: #333;
  font-weight: bold;
  font-family: sans-serif;
  clear: both;
}

@keyframes rotate-clockwise {  
  0% {background-position: 0 0; } 
  100% {background-position: -672px 0; } 
}

@keyframes rotate-anticlockwise {  
  0% {background-position: -672px 0; }
  100% {background-position: 0 0; } 
}
     
     
     
/*     polling circle*/
            @import url(http://fonts.googleapis.com/css?family=Open+Sans:700);
html,
body {
  height: 100%;
}
body {
  overflow: hidden;
}
.hoja {
  color: black;
  font-weight: bold;
  position: absolute;
  top: 40%;
  left: 50%;
  margin-left: -140px;
  margin-top: -140px;
  width: 280px;
  height: 280px;
  text-align: center;
  font-family: 'Open Sans', sans-serif;
  font-size: 35px;
  line-height: 280px;
  -webkit-font-smoothing: antialiased;
}
.hoja:after,
.hoja:before {
  content: "";
  border-radius: 100%;
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  -webkit-transform-origin: center center;
          transform-origin: center center;
}
.hoja:after {
  box-shadow: inset 0 17.5px 0 rgba(250, 250, 0, 0.6), inset 17.5px 0 0 rgba(250, 200, 0, 0.6), inset 0 -17.5px 0 rgba(250, 150, 0, 0.6), inset -17.5px 0 0 rgba(250, 100, 0, 0.6);
  -webkit-animation: rotar 2s -0.5s linear infinite;
          animation: rotar 2s -0.5s linear infinite;
}
.hoja:before {
  box-shadow: inset 0 17.5px 0 rgba(0, 250, 250, 0.6), inset 17.5px 0 0 rgba(0, 200, 200, 0.6), inset 0 -17.5px 0 rgba(0, 150, 200, 0.6), inset -17.5px 0 0 rgba(0, 200, 250, 0.6);
  -webkit-animation: rotarIz 2s -0.5s linear infinite;
          animation: rotarIz 2s -0.5s linear infinite;
}
@-webkit-keyframes rotar {
  0% {
    -webkit-transform: rotateZ(0deg) scaleX(1) scaleY(1);
            transform: rotateZ(0deg) scaleX(1) scaleY(1);
  }
  50% {
    -webkit-transform: rotateZ(180deg) scaleX(0.82) scaleY(0.95);
            transform: rotateZ(180deg) scaleX(0.82) scaleY(0.95);
  }
  100% {
    -webkit-transform: rotateZ(360deg) scaleX(1) scaleY(1);
            transform: rotateZ(360deg) scaleX(1) scaleY(1);
  }
}
@keyframes rotar {
  0% {
    -webkit-transform: rotateZ(0deg) scaleX(1) scaleY(1);
            transform: rotateZ(0deg) scaleX(1) scaleY(1);
  }
  50% {
    -webkit-transform: rotateZ(180deg) scaleX(0.82) scaleY(0.95);
            transform: rotateZ(180deg) scaleX(0.82) scaleY(0.95);
  }
  100% {
    -webkit-transform: rotateZ(360deg) scaleX(1) scaleY(1);
            transform: rotateZ(360deg) scaleX(1) scaleY(1);
  }
}
@-webkit-keyframes rotarIz {
  0% {
    -webkit-transform: rotateZ(0deg) scaleX(1) scaleY(1);
            transform: rotateZ(0deg) scaleX(1) scaleY(1);
  }
  50% {
    -webkit-transform: rotateZ(-180deg) scaleX(0.95) scaleY(0.85);
            transform: rotateZ(-180deg) scaleX(0.95) scaleY(0.85);
  }
  100% {
    -webkit-transform: rotateZ(-360deg) scaleX(1) scaleY(1);
            transform: rotateZ(-360deg) scaleX(1) scaleY(1);
  }
}
@keyframes rotarIz {
  0% {
    -webkit-transform: rotateZ(0deg) scaleX(1) scaleY(1);
            transform: rotateZ(0deg) scaleX(1) scaleY(1);
  }
  50% {
    -webkit-transform: rotateZ(-180deg) scaleX(0.95) scaleY(0.85);
            transform: rotateZ(-180deg) scaleX(0.95) scaleY(0.85);
  }
  100% {
    -webkit-transform: rotateZ(-360deg) scaleX(1) scaleY(1);
            transform: rotateZ(-360deg) scaleX(1) scaleY(1);
  }
}





html {
  height: 100%;
  
}

body {
  font-family: sans-serif;
  font-size: 11px;
  height: 100%;
  margin: 0;
}

#b6{
    position: absolute;
    left: 350px;
    top: 450px;
}
#b7{
    position: absolute;
    left: 620px;
    top: 450px;
}

#b8{
    position: absolute;
    left: 890px;
    top: 450px;
}



        </style>
    
        
    </head>
    <body>
        <div class="container">
	        <div class="row"><div class="col-md-12">&nbsp;</div>></div>
	        <div class="row"><div class="col-md-12">&nbsp;</div>></div>
	        <div class="row"><div class="col-md-12">&nbsp;</div>></div>
	        <div class="row"><div class="col-md-12">&nbsp;</div>></div>
	        <div class="row"><div class="col-md-12">&nbsp;</div>></div>
	        <div class="row"><div class="col-md-12">&nbsp;</div>></div>
	        <div class="row"><div class="col-md-12">&nbsp;</div>></div>
	        <div class="row"><div class="col-md-12">&nbsp;</div>></div>


            <div class="row">
                <div class="col-md-5">
                </div>
                <div class="col-md-6 text-center flex-center">
 		           <div class="hoja">POLLING</div>
                </div>
            </div>
        </div>
            <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
            <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
        <div class="ui inline container">
				        <a href="createpoll.jsp">
			                <button id="b6" class="ui massive inverted violet button" value="Show Div" style="margin-left: 50px;">
			                <span><i class="write icon"></i></span>
			                <span class="visible content">Create Poll</span>
			                </button>
			            </a>    
				        <a href="../VotePollController">
			                <button id="b7" class="ui massive inverted green button" value="Show Div" style="margin-left: 55px"  >
			                <span><i class="bar chart icon"></i></span>
			                <span class="visible content">Vote Now </span>
			                </button>
			            </a>
				        <a href="../ViewMyPoll">
			                <button id="b8"  class="ui massive inverted red button" value="Show Div" style="margin-left: 50px;"  >
			                <span><i class="user icon"></i></span>
			                <span class="visible content">My Polls</span>
			                </button>
			            </a>
			        </div>
    </body>
</html>
