<%-- 
    Document   : readmore
    Created on : Apr 19, 2017, 5:51:51 PM
    Author     : Lenovo
--%>

<%@page import="model.bookmodel.BookCommentModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bookmodel.BookAdvisoryModel"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="../MDB Free/img/img1.png" />
        <title>Korero</title>
        
         <!--<link rel="icon" type="image/png" href="../images/logo.png" />-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>


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
        <%@include file="../nav-sidebar/sidebarforbook.jsp" %>
        
        
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.9/semantic.min.css">
         <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.9/semantic.min.js"></script>
 
               <style>
            #qid {
  padding: 10px 15px;
  -moz-border-radius: 50px;
  -webkit-border-radius: 50px;
  border-radius: 20px;
}




label .glyphicon {
    top: 34%
}




.modal-header {
    background-color: transparent;
    color: inherit
}

.modal-body {
   
    min-height: 280px;
    
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

             
             
             
             
             
             
             
             
             
             
             
             
/*             
             #bookimage{
                 position: absolute;
                 left: 50px;
                 top: 100px;
                 
             }*/
             #namerating{
                 position: relative;
                 left: 380px;
                bottom: 350px;
                 
                 
             }
             #ratingsdiv{
                 position: relative;
                 left: 330px;
                 bottom: 300px;
             }
             #giverating{
                 position: relative;
                 left: 400px;
                 bottom: 300px;
             }
             #price{
                 position: relative;
                 left: 40px;
                 bottom: 120px;
             }    
             
             #desc{
                 position: absolute;
                 left: 380px;
                 top: 300px;
             }
             #homepage{
                 position: absolute;
                 left: 1250px;
                 top: 100px;
             }
             #comments{
                 position: absolute;
                 left: 450px;
                 top: 500px;
             }
             
            
         </style>
          <script>
      var request;
      function rate(x){
       
       
       request=new XMLHttpRequest();
       request.onreadystatechange=getSub;
       request.open("get", "../BookRatingController?rate="+x, true);
       request.send(null);
      }
      function getSub(){
        // if(request.readystate==4 && request.status==200){
            if(request.status==200 && request.readyState==4)
             document.getElementById("avgstar").innerHTML=request.responseText;
         //}
         $('.ui.second.rating').rating('disable');
      }
      function delcomment(cid){
       
       
       request=new XMLHttpRequest();
       request.onreadystatechange=afterdel;
       request.open("get", "../DelCommentController?cid="+cid, true);
       request.send(null);
      }
      function afterdel(){
          
          if(request.status==200 && request.readyState==4)
               $('#subdelcomment').click();
      }
    </script>
    </head>
    <body>
        
        <%
            session=request.getSession(); 
           BookAdvisoryModel bm=(BookAdvisoryModel)session.getAttribute("readmorebook");
           String subject=(String)session.getAttribute("subjectsession");
         
         %>
        
        
        
        
        
         <div class="container-fluid bg-info" style="position: relative;background-color: white; ">
            <div class="modal-dialog" style="position: relative; left: 100px;width:1000px; ">
                <div class="modal-content">
         <div class="modal-header">
            <h1 align="center" style="color: #000;  font-size: 48px"><%=subject%></h1>
        </div>
        
        
        <div class="modal-body" style="min-height:  200px;">
            
            
          <div id="bookimage">
         <img src="<%="../BookImageLoader?bcover="+bm.getBookcover()%>" style="height: 380px; width: 300px">
         </div> 
         
          <div id="namerating">
              <br/>
             <b style="color: black;  font-size: 32px"><%=bm.getBookname()%></b><br/><br/>

             written by  :&nbsp;&nbsp;&nbsp;&nbsp; <b style="color: red;  font-size: 28px"> <%=bm.getBookauthor()%></b>
          
         </div>
             
               <div class="ui large label" id="ratingsdiv">
                 <div class="ui massive star rating" data-max-rating="1">   </div> <b id="avgstar" style="font-size: 36px" id="ratestar"><%=(float)bm.getBookrating()%>/5</b>
                 <br/><br/>    <b style='font-size: 24px'>User's Rating</b> 
              </div>
        
               <div class="ui large label" id='giverating'>
               
                
                     <% 
                         int userrating=0;
                                 userrating=(Integer)session.getAttribute("userrating");
                         boolean ratedisable=false;
                                 ratedisable=(Boolean)session.getAttribute("ratedisable");
                           if(ratedisable)
                           {   System.out.println("USERRATING="+userrating);
                     %>
                    
                    
                    <div class="ui massive third star rating" data-rating="<%=userrating%>" data-max-rating="5" id="ratestar"></div>
                     <br/><br/> <b style='font-size: 32px'>Your Rating </b>  
                    <%
                           }else
                              {
                            
                     %>
                      
                     
                     
   <div class="ui massive second star rating" data-rating="0" data-max-rating="5" id="ratestar" ></div>
   <br/><br/>  <b style='font-size: 24px'>Your Rating </b>
                             <%   } 
                                session.setAttribute("ratedisable", false);
                             %>
               
             </div>
             
                   
                 <div id="price" style="font-size: 32px; color: red">
                    
                     
                 
                     PRICE: <b style="font-size: 44px; color: black"><i class="rupee icon"></i><%=bm.getBookprice()%><b/>
                 </div>
                             
                             
             
               <div id="desc" style="font-size: 22px; color: black">
                     <br/>
                     Description :<br/><br/>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <%=bm.getBookdesc()%>
                 
                     
                    
   </div>
               
             
             
              <h2 style="color: #000">COMMENTS:</h2>
                     <hr>
                 
                <%
                  ArrayList <BookCommentModel> arrbcm=(ArrayList) session.getAttribute("commentarray");
                  String userid=(String)session.getAttribute("logeduserccode");
                  if(arrbcm!=null){ for(BookCommentModel bcm : arrbcm)
                   {
                %>
                 <div class="ui comments" >
  <div class="comment">
    <a class="avatar">
        <img src='<%="../BookImageLoader?bcover="+bcm.getCommentorprofileimgpath()%>' style="width:45px; height: 45px;">
    </a>
    <div class="content">
      <a class="author"><%=bcm.getCommentorname()%></a>
      <div class="metadata">
        <div class="date"><%=bcm.getTimestamp()%></div>
       
      </div>
      <div class="text">
       <%=bcm.getComment()%>
      
      <%
          if(userid!=null && userid.equalsIgnoreCase(bcm.getCommentorid()))
          {
              System.out.println("hhhhhhhhhhhhhhhhhhhhhhh");
      %>
      <div class="metadata" >
          <div class="date"  > <button onclick="delcomment(<%=bcm.getCommentid()%>)">DELETE</button></div>
       
      </div>
      <%  }  %>
      </div>
    </div>
  </div>
</div>
       <%
           }}
       %>
                     
                     
                  
                 <form class="ui reply form" action="../BookCommentController" method="post">
                  <div class="field">
                <textarea rows="4" cols="80" name="commenttext"></textarea>
                  </div>
    
                         <button class="ui inverted violet button" onclick="submitcomment()">COMMENT</button>
          
        <div style="display: none">
            <input type="submit" id="commentsubmit">;
        </div>
  </form>
                         
                 
       <div style="display: none">
           <form action="../ReadMoreController" method="post">
           <input type="text" name="bookidinput" value="<%=bm.getBookid()%>">
           <input type="submit" id="subdelcomment">
           </form>
       </div>
                 
              
              
                 
   <div class="modal-footer text-muted">
    <span id="answer"></span>
</div>
</div>
</div>
</div>
        
        
        
        
            
       
        
        
         
         
        
         
           
        
                                     
              
                 
            
                 
                 
                   </div>  

          
                 
                 
         <script >
    $('.ui.rating').rating({
      initialRating: 1,
      interactive: false
  });
  
  $('.ui.second.rating').rating({interactive : true}).rating('setting', 'onRate', function(value) {
      
      rate(value);
      
  });
  
  $('.ui.third.rating').rating({
       interactive: false
  });
  
  
function submitcomment()
{
    $('#commentsubmit').click();
}


console.log("<%=session.getAttribute("ratedisable") %>--------");
  </script>
    </body>
</html>
