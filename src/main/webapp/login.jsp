<%
Cookie c[]=request.getCookies();
String id="",pwd="";
if(c!=null)
{    
    for(int i=0;i<c.length;i++)
    {
        String name=c[i].getName();
        if(name.equals("uid"))
            id=c[i].getValue();
    
        else if(name.equals("pwd"))
            pwd=c[i].getValue();
    }
}    
%>

<html>
<head>
<style>
    
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 80%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0} 
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}
</style>


</head>
<body>

<h2>LOG-IN</h2>
<pre>
<form action="VerifyUser" method="post">
ID          <input type="text" name="id" value="<%=id%>"/>
PASSWORD    <input type="password" name="pwd" value="<%=pwd%>"/>

            <input type="checkbox" name="rememberme" value="yes"/>REMEMBER-ME

            <a href="">FORGET-PASSWORD</a>
            
            
            <input type="submit" value="LOG-IN"/>
</form>
</pre>
<a href="KoreroContent?utype=student">Student Register</a><br>
<a href="KoreroContent?utype=faculty">faculty Register</a>
<!-- Trigger/Open The Modal -->
<button id="myBtn">REGISTER HERE..</button>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2>USER CATEGORY</h2>
    </div>
    <div class="modal-body">
        <form action="register.jsp" method="get">
        FACULTY <input type="radio" name="user" value="faculty" /><br><br>
        STUDENT <input type="radio" name="user" value="student" /><br><br>
       <input type="submit" value="submit"/>
        </form>
    </div>
      
    
  </div>

</div>

<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
};

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
};

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target === modal) {
        modal.style.display = "none";
    }
};
</script>


</body>
</html>