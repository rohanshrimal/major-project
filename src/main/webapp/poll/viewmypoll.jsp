

<%@page import="java.util.ArrayList"%>
<%@page import="model.pollmodel.CreateNewPollModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <% 
//                ArrayList<CreateNewPollModel> cpm=(ArrayList<CreateNewPollModel>)session.getAttribute("mypolls");
                ArrayList<CreateNewPollModel> cpm=(ArrayList<CreateNewPollModel>)session.getAttribute("mypolls");
                int xz2[]=new int[10];
 %>    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="../MDB Free/img/img1.png" />
        <title>Korero</title>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.9/semantic.min.css">
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


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
    -o-transition-duration: .3s
}

label.btn:hover {
    text-shadow: 0 3px 2px rgba(0,0,0,0.4);
    -webkit-transform: scale(1.1);
    -moz-transform: scale(1.1);
    -o-transform: scale(1.1)
}
label.btn-block {
    text-align: left;
   position: relative;
  
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
    min-height: 130px;
      
}
#loadbar {
    position: absolute;
    width: 62px;
    height: 77px;
    top: 2em
}
.blockG {
    position: absolute;
    background-color: #FFF;
    width: 10px;
    height: 24px;
    -moz-border-radius: 8px 8px 0 0;
    -moz-transform: scale(0.4);
    -moz-animation-name: fadeG;
    -moz-animation-duration: .8800000000000001s;
    -moz-animation-iteration-count: infinite;
    -moz-animation-direction: linear;
    -webkit-border-radius: 8px 8px 0 0;
    -webkit-transform: scale(0.4);
    -webkit-animation-name: fadeG;
    -webkit-animation-duration: .8800000000000001s;
    -webkit-animation-iteration-count: infinite;
    -webkit-animation-direction: linear;
    -ms-border-radius: 8px 8px 0 0;
    -ms-transform: scale(0.4);
    -ms-animation-name: fadeG;
    -ms-animation-duration: .8800000000000001s;
    -ms-animation-iteration-count: infinite;
    -ms-animation-direction: linear;
    -o-border-radius: 8px 8px 0 0;
    -o-transform: scale(0.4);
    -o-animation-name: fadeG;
    -o-animation-duration: .8800000000000001s;
    -o-animation-iteration-count: infinite;
    -o-animation-direction: linear;
    border-radius: 8px 8px 0 0;
    transform: scale(0.4);
    animation-name: fadeG;
    animation-duration: .8800000000000001s;
    animation-iteration-count: infinite;
    animation-direction: linear
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
        );
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
         <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.9/semantic.min.js"></script>
        
    </head>
    <body>
        <div class="container-fluid bg-info" style="background-color: white; margin-top: 50px;">
            <div class="modal-dialog">
             <div class="modal-content">
         
            
                <h1 class="text-center" style="margin-bottom:30px;">My Polls</h1>
                   </div>
                   
             
            </div>
        </div>
        
        
      <%
        
  for(CreateNewPollModel ab: cpm)
            {
                int j=0;
                 xz2=ab.getCount();
       %>
            
            
            <div class="container-fluid bg-info" style="background-color: white">
            <div class="modal-dialog" >
             <div class="modal-content">
         
            <div class="modal-header">
               <h3><span class="label label-warning" id="qid">Q.</span> <%=ab.getQue()%> ?</h3>
                   </div>
        <div class="modal-body">
        
          <%for(String bc:ab.getOption())
                { 
                 
                    if(bc==null || bc.length()==0 || bc.startsWith(" "))
                    {
                        
                        break;
                    }
           %>
                
        <div class="progress skill-bar ">
            
                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="<%=xz2[j]%>" aria-valuemin="0" aria-valuemax="100">
<!--                    <span class="skill"> <i class="val" style="color: white"><%=xz2[j]%>  %</i></span>-->
                    
                </div><hr style="height:2px; visibility:hidden;" />
                      <span class="progress-type" style="color: black; font-size: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=bc%></span>
                     <span class="progress-completed" style="color: black;font-size: 20px;"><%=xz2[j]%>  % &nbsp;&nbsp;&nbsp;&nbsp;</span>
            </div>
              <% j++;} 
            %>
        
            
           <div class="inline field" align='center'>
              
                   <div class="ui massive toggle  checkbox">
                       <%   int toggle;
                           if(ab.getPollviewstatus()==1)
                           {     toggle=1;
                               %>
                           
                       <input type="checkbox" tabindex="0" class="hidden" checked="checked" id='<%=toggle%>' onchange="stopresponse(this.id,this.value)" value='<%=ab.getPollqueid()%>'>
                     <%
                          }else{
                                     toggle=0;
                     %>
                     <input type="checkbox" tabindex="0" class="hidden"  id='<%=toggle%>' onchange="stopresponse(this.id,this.value)" value='<%=ab.getPollqueid()%>'>
                     <%  }%>
                     
                       <label style="font-size: 14px">Accepting Responses</label>
                         
                           
                       </div>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
 <button class="ui icon red circular button" onclick="delpoll(this.value)" value="<%=ab.getPollqueid()%>">
 <i class='large  trash outline icon' ></i>
</button>
      </div>    
            
</div>
</div>
</div>
      <%     }
        
        %> 
            
        <form action="../StopResponsesController" method='post' style="display: none">
            <input type='text' name='queid' id='queidid'>
            <input type='text' name='pollviewstatus' id='pollviewstatusid'>
            <input type='submit' id='submitid'>
        </form>
                   
        <form action="../ViewMyPoll" method='post' style="display: none">
            <input type='submit' id='subdelpoll'>
        </form>   
        
        <script>
            $('.ui.checkbox')
  .checkbox()
;

function stopresponse(x,y){
   document.getElementById("queidid").value=y;
  document.getElementById("pollviewstatusid").value=x;
  
  $('#submitid').click();
 
}



$(window).scroll(function() {
  sessionStorage.scrollTop = $(this).scrollTop();
});

$(document).ready(function() {
  if (sessionStorage.scrollTop != "undefined") {
    $(window).scrollTop(sessionStorage.scrollTop);
  }
});


var request;
function delpoll(pid){
       
       
       request=new XMLHttpRequest();
       request.onreadystatechange=afterpolldel;
       request.open("get", "../DelPollController?pid="+pid, true);
       request.send(null);
      }
      function afterpolldel(){
          
          if(request.status==200 && request.readyState==4)
               $('#subdelpoll').click();
      }
    
        </script>
    </body>
</html>
