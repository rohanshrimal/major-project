<%@page import="model.KeyWordModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.AllKeyWordModel"%>
<!DOCTYPE html>

<%
AllKeyWordModel alkwm=(AllKeyWordModel)session.getAttribute("alkwm");
String uid=request.getParameter("uid");
ArrayList<KeyWordModel> alkm=alkwm.getAlkwm();
%>

<html lang="en">

<head>
<script>
 function setkeywordid(x,index)
{
    var itelements=document.getElementsByClassName("it");
    itelements[index].id=""+x;
}</script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/png" href="MDB Free/img/img1.png" />
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>Korero</title>
    

    <!-- Font Awesome -->
    <link rel="stylesheet" href="MDB Free/font-awesome-4.7.0/css/font-awesome.min.css">
   
    <!-- Bootstrap core CSS -->
    <link href="MDB Free/css/bootstrap.min.css" rel="stylesheet">

    <!-- Material Design Bootstrap -->
    <link href="MDB Free/css/mdb.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="MDB Free/css/chip.css">
    <!-- Template styles -->
    <style rel="stylesheet">
        /* TEMPLATE STYLES */
        
        main {
            margin-top: 3rem;
        }
        
        main .card {
            margin-bottom: 2rem;
        }
        
        @media only screen and (max-width: 768px) {
            .read-more {
                text-align: center;
            }
        }
        
        
        footer.page-footer {
                      background-color: #33b5e5;

            margin-top: 2rem;
        }
    </style>

</head>

<body>

    
    <header>
         <!--Navbar-->
    <nav class="navbar navbar-toggleable-md navbar-dark fixed-top bg-info">
        <div class="container">
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNav1" aria-controls="navbarNav1" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
             <a class="navbar-brand">
                <img src="MDB Free/img/logo.png" class="img-fluid" style="width: 180px">
            </a>
            <div class="collapse navbar-collapse" id="navbarNav1">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="GetStarted.jsp">Get started</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="About.jsp">About</a>
                    </li>
                    <li class="nav-item ml-5 pl-5">
                        <a class="nav-link"><i class="fa fa-check-circle"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"><i class="fa fa-check-circle"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"><i class="fa fa-check-circle"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"><i class="fa fa-dot-circle-o"></i> Choose your interests</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"><i class="fa fa-circle"></i></a>
                    </li>

                </ul>
            </div>
        </div>
    </nav>
    <!--/.Navbar-->
    </header>

    <main class="mt-5">
        <!--Main layout-->
        <div class="container">
            <!--Page heading-->            
            <div class="row">
                <div class="col-md-12">
                    <h1 class="h1-responsive">Choose Your Interests
                        <small class="text-muted">: The things about which you want to hear</small>
                    </h1>
                </div>
            </div>
            <br>
            <!--/.Page heading-->
            <hr>
            <br>
            <!--First row-->
            <%int l=0;for(KeyWordModel kwm: alkm){
            ArrayList<String> knamelist=kwm.getKeyName();
            ArrayList<Integer> kidlist=kwm.getKeyId();
            int i=0;
            %>
             <div class="row">
                <div class="col-md-12">
                    <div class="carousel slide carousel-fade domain" data-ride="carousel">
            <!--Indicators-->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-3" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-3" data-slide-to="1"></li>
            </ol>
            <!--/.Indicators-->
            <!--Slides-->
            <div class="carousel-inner" role="listbox">
                <!--First slide-->
                <div class="carousel-item active animated fadeInLeft">
                    <div class="row"  style="min-width: 100%;">
                       <div class="card-group" style="min-width: 100%;">
                            <div class="card text-center ml-4" style="max-width: 230px;">
                                <div class="card-block">
                                    <img class="img-fluid" src="imagesdomain/<%= kwm.getImgpath() %>" alt="Card image cap" style="max-height: 130px;margin: auto;">
                                    <h4 class="card-title"><%= kwm.getDname() %></h4>
                                </div>
                            </div>
                                <%for(int j=0;j<3 && i<knamelist.size() ;j++){%>
                            <div class="card">
                                <div class="card-block">
                                    
                                   <div class="btn-group text-center" data-toggle="buttons" style="display: inherit;">
                                      <%for(int k=0;k<3 && i<knamelist.size();k++,i++){
                                      %>
                                       <label class="btn btn-primary mb-1">
                                           <input type="checkbox" class="it"> <%= knamelist.get(i) %>
                                      </label>
                                           <script>setkeywordid(<%= kidlist.get(i) %>,<%=l*27+i%>);</script>
                                           <br>
                                       <%}%>
                                      
                                   </div>
                                </div>
                            </div>
                                       <%}%>
                            
                            
                        </div>
                    </div>
                </div>
                <!--/First slide-->
                <!--Second slide-->
                <div class="carousel-item animated fadeInRight">
                    <div class="row"  style="min-width: 100%;">
                       <div class="card-group" style="min-width: 100%;">
                           <%for(int j=0;j<3 && i<knamelist.size();j++){%>
                            <div class="card">
                                <div class="card-block">
                                   <div class="btn-group text-center" data-toggle="buttons" style="display: inherit;">
                                      <%for(int k=0;k<3 && i<knamelist.size();k++,i++){%>
                                       <label class="btn btn-primary mb-1">
                                           <input type="checkbox" class="it"> <%= knamelist.get(i) %>
                                      </label>
                                      <script>setkeywordid(<%= kidlist.get(i) %>,<%=l*27+i%>);</script>
                                           
                                      <br>
                                      <%}%>
                                   </div>
                                </div>
                            </div>
                            <%}%>
                            
                        </div>
                    </div>
                </div>
                <!--/Second slide-->
                
                <div class="carousel-item animated fadeInRight">
                    <div class="row"  style="min-width: 100%;">
                       <div class="card-group" style="min-width: 100%;">
                            <%for(int j=0;j<3 && i<knamelist.size();j++){%>
                           <div class="card">
                                <div class="card-block">
                                   <div class="btn-group text-center" data-toggle="buttons" style="display: inherit;">
                                      <%for(int k=0;k<3 && i<knamelist.size();k++,i++){%>
                                       <label class="btn btn-primary mb-1">
                                           <input type="checkbox" class="it"> <%= knamelist.get(i) %>
                                      </label>
                                           <script>setkeywordid(<%= kidlist.get(i) %>,<%=l*27+i%>);</script>
                                           
                                      <br>
                                      <%}%>
                                   </div>
                                </div>
                            </div>
                            <%}%>
                            
                        </div>
                    </div>
                </div>
                
            </div>
            <!--/.Slides-->
            <!--Controls-->
            <a class="carousel-control-prev dprev" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true" style="background-color: #000000;margin-bottom: 50px;margin-right:100px;"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next dnext" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true" style="background-color: #000000;margin-bottom: 50px;margin-left: 50px;"></span>
                <span class="sr-only">Next</span>
            </a>
            <!--/.Controls-->
        </div>
        <!--/.Carousel Wrapper-->
        </div>       
    </div>
             <%l++;%>
            

<%
}%>
                
    
      <div class="text-center mt-2 mb-2">
      <button class="btn btn-primary text-center" onclick="return test1();">submit</button>
      </div>

        </div>
        <!--/.Main layout-->
    </main>

    <!--Footer-->
   <footer class="page-footer center-on-small-only mt-3">

        <div class="container-fluid text-center" style="padding-bottom: 10px;">
            © 2017 Made with <i class="fa fa-heart" aria-hidden="true" style="color: #ff4444;"></i> by team Korero
        </div>
    <!--/.Copyright-->

</footer>
 <!--/.Footer-->

    <!-- SCRIPTS -->
    <script type="text/javascript" src="MDB Free/js/select.js"></script>

    <!-- JQuery -->
    <script type="text/javascript" src="MDB Free/js/jquery-2.2.3.min.js"></script>

    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="MDB Free/js/tether.min.js"></script>

    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="MDB Free/js/bootstrap.min.js"></script>

    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="MDB Free/js/mdb.min.js"></script>
    <script>
    new WOW().init();
    $('.carousel').carousel({
  interval: false
})

    </script>
    <script type="text/javascript">
        function test()
{
    var idSelector = function() { return this.id; };
    var select = $(":checkbox:checked").map(idSelector).get() ;
    var notselect = $(":checkbox:not(:checked)").map(idSelector).get() ;
    var inputElems = document.getElementsByTagName("input"),
    count = 0;

    for (var i=0; i<inputElems.length; i++) {       
       if (inputElems[i].type == "checkbox" && inputElems[i].checked == true){
          count++;
       }
    }
      if (count<5) {alert("Choose atleast 5 workspaces");}
  
   // alert("selected: " + select  + "\nnotselecte " + notselect);
}
setIds();
function setIds(){
    var carouselElement=document.querySelectorAll('.domain');
    var prevElement=document.querySelectorAll('.dprev');
    var nextElement=document.querySelectorAll('.dnext');
    
    for(i=0;i<25;i++){
        carouselElement[i].id="carousel"+i;
        prevElement[i].href="#carousel"+i;
        nextElement[i].href="#carousel"+i;
    }
}



function test1()
{
    var idSelector = function() { return this.id; };
    var select = $(":checkbox:checked").map(idSelector).get() ;
    var notselect = $(":checkbox:not(:checked)").map(idSelector).get() ;
    console.log(select);
    if (select.length<6) {alert("choose atleast five areas of interest");return false;}
    window.location.href="SaveKeywords?uid=<%=uid%>"+"&keys="+select;
    console.log(select);
}

    </script>
   
  
    
</body>

</html>