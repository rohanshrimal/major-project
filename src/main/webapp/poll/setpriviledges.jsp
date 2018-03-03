<%-- 
    Document   : mypollview
    Created on : Apr 5, 2017, 2:42:08 PM
    Author     : Lenovo
--%>
<%
             
               String msg = request.getParameter("msg");
              
               if(msg!=null)
                {
                    int x=Integer.parseInt(msg);
                    if(x==1)
                    {
        %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="../MDB Free/img/img1.png" />
        <title>Korero</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.9/semantic.min.css">
         <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.9/semantic.min.js"></script>
        
         <style>
             #studstar{
                 position: absolute;
                 left: 115px;
                 top: 430px;
             }
             
             #facstar{
                 position: absolute;
                 right: 115px;
                 top: 430px;
             }
             
             #mid{
                 position: absolute;
                 left: 380px;
                 top: 230px;
             }
             .select1{
                width: 50%; 
             /*  align-content: center;
               align-items: center;*/
                 font-size: 24px; 
                 padding: 1px;
              /*  border: solid 1px red;*/
                margin: auto;
              /*  box-shadow: inset 1px 1px 2px 0 #707070;*/
              /*transition: box-shadow 0.3s, border 0.3s;*/
            }
            
         </style>
        
    </head>
    <body>
      
       
        
     <div id="select"  style="display: block"> 
                <div class="ui basic first  modal" >
                 <div class="ui icon header">
                      <i class="add user icon"></i>
                               WHO CAN VOTE?
                </div>

                 <div >
  
                     <img class="ui medium circular image" src="../imagesdomain/stud.png" align="left"    > 
    
    
                     <img class="ui medium circular image" src="../imagesdomain/fac.png" align="right"  >
   
                     
            
                     <div id="studstar">
      
                            <div class="ui massive star rating" data-max-rating="1">

                                <i class="big red favorite  icon"  onclick="proceed1()" ></i>
        
                            </div>
                     </div>
                     
                     <div id="facstar">
      
                            <div class="ui massive star rating" data-max-rating="1">

                                <i class="big red favorite  icon" onclick="proceed2()" ></i>
        
                            </div>
                     </div>
                     
                     <div id="pro" style="display: none" >
                         
                 <button  id="mid" onclick="viewpoll()" class="ui huge animated blue button" value="Show Div" >
                      <span class="visible content">PROCEED</span>
                     <span class="hidden content"><i class="right arrow icon"></i></span>
             
                     </div>
                </div>  
                            
                   
   
         </div>
                
     </div>  
                             
                    <div id="area" style="display:none">
                        <div class="ui second modal" id="selectarea">
  
  <div class="header" align="center">
    VOTERS
  </div>
  <div class="image content">
   
      
      <select name="ty1" id="selbranch" onkeydown="if (event.keyCode === 13)
                        document.getElementById('b5').click()" class="ui selection dropdown">
                 <option value="all">ALL BRANCH</option>
                 <option value="Computer Science">COMPUTER SCIENCE</option>
                 <option value="Electronics Communication">ElECTRONICS COMMUNICATION</option>
                 <option value="Civil">CIVIL</option>
                 <option value="Mechanical">MECHANICAL</option>
                 <option value="Fire Technology">FIRE TECHNOLOGY</option>
                 <option value="Chemical">CHEMICAL</option>
                 <option value="Electrical And Electronics">ElECTRICAL AND ELECTRONICS</option>
                     </select>
      
      
      <div id="studview" style="display:none">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <select name="ty2" id="selsem" onkeydown="if (event.keyCode === 13)
                         document.getElementById('b6').click()" class="ui selection dropdown">
                 <option value="0">ALL SEM</option>
                 <option value="1">I</option>
                 <option value="2">II</option>
                 <option value="3">III</option>
                 <option value="4">IV</option>
                 <option value="5">V</option>
                 <option value="6">VI</option>
                 <option value="7">VII</option>
                 <option value="8">VIII</option>
                     </select>
      
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <select name="ty3" id="selsection" onkeydown="if (event.keyCode === 13)
                        document.getElementById('b7').click()" class="ui selection dropdown">
                 <option value="0">ALL SECTION</option>
                 <option value="1">1</option>
                 <option value="2">2</option>
                 <option value="3">3</option>
                 
                     </select>
      </div>
   
  </div>
  <div class="actions" onclick="pollsave1()">
      
      <div class="ui positive right labeled icon button"  >
      Yep, that's OK
      <i class="checkmark icon"></i>
    </div>
  </div>

                       
                    </div>
          </div>      
               
                
                  <div style="display:none" >
         
         
                        <form action="../SetPriviledges" method="post">
                            <input type="text" name="pollviewer" id="pollviewer">
                            <input type="text" name="branch" id="branch">
                            <input type="text" name="sem"   id="sem">
                            <input type="text" name="sec"  id="sec">
                            </div>
                        
                            <div id="pollsave" style="display:none" >
                                <input type="submit" value="SAVE" id="savebutton">
                        </form>
                        </div>
               
              
               <script>
                   
                   $('.coupled.modal')
  .modal({
    allowMultiple: false
  })
;
// attach events to buttons
$('.second.modal')
  .modal('attach events', '.first.modal .button').modal('setting', 'closable', false)
  .modal('setting', 'transition', 'horizontal flip');
;
// show first now
$('.first.modal').modal('setting', 'closable', false).modal('show');
$('.first.modal')
        .modal('setting', 'transition', 'horizontal flip')
        .modal('show')
      ;
      
     
            $('#selsection').dropdown();
            $('#selsem').dropdown();
            $('#selbranch').dropdown();
                   
                   
                   
            $('.img1.image').transition('pulse');
         
           $('.ui.rating').rating();
             //   $('.ui.modal').modal('setting', 'closable', false).modal('show');
              var x=0,y=0,countx=1,county=1;
                  function proceed1(){
                      
                      if(countx%2!==0 )
                      {
                          x=1;
                           document.getElementById("pro").style.display="block";
                           countx++;
                       }else
                       {
                           x=0;
                      if(y===0)
                          document.getElementById("pro").style.display="none";
                          countx++;
                       }
                  }
                  
                  function proceed2(){
                      
                       if(county%2!==0)
                      {
                        y=1;
                         document.getElementById("pro").style.display="block";
                         county++;
                      }else
                       {
                           y=0;
                      if(x===0)
                          document.getElementById("pro").style.display="none";
                          county++;
                       }
                  }
                  
         function viewpoll()
         {
             document.getElementById("area").style.display="block";
             if(x===1)
                  document.getElementById("studview").style.display="block";
             //$('.ui.modal').modal('hide');
         }
         
         function pollsave1(){
             
             if (x===1&&y===1)
                  document.getElementById("pollviewer").value="all";
             
              else  if(y===1)
                 document.getElementById("pollviewer").value="faculty";
             else if(x===1)
                 document.getElementById("pollviewer").value="student";
              
                 
             var a,b,c;
            
                    a = document.getElementById("selbranch").value;
                    document.getElementById("branch").value=a;
                    
                    b = document.getElementById("selsem").value;
                    document.getElementById("sem").value=b;
                    
                    
                    
//                    document.getElementById("p1").innerHTML="hiiiii";
                    
        
        
                    c = document.getElementById("selsection").value;
                    document.getElementById("sec").value=c;
                    
                  //  document.getElementById("pollsave").style.display="block";
                    //document.getElementById('savebutton').click();
//                    savebutton.performClick();
$("#savebutton").click();
         }
         
        
        </script>
    </body>
</html>
 <% }
    } %>