<%-- 
    Document   : registe
    Created on : 11 Mar, 2017, 2:04:10 PM
    Author     : rohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body>
        <pre>
<%
    String usertype[]=request.getParameterValues("user");
%>

        <h1>Registration Form</h1>
<%
if(usertype[0].equals("student")){
%>
        <form action="SaveUser?utype=student" method="post">
            NAME                <input type="text" name="name"/>
            ID                  <input type="text" name="id" />
            E-MAIL              <input type="text" name="email" />
            BRANCH              <select name="branch"><option>COMPUTER SCIENCE</option><option>INFORMATION TECHNOLOGY</option><option>CIVIL</option><option>MECHANICAL</option><option>ELECTRICAL</option><option>ELECTRONICS</option></select>
            SEMESTER            <select name="sem"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option></select>
            SECTION             <select name="sec"><option>A</option><option>B</option><option>C</option><option>D</option><option>E</option></select>
            PASSWORD            <input type="password" name="password" />
            RETYPE-PASSWORD     <input type="password" name="" />
            SECURITY QUESTION   <select name="sq"><option>WHAT'S YOUR NICKNAME?</option><option>WHAT'S YOUR PET'S NAME?</option><option>WHO'S YOUR IDEAL?</option><option>WHICH BOOK DO YOU READ?</option><option>WHAT'S YOUR MOTHER'S BIRTH DATE?</option></select>
            SECURITY ANSWER     <input type="text" name="sa" />
            
            <input type="submit" value="REGISTER"/>
        </form>
<% }
else if(usertype[0].equals("faculty")){
%>
<form action="SaveUser?utype=faculty" method="post">
            NAME            <input type="text" name="name" />
            ID              <input type="text" name="id" />
            E-MAIL          <input type="text" name="email" />
            DEPARTMENT      <select name="dept"><option>COMPUTER SCIENCE</option><option>INFORMATION TECHNOLOGY</option><option>CIVIL</option><option>MECHANICAL</option><option>ELECTRICAL</option><option>ELECTRONICS</option><option>ACCOUNTS</option><option>TRANSPORT</option><option>TRAINING AND PLACEMENT</option><option>LIBRARY</option></select>
            PASSWORD        <input type="password" name="password" />
            RETYPE-PASSWORD <input type="password" name="" />
            SECURITY QUESTION<select name="sq"><option>WHAT'S YOUR NICKNAME?</option><option>WHAT'S YOUR PET'S NAME?</option><option>WHO'S YOUR IDEAL?</option><option>WHICH BOOK DO YOU READ?</option><option>WHAT'S YOUR MOTHER'S BIRTH DATE?</option></select>
            SECURITY ANSWER <input type="text" name="sa" />
            
            <input type="submit" value="REGISTER"/>
        </form>
<%  } %>
        </pre>
       
    </body>
</html>
                                                                                                            <li><a class="dropdown-item" id="1" onclick="myfunct3(this.id)">COMPUTER SCIENCE</a></li>
                                                                                                            <li> <a class="dropdown-item" id="2" onclick="myfunct3(this.id)">MECHANICAL</a></li>
                                                                                                            <li> <a class="dropdown-item" id="3" onclick="myfunct3(this.id)">INFORMATION TECHNOLOGY</a></li>
                                                                                                            <li> <a class="dropdown-item" id="4" onclick="myfunct3(this.id)">ELECTRICAL</a></li>                                    
                                                                                                            <li> <a class="dropdown-item" id="5" onclick="myfunct3(this.id)">ELECTRONICS</a></li>
                                                                                                            <li> <a class="dropdown-item" id="6" onclick="myfunct3(this.id)">FIRE TECH</a></li>
                                                                                                            <li> <a class="dropdown-item" id="7" onclick="myfunct3(this.id)">CHEMICAL</a></li>
                                                                                                            <li> <a class="dropdown-item" id="8" onclick="myfunct3(this.id)">CIVIL</a></li>
                                                                                                            
                                                                                                            
                                                                                                            
                                                                                                            
                                                                                                            
                                                                                                            
                                                                                                            <li><a href="#" id="s1" onclick="myfunc2(this.id)">1</a></li>
														<li><a href="#" id="s2" onclick="myfunc2(this.id)">2</a></li>
														<li><a href="#" id="s3" onclick="myfunc2(this.id)">3</a></li>	
														<li><a href="#" id="s4" onclick="myfunc2(this.id)">4</a></li>
														<li><a href="#" id="s5" onclick="myfunc2(this.id)">5</a></li>
														<li><a href="#" id="s6" onclick="myfunc2(this.id)">6</a></li>
														<li><a href="#" id="s7" onclick="myfunc2(this.id)">7</a></li>	
														<li><a href="#" id="s8" onclick="myfunc2(this.id)">8</a></li>