<%-- 
    Document   : bookhome
    Created on : Apr 16, 2017, 6:25:13 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="../MDB Free/img/img1.png" />
        <title>Korero</title>
          <!--<link rel="icon" type="image/png" href="../images/logo.png" />-->
          
    
        
    
          
    
    
    
   
<!--    	<script src="js/jquery-3.1.0.min.js" type="text/javascript"></script>-->
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<script src="../js/material.min.js" type="text/javascript"></script>

	<!--  Charts Plugin -->
	<script src="../js/chartist.min.js"></script>

	<!--  Notifications Plugin    -->
        <script src="../js/bootstrap-notify.js"></script>

	<!-- Material Dashboard javascript methods -->
	<script src="../js/material-dashboard.js"></script>
        
        
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.9/semantic.min.css">
         <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.9/semantic.min.js"></script>
          
          
        
        
         <script>
      var request;
      function showSub(){
       var branch=document.getElementById("selbranch").value;
       var sem=document.getElementById("selsem").value;
       
       request=new XMLHttpRequest();
       request.onreadystatechange=getSub;
       request.open("get", "../GetSubjectController?branch="+branch+"&sem="+sem, true);
       request.send(null);
      }
      function getSub(){
        // if(request.readystate==4 && request.status==200){
            if(request.status==200 && request.readyState==4)
             document.getElementById("selsub").innerHTML=request.responseText;
         //}
      }
    </script>
         
         
         <style>
             .select1{
                width: 60%; 
             /*  align-content: center;
               align-items: center;*/
                 font-size: 20px; 
                 padding: 12px;
              /*  border: solid 1px red;*/
                margin: auto;
              /*  box-shadow: inset 1px 1px 2px 0 #707070;*/
              /*transition: box-shadow 0.3s, border 0.3s;*/
            }
           
         </style>
    </head>
    <body>
     
         <div class="ui  modal" >
  
  <div class="header" align="center">
    SEARCH BOOK
  </div>
  <div class="image content"  >
   
      <form action="../SearchBookController" method="post" >
          <select onchange="showSub()" name="branch"   id="selbranch"  class="ui selection dropdown" required >
                  <option value="" disabled selected>BRANCH</option>
                 <option  value="Computer Science">COMPUTER SCIENCE</option>
                 <option value="Electronics Communication">ElECTRONICS COMMUNICATION</option>
                 <option value="Civil">CIVIL</option>
                 <option value="Mechanical">MECHANICAL</option>
                 <option value="Fire Technology">FIRE TECHNOLOGY</option>
                 <option value="Chemical">CHEMICAL</option>
                 <option value="Electrical And Electronics">ElECTRICAL AND ELECTRONICS</option>
                     </select>
      
      
      
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
      <select id="selsem"  onchange="showSub()"  name="sem"  class="ui selection dropdown" >
                  <option value="" disabled selected>SEMESTER</option>
                 <option value="1">I</option>
                 <option value="2">II</option>
                 <option value="3">III</option>
                 <option value="4">IV</option>
                 <option value="5">V</option>
                 <option value="6">VI</option>
                 <option value="7">VII</option>
                 <option value="8">VIII</option>
                     </select>
      
      
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     
      <select name="subject" id="selsub"  class="ui selection dropdown" required>
                  <option value="" disabled selected>SUBJECT</option>
<!--                 <option value="Micro Processor and Interfacing">CS-601 Micro Processor and Interfacing</option>
                 <option value="Principles Of Programming Languages PPL">CS-602 Principles Of Programming Languages PPL</option>
                 <option value="Software Engineering and Project Management SEPM">CS-603 Software Engineering and Project Management SEPM</option>
                 <option value="Computer Networking CN">CS-604 Computer Networking CN</option>
                 <option value="Advance Computer Architecture ACA">CS-605 Advance Computer Architecture ACA</option>
                 -->
                 
                     </select>
      
 
                 
                     </select>
          <div  style="display: none">
              <input type="submit" value="submit" id="booksearch">
          </div>
   </form> 

  </div>
              <div class="actions"  id="qwerty">
      
<!--      <div class="ui positive right labeled icon button"  >-->
      <button id="b6" onclick="searchbooksubmit()" class="ui huge animated green button" value="Show Div"  >
                <span class="visible content">Yep, that's OK</span>
                <span class="hidden content"><i class="pointing right icon"></i></span>
                </button>
<!--      <i class="checkmark icon"></i>-->
<!--    </div>-->

  </div>
             
         </div>
        
        <script>
            $('.ui.modal').modal('setting', 'closable', false).modal('show');
            
            
            $('#selbranch').dropdown();
            $('#selsub').dropdown();
            $('#selsem').dropdown();
            function searchbooksubmit ()
            { 
//                var a=0,b=0,c;
//                a=(document.getElementById("selbranch")).value;
//                b=(document.getElementById("selsem")).value;
//                c=(document.getElementById("selsub")).value;
//                if(a&&b)
//                document.write("enter choiceeeeeeeee"+a+"     "+b+"     "+c);
               $('#booksearch').click();
            }
 
   
        </script>
    </body>
</html>
