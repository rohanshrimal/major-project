<%-- 
    Document   : votepoll
    Created on : Apr 14, 2017, 1:47:11 PM
    Author     : Lenovo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.pollmodel.CreateNewPollModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="../MDB Free/img/img1.png" />
        <title>Korero</title>
           <!-- Latest compiled and minified CSS -->

           <link href="../css/bootstrap.min.css" rel="stylesheet" />

    <!--  Material Dashboard CSS    -->
    <link href="../css/material-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="../css/demo.css" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href="../MDB Free/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
    
    

        <%@include file="../nav-sidebar/navbar.jsp" %>
<%@include file="../nav-sidebar/sidebar.jsp" %>
           
       <link rel="icon" type="image/png" href="../images/logo.png" />     
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>




        <style>
            
/* bootstrap css*/


.progress {
  height: 35px;
  width: 565px;
  column-width: 565px;
  
  
}
.progress .skill {
  font: normal 20px "Open Sans Web";
  line-height: 35px;
  padding: 0;
  margin: 0 0 0 20px;
  text-transform: uppercase;
  color: black;
}
.progress .skill .val {
  float: right;
  font-style: normal;
  margin: 0 20px 0 0;
  color: black;
}

.progress-bar {
  text-align: left;
  transition-duration: 3s;
}



/*radio button*/
 #qid {
  padding: 10px 15px;
  -moz-border-radius: 50px;
  -webkit-border-radius: 50px;
  border-radius: 20px;
}
label.btn {
    padding: 18px 60px;
    white-space: normal;
    -webkit-transform: scale(1.0);
    -moz-transform: scale(1.0);
    -o-transform: scale(1.0);
    -webkit-transition-duration: .3s;
    -moz-transition-duration: .3s;
    -o-transition-duration: .3s;
    color: blue;
}

label.btn:hover {
    text-shadow: 0 3px 2px rgba(0,0,0,0.4);
    -webkit-transform: scale(1.1);
    -moz-transform: scale(1.1);
    -o-transform: scale(1.1)
}
label.btn-block {
    text-align: left;
    position: relative
}

label .btn-label {
    position: absolute;
    left: 0;
    top: 0;
    display: inline-block;
    padding: 0 10px;
    background: rgba(0,0,0,.15);
    height: 100%
}

label .glyphicon {
    top: 34%
}
.element-animation1 {
    animation: animationFrames ease .8s;
    animation-iteration-count: 1;
    transform-origin: 50% 50%;
    -webkit-animation: animationFrames ease .8s;
    -webkit-animation-iteration-count: 1;
    -webkit-transform-origin: 50% 50%;
    -ms-animation: animationFrames ease .8s;
    -ms-animation-iteration-count: 1;
    -ms-transform-origin: 50% 50%
}
.element-animation2 {
    animation: animationFrames ease 1s;
    animation-iteration-count: 1;
    transform-origin: 50% 50%;
    -webkit-animation: animationFrames ease 1s;
    -webkit-animation-iteration-count: 1;
    -webkit-transform-origin: 50% 50%;
    -ms-animation: animationFrames ease 1s;
    -ms-animation-iteration-count: 1;
    -ms-transform-origin: 50% 50%
}
.element-animation3 {
    animation: animationFrames ease 1.2s;
    animation-iteration-count: 1;
    transform-origin: 50% 50%;
    -webkit-animation: animationFrames ease 1.2s;
    -webkit-animation-iteration-count: 1;
    -webkit-transform-origin: 50% 50%;
    -ms-animation: animationFrames ease 1.2s;
    -ms-animation-iteration-count: 1;
    -ms-transform-origin: 50% 50%
}
.element-animation4 {
    animation: animationFrames ease 1.4s;
    animation-iteration-count: 1;
    transform-origin: 50% 50%;
    -webkit-animation: animationFrames ease 1.4s;
    -webkit-animation-iteration-count: 1;
    -webkit-transform-origin: 50% 50%;
    -ms-animation: animationFrames ease 1.4s;
    -ms-animation-iteration-count: 1;
    -ms-transform-origin: 50% 50%
}
@keyframes animationFrames {
    0% {
        opacity: 0;
        transform: translate(-1500px,0px)
    }

    60% {
        opacity: 1;
        transform: translate(30px,0px)
    }

    80% {
        transform: translate(-10px,0px)
    }

    100% {
        opacity: 1;
        transform: translate(0px,0px)
    }
}

@-webkit-keyframes animationFrames {
    0% {
        opacity: 0;
        -webkit-transform: translate(-1500px,0px)
    }
    60% {
        opacity: 1;
        -webkit-transform: translate(30px,0px)
    }

    80% {
        -webkit-transform: translate(-10px,0px)
    }

    100% {
        opacity: 1;
        -webkit-transform: translate(0px,0px)
    }
}

@-ms-keyframes animationFrames {
    0% {
        opacity: 0;
        -ms-transform: translate(-1500px,0px)
    }

    60% {
        opacity: 1;
        -ms-transform: translate(30px,0px)
    }
    80% {
        -ms-transform: translate(-10px,0px)
    }

    100% {
        opacity: 1;
        -ms-transform: translate(0px,0px)
    }
}

.modal-header {
    background-color: transparent;
    color: inherit
}

.modal-body {
    min-height: 205px
}

@-moz-keyframes fadeG {
    0% {
        background-color: #000
    }

    100% {
        background-color: #FFF
    }
}

@-webkit-keyframes fadeG {
    0% {
        background-color: #000
    }

    100% {
        background-color: #FFF
    }
}

@-ms-keyframes fadeG {
    0% {
        background-color: #000
    }

    100% {
        background-color: #FFF
    }
}

@-o-keyframes fadeG {
    0% {
        background-color: #000
    }
    100% {
        background-color: #FFF
    }
}

@keyframes fadeG {
    0% {
        background-color: #000
    }

    100% {
        background-color: #FFF
    }
}
/*radio end*/


.progress > .progress-type {
	position: absolute;
	left: 0px;
	font-weight: 800;
	padding: 3px 30px 2px 10px;
	color: rgb(255, 255, 255);
/*	background-color: rgba(25, 25, 25, 0.2);*/
}

.progress > .progress-completed {
	position: absolute;
	right: 0px;
	font-weight: 800;
	padding: 3px 10px 2px;
}

        </style>
        
        <script>
            $(document).ready(function() {
      $('.progress .progress-bar').css("width",
                function() {
                    return $(this).attr("aria-valuenow") + "%";
                }
        )
    });



//radio button begin
$(function(){
    var loading = $('#loadbar').hide();
    $(document)
    .ajaxStart(function () {
        loading.show();
    }).ajaxStop(function () {
    	loading.hide();
    });
    
    $("label.btn").on('click',function () {  
       
       
  
    	var choice = $(this).find('input:radio').val();
     //   var queid = $(this).find('input:radio').attr("id",opt1);
        document.getElementById("opt1").value=choice;
        //var queid=$('#abc input[value="choice"]').find().text(); 
        //document.write(choice);
         $('#submitpoll').click();
    	
    	setTimeout(function(){
           $( "#answer" ).html(  $(this).checking(choice) );      
            $('#quiz').show();
            $('#loadbar').fadeOut();
            
          
           /* something else */
    	}, 1500);
    });

//    $ans = 3;
//
//    $.fn.checking = function(ck) {
//       
//    }; 
});	
// radio button end

            </script>
    </head>
    <body>
        <h1>VOTE FOR POLL</h1>
        
         <% session=request.getSession(); 
            ArrayList<CreateNewPollModel> cpm=(ArrayList) session.getAttribute("votepollnow");
            int tempqueid=0;
            int xz[]=new int[10];
              CreateNewPollModel currentque=(CreateNewPollModel) session.getAttribute("currentquevoted");
              if(currentque!=null)        
              {
                  tempqueid=currentque.getPollqueid();
                  xz=currentque.getCount();
              }
                for(CreateNewPollModel ab: cpm)
            {%>
            
            
            
            
            
            <div class="container-fluid bg-info" style="background-color: white">
    <div class="modal-dialog">
      <div class="modal-content">
           <form action="../QueVotedController" method="post">
         <div class="modal-header">
            
             
                 
            <h3><span class="label label-warning" id="qid">Q.</span> <%=ab.getQue()%> ?</h3>
        </div>
        <div class="modal-body">
            

             <%  int i=1,j=0,no=1;
                    
                   if(ab.getPollqueid()==tempqueid)
                   {
                       for(String bc:ab.getOption() )
                       { 
                          if(bc==null)
                               break;   
                       
                 %>  
                 
               <div class="progress skill-bar ">
                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="<%=xz[j]%>" aria-valuemin="0" aria-valuemax="100">
<!--                    <span class="skill" > <%=bc%><i class="val" style="color: white"><%=xz[j]%> %</i></span>-->
                </div>
               
                   <span class="progress-type" style="color: black; font-size: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=bc%></span>
                     <span class="progress-completed" style="color: black;font-size: 20px;"><%=xz[j]%>  %&nbsp;&nbsp; &nbsp;&nbsp;</span>
            
            </div>
                 
                 <%   
                         j++;
                      }
                %>
                
               <br/>
                
                
                <%
                   
                   }else{
                    for(String bc:ab.getOption())
                { 

                   if(bc==null)
                       break;   
                  
                %>
                 
                 
          <div class="quiz" id="quiz" data-toggle="buttons">
           <label class=" element-animation<%=no%> btn btn-lg btn-primary btn-block" style="background-color: #26c6da"><span class="btn-label" style=""><i class="glyphicon glyphicon-chevron-right"></i></span><input type="radio"  id="opt" value="<%=i%>,<%=ab.getPollqueid()%>" ><%=bc%></label> 
           </div>
            <% 
                     i++;
                     no++;
                   }
                   }
                 %>
                 <div  class="abc" style="display: none">
                     
<!--                  <input type ="text" id="queid" name="queid" value="" >-->
             
                     <input type="text" id="opt1" name="opt" >
                <input type=SUBMIT value="SUBMIT" id="submitpoll">
                 </div>

               

   </div>
                    </form>

</div>
</div>
</div>
            
            
            
            
            
            
              

                   <% 
                       
            }
             ArrayList<CreateNewPollModel> cpm2=(ArrayList) session.getAttribute("votedpollresult");
       
        int xz2[]=new int[10];
         %> <hr>
        <br>
        <h1 align="center" style=" color:blue">Polls you have already voted:</h1>
        <%
              for(CreateNewPollModel ab2: cpm2)
              {int j=0;
                 xz2=ab2.getCount();
        %>    
       
        
               <div class="container-fluid bg-info" style="background-color: white">
            <div class="modal-dialog">
             <div class="modal-content">
         
            <div class="modal-header">
               <h3><span class="label label-warning" id="qid">Q.</span> <%=ab2.getQue()%> ?</h3>
                   </div>
        <div class="modal-body">
          <%      for(String bc:ab2.getOption())
                { 
                   if(bc==null)
                       break;   
                    
                %>
             <div class="progress skill-bar ">
                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="<%=xz2[j]%>" aria-valuemin="0" aria-valuemax="100">
<!--                    <span class="skill"> <%=bc%><i class="val" style="color: white"><%=xz2[j]%> %</i></span>-->
                </div>
                <span class="progress-type" style="color: black; font-size: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=bc%></span>
                     <span class="progress-completed" style="color: black;font-size: 20px;"><%=xz2[j]%>  % &nbsp;&nbsp;&nbsp;&nbsp;</span>
            
            </div>
                 
                 <%   
                        j++;
                      }
                %>
                 
             </div>
            </div>
            </div>
            </div>  
           
                
          
            
         
          
            <%
                }
              session.setAttribute("currentquevoted", null);
            %>
        
            <script>
                $(window).scroll(function() {
  sessionStorage.scrollTop = $(this).scrollTop();
});

$(document).ready(function() {
  if (sessionStorage.scrollTop != "undefined") {
    $(window).scrollTop(sessionStorage.scrollTop);
  }
});
            </script> 
    </body>
</html>
