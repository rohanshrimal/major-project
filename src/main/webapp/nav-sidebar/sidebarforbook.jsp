<%@page import="model.FacultyModel"%>
<%@page import="model.StudentModel"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Bootstrap core CSS     -->
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

	<!--  Charts Plugin -->
        <script src="../js/chartist.min.js"></script>

	<!--  Notifications Plugin    -->
        <script src="../js/bootstrap-notify.js"></script>

	<!-- Material Dashboard javascript methods -->
        <script src="../js/material-dashboard.js"></script>
    </head>
    <body> 
<div class="sidebar" data-color="blue" data-image="../img/testd.jpg" style="margin-top: 50px;">
			<!--
		        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

		        Tip 2: you can also add an image using data-image tag
		    -->
                    <%
                        String type=((String)session.getAttribute("utype"));
                   String creator_id = null;
                   String uname = null ; String branch=null;
                   String utype2=null;
                   String imgpath=null;
                     if(type.equals("student"))
                   { 
                  StudentModel user;
                  user=(StudentModel) session.getAttribute("userModel");
                  creator_id=user.getSid();
                  uname=user.getName();
                  utype2="Student";
                  
            
                    }else if(type.equals("faculty"))
                    {
                       FacultyModel user;
                       user=(FacultyModel) session.getAttribute("userModel");
                        creator_id=user.getFid();
                        uname=user.getName();
                        utype2="Faculty";
                        
                      }
                       
                    %>
	    	<div class="sidebar-wrapper">
	            <ul class="nav">
	            <li class="container-fluid">
                        <img src="../ImageLoader?uid=<%=creator_id%>" alt="Circle Image" class="img-circle img-responsive" style="padding: 0px 35px;">
	            <div class="content text-center">
					<h6 class="category text-gray"><%=utype2%></h6>
                                        <h4 class="card-title" style="font-size: 20px;font-weight: bold"><%=uname.toUpperCase() %></h4>
    			</div>
                        
                        <br/><br/><br/>
	            </li>
                    <li id="link1"  onclick="li1()" >
                        <a href="../MyFeed">
                                <i class="material-icons" >dashboard </i>
	                        <p>My Feed</p>
	                    </a>
	                </li>
                        <li>
	                    <a href="../EditProfile">
	                        <i class="material-icons">person</i>
	                        <p>Edit Profile</p>
	                    </a>
	                </li>
	                <li id="link2">
                            <a href="../poll/pollhome.jsp">
	                        <i class="material-icons" onclick="li2()">list</i>
	                        <p>Polling</p>
	                    </a>
	                </li>
	                <li class="active" id="link3">
                            <a href="../book advisory/bookhome.jsp">
	                        <i class="material-icons" onclick="li3()">book</i>
	                        <p>Book Advisory</p>
	                    </a>
	                </li>
	               
	            </ul>
	    	</div>
	    </div>
                        
                        
                        
                        <script>
                            var p;
                            function li1(){
                                
                                document.getElementById("link1").setAttribute("class","active");
                            }
                        </script>
         </body>
</html>