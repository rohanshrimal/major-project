<%-- 
    Document   : subjectpage
    Created on : Apr 18, 2017, 12:20:01 PM
    Author     : Lenovo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.bookmodel.BookAdvisoryModel"%>
<%
            ArrayList<BookAdvisoryModel> bam=(ArrayList) session.getAttribute("subjectbook");
            BookAdvisoryModel savedetails=new  BookAdvisoryModel();
            
         String subject=(String)session.getAttribute("subjectsession");
         String ordertype;
            ordertype=(String)session.getAttribute("orderby");
               
        
        %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="../MDB Free/img/img1.png" />
        <title>Korero</title>
         <!--<link rel="icon" type="image/png" href="../images/logo.png" />-->
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
        <%@include file="../nav-sidebar/sidebarforbook.jsp" %>
        
        
        
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.9/semantic.min.css">
         <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.9/semantic.min.js"></script>
        
         
         
         
        
         
         <style>
             
         </style>
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
    </head>
    <body>
        
        <h1 align="right">BOOK ADVISORY</h1>
        
        <div class="image content" style="position:relative; left: 280px;" >
            <div  style="position:relative; left: 100px;" >
          
      <form action="../SearchBookController" method="post" >
      <select onchange="showSub()" name="branch" id="selbranch" class="ui selection dropdown" required >
                  <option value="" disabled selected>BRANCH</option>
                 <option value="Computer Science">COMPUTER SCIENCE</option>
                 <option value="Electronics Communication">ElECTRONICS COMMUNICATION</option>
                 <option value="Civil">CIVIL</option>
                 <option value="Mechanical">MECHANICAL</option>
                 <option value="Fire Technology">FIRE TECHNOLOGY</option>
                 <option value="Chemical">CHEMICAL</option>
                 <option value="Electrical And Electronics">ElECTRICAL AND ELECTRONICS</option>
                     </select>
      
      
      
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
      <select onchange="showSub()" name="sem" id="selsem" class="ui selection dropdown" required>
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
      

          <div  style="display: none">
              <input type="submit" value="submit" id="booksearch">
          </div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button id="b6" onclick="searchbooksubmit()" class="ui huge animated blue button" value="Show Div"  >
                <span class="visible content">SEARCH</span>
                <span><i class="pointing right icon"></i></span>
                </button>
   </form> 
            </div>
            <hr>
        </div>
        <div align="center">
            <br>
            <br>
          
       <div style="position: relative;left: 150px;"> 
        
        <h1 style="color: blue"> <%=subject%> </h1>
        
        
            <span>
  Show me Books by     
  <div class="ui inline dropdown" onchange="abc()">
      <input type="hidden" id="currentUser">
    <div class="text">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <%
            if(ordertype.matches("Rating"))
            {
        %>
              <i class="red large star icon"></i>
             Rating  <i class="sort content descending icon"></i>
         <%
            } else if(ordertype.matches("Price"))
            {
        %>
               <i class="red large rupee icon"></i>
          Price  <i class="sort content ascending icon"></i>
            <%
            } else 
            {
        %>  
        
        
      <i class=" red large remove from calendar icon"></i>
      Date
    
        <%  }  %>
    </div>
    <i class="dropdown icon"></i>
    <div class="menu">
      
      <div class="item" data-value="price">
          <i class="red large rupee icon"></i>
          Price  <i class="sort content ascending icon"></i>
        
      </div>
      <div class="item" data-value="rating">
         <i class="red large star icon"></i>
        Rating  <i class="sort content descending icon"></i>
      </div>
        <div class="item" data-value="date">
             <i class=" red large remove from calendar icon"></i>
      Date   <i class="sort content descending icon"></i>
        </div>
      
    </div>
  </div>
</span>
        </div>
        
        <br/>
        
    <div style="position: relative;left: 130px;">
        
           
            <table class="ui  collapsing celled  table" style='width: 1000px; font-size: 16px' >
                <col width='50'>
                <col width='350'>
                <col width='200'>
                
  <thead align='center'>
      <tr><th  align=>BOOK</th>
          <th  >DETAILS</th>
    <th >RATINGS</th>
  </tr></thead> 
            
  <tbody>
      
            
           <%
          
            for(BookAdvisoryModel bm:bam)
            {
                savedetails.setSubcode(bm.getSubcode());
               
             %> 
             
             
 
             <tr>
                 <td >
            <img src='<%="../BookImageLoader?bcover="+bm.getBookcover()%>' style="height: 200px; width: 200px">
      </td>
      <td >
          <pre>
   <b><%=bm.getBookname()%></b>
   written by : <b><%=bm.getBookauthor()%></b>
          

                                         <button class="ui inverted violet button" value='<%=bm.getBookid()%>' onclick="readMore(this.value)" id='<%=bm.getBookid()%>'>READ MORE</button> </pre>
                                         
      </td>
      <td >
        <div class="ui massive star rating" data-rating="<%=(int)bm.getBookrating()%>" data-max-rating="5" ></div>
      </td>
    </tr>
  <tr/>
             
             
           <%     
            }
        
            %>
         
  </tbody>
</table>     
    </div>
            <div style="display: none">
            <form action="../BookOrderByController" method="post">
                <input type="text" name="sorting" id="sortby">
                <input type="text" name="subcode" value="<%=savedetails.getSubcode()%>">
                <input type="text" name="subject" value="<%=subject%>">
                <input type="submit" id="submitsortby">
            </form>
        </div>
            
            
            <br/><br/>
            
            
            
            
            <div style="display:none">
                <form action="../ReadMoreController" method="post"> 
                    <input type='number' name="bookidinput" id='bookid'>
                                             
                   <input type="submit" id='sendbookid'>
                </form>
            </div>
            <div style="display: none">
                <input id="subcodetemp" type="text" name="subcode" value="<%=savedetails.getSubcode()%>">
            </div> 
            <button id="b6" onclick="openbookmodal()" class="ui huge animated blue button" value="Show Div"  style="position: relative;left: 180px" >
                <span class="visible content">ADD BOOK</span>
                <span><i class="plus icon"></i></span>
                </button>
                
            <br/><br/><br/><br/>        
                
                <div id="bookentrymodal" style="display: none">
                    <div class="ui fullscreen modal" style=" position: absolute; top: 100px;right: 50px; ">
  <i class="close icon"></i>
  <div class="header" align="center" style="color:blue; ">
    ADD NEW BOOK
  </div>
  <div class="image content">
    
    <div class="description">
<!--      <div class="ui header">We've auto-chosen a profile image for you.</div>-->   
<form class="ui form" action="../AddNewBookController" method="post" enctype="multipart/form-data">
          <div class="two fields">
      <div class="field">
      <label>BOOK NAME</label>
      <input placeholder="Book Name" type="text" name="bookname" required>
    </div>
    <div class="field">
      <label>AUTHOR NAME</label>
      <input placeholder="Author Name" type="text" name="bookauthor" required>
    </div>

    </div>
          <br/>
          <div class="two fields">
      <div class="field">
      <label>BOOK PRICE</label>
      <input placeholder="Book PRICE" type="text" name="bookprice" required>
    </div>
    <div class="field">
      <label>BOOK COVER</label>
      <input placeholder="cover" type="file" name="bookcover" required>
    </div>

    </div>
          <br/>
          
          <div class="field">
          <label>BOOK DESCRIPTION</label>
          <textarea placeholder="Description" name="bookdesc" required></textarea>
          </div>
          
          <div style="display: none">
              <input type="submit" value="submit" id="submitbook">
          </div>
                </form>
    </div>
  </div>
  <div class="actions" ">
    <div class="ui black deny button">
      Nope
    </div>
     <button id="b6" onclick="submission()" class="ui  animated blue button"  >
                <span class="visible content">SAVE BOOK</span>
                <span><i class="pointing right icon"></i></span>
                </button>
  </div>
</div>
                    
                </div>
        </div>
                
                <script>
                    
                    $('.ui.rating').rating({interactive : false});
                    $('#selsem').dropdown();

                    $('#selbranch').dropdown();
                    $('#selsub').dropdown();
                    $('.ui.dropdown').dropdown();
                    
                    function abc(){
                       var x= $('.ui.dropdown').dropdown('get value');
                       document.getElementById("sortby").value=x;
                       
                       $('#submitsortby').click();
                       
                    }
                                                   
                    function openbookmodal(){
                        document.getElementById("bookentrymodal").style.display="block";
                   
                        $('.fullscreen.modal').modal('setting', 'closable', false).modal('show');
                    }
                    
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
            
            function readMore(x)
            {
               document.getElementById("bookid").value=x;
               
                
                $('#sendbookid').click();
            }
            
            function submission(){
                $('#submitbook').click();
            }
                </script>
    </body>
</html>
