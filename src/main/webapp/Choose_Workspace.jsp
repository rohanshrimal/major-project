<!DOCTYPE html>

<% String uid=request.getParameter("uid"); %>

<html lang="en">

<head>

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
                        <a class="nav-link" href="About.jsp">About Us</a>
                    </li>
                    <li class="nav-item ml-5 pl-5">
                        <a class="nav-link"><i class="fa fa-check-circle"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"><i class="fa fa-check-circle"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"><i class="fa fa-dot-circle-o"></i> Choose Workspaces</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"><i class="fa fa-circle-o"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"><i class="fa fa-circle"></i></a>
                    </li>

                </ul>
            </div>
        </div>
    </nav>
    <!--/.Navbar-->    </header>

    <main class="mt-5">
        <!--Main layout-->
        <div class="container">
            <!--Page heading-->
            
            <div class="row">
                <div class="col-md-12">
                    <h1 class="h1-responsive">Choose workspace
                        <small class="text-muted">: The things that you are good at</small>
                    </h1>
                </div>
            </div>
 <br>  <!--/.Page heading-->
            <label id="label">
              </label>
            <hr>
            
            
            
            <!--First row-->
            <div class="row wow">
                
                
                <div class="col-lg-3 wow fadeIn" data-wow-delay="0.2s">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-light" id="overlay1">
                            <img src="imagesdomain/ComputerScience(1).png" class="img-fluid" style="margin: auto;width: 200px; height: 200px;" alt="">
                            <a onclick="test1('check1','overlay1','cover1','Computer Science')">
                                <div class="mask" id="cover1"><input type="checkbox" style="visibility: hidden;" id="check1"></div>
                            </a>
                            
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Computer Science</h4>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                
                <!--First column-->
                <div class="col-lg-3 wow fadeIn" data-wow-delay="0.4s">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-light" id="overlay2">
                            <img src="imagesdomain/mechanical.png" class="img-fluid" style="margin: auto;width: 200px; height: 200px;"  alt="">
                            <a onclick="test1('check2','overlay2','cover2','Mechanical')">
                                <div class="mask" id="cover2"><input type="checkbox" style="visibility: hidden;" id="check2"></div>
                            </a>
                            
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Mechanical</h4>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--/.First column-->

                <!--Second column-->
                <div class="col-lg-3 wow fadeIn" data-wow-delay="0.6s">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-light" id="overlay3">
                            <img src="imagesdomain/it.png" class="img-fluid" style="margin: auto;width: 200px; height: 200px;" alt="">
                            <a onclick="test1('check3','overlay3','cover3','Information Technology')">
                                <div class="mask" id="cover3"><input type="checkbox" style="visibility: hidden;" id="check3"></div>
                            </a>
                            
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Information Tech</h4>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--/.Second column-->

                <!--Third column-->
                <div class="col-lg-3 wow fadeIn" data-wow-delay="0.8s">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-light" id="overlay12">
                            <img src="imagesdomain/accounts2.png" class="img-fluid" style="margin: auto;width: 200px; height: 200px;" alt="">
                            <a onclick="test1('check12','overlay12','cover12','Accounts')">
                                <div class="mask" id="cover12"><input type="checkbox" style="visibility: hidden;" id="check12"></div>
                            </a>
                            
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Accounts</h4>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--/.Third column-->
            </div>
            <!--/.First row-->

            <!--Second row-->
            <div class="row">
                
                <div class="col-lg-3 wow fadeIn" data-wow-delay="0.2s">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-light" id="overlay4">
                            <img src="imagesdomain/electical.png" class="img-fluid" style="margin: auto;width: 200px; height: 200px;" alt="">
                            <a onclick="test1('check4','overlay4','cover4','Electrical')">
                                <div class="mask" id="cover4"><input type="checkbox" style="visibility: hidden;" id="check4"></div>
                            </a>
                            
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Electrical</h4>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                
                <!--First column-->
                <div class="col-lg-3 wow fadeIn" data-wow-delay="0.4s">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-light" id="overlay5">
                            <img src="imagesdomain/electriccc.png" class="img-fluid" style="margin: auto;width: 200px; height: 200px;" alt="">
                            <a onclick="test1('check5','overlay5','cover5','Electronics')">
                                <div class="mask" id="cover5"><input type="checkbox" style="visibility: hidden;" id="check5"></div>
                            </a>
                            
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Electronics</h4>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--/.First column-->

                <!--Second column-->
                <div class="col-lg-3 wow fadeIn" data-wow-delay="0.6s">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-light" id="overlay6">
                            <img src="imagesdomain/fire-icon.jpg" class="img-fluid" style="margin: auto;width: 200px; height: 200px;" alt="">
                            <a onclick="test1('check6','overlay6','cover6','Fire Tech')">
                                <div class="mask" id="cover6"><input type="checkbox" style="visibility: hidden;" id="check6"></div>
                            </a>
                            
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Fire Tech</h4>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--Second column-->

                <!--Third column-->
                <div class="col-lg-3 wow fadeIn" data-wow-delay="0.8s">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-light" id="overlay11">
                            <img src="imagesdomain/placement.png" class="img-fluid" style="margin: auto;width: 200px; height: 200px;" alt="">
                            <a onclick="test1('check11','overlay11','cover11','Placement Cell')">
                                <div class="mask" id="cover11"><input type="checkbox" style="visibility: hidden;" id="check11"></div>
                            </a>
                            
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Placement Cell</h4>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--/.Third column-->
            </div>
            <!--/.Second row-->
            
            
            <div class="row">
                
                <div class="col-lg-3 wow fadeIn" data-wow-delay="0.2s">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-light" id="overlay7">
                            <img src="imagesdomain/chemical.png" class="img-fluid" style="margin: auto;width: 200px; height: 200px;" alt="">
                            <a onclick="test1('check7','overlay7','cover7','Chemical')">
                                <div class="mask" id="cover7"><input type="checkbox" style="visibility: hidden;" id="check7"></div>
                            </a>
                            
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Chemical</h4>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                
                <!--First column-->
                <div class="col-lg-3 wow fadeIn" data-wow-delay="0.4s">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-light" id="overlay8">
                            <img src="imagesdomain/civil.png" class="img-fluid" style="margin: auto;width: 200px; height: 200px;" alt="">
                            <a onclick="test1('check8','overlay8','cover8','Civil')">
                                <div class="mask" id="cover8"><input type="checkbox" style="visibility: hidden;" id="check8"></div>
                            </a>
                            
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Civil</h4>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--/.First column-->

                <!--Second column-->
                <div class="col-lg-3 wow fadeIn" data-wow-delay="0.6s">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-light" id="overlay9">
                            <img src="imagesdomain/library2.jpg" class="img-fluid" style="margin: auto;width: 200px; height: 200px;" alt="">
                            <a onclick="test1('check9','overlay9','cover9','Library')">
                                <div class="mask" id="cover9"><input type="checkbox" style="visibility: hidden;" id="check9"></div>
                            </a>
                            
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Library</h4>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--Second column-->

                <!--Third column-->
                <div class="col-lg-3 wow fadeIn" data-wow-delay="0.8s">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-light" id="overlay10">
                            <img src="imagesdomain/sports2.png" class="img-fluid" style="margin: auto;width: 200px; height: 200px;" alt="">
                            <a onclick="test1('check10','overlay10','cover10','Sports')">
                                <div class="mask" id="cover10"><input type="checkbox" style="visibility: hidden;" id="check10"></div>
                            </a>
                            
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Sports</h4>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--/.Third column-->
            </div>
            
            <div class="row">
                
                <div class="col-lg-3 wow fadeIn" data-wow-delay="0.2s">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-light" id="overlay13">
                            <img src="imagesdomain/admission.png" class="img-fluid" style="margin: auto;width: 200px; height: 200px;" alt="">
                            <a onclick="test1('check13','overlay13','cover13','Admission Cell')">
                                <div class="mask" id="cover13"><input type="checkbox" style="visibility: hidden;" id="check13"></div>
                            </a>
                            
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Admission Cell</h4>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                
                <!--First column-->
                <div class="col-lg-3 wow fadeIn" data-wow-delay="0.4s">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-light" id="overlay14">
                            <img src="imagesdomain/scholarship2.png" class="img-fluid" style="margin: auto;width: 200px; height: 200px;" alt="">
                            <a onclick="test1('check14','overlay14','cover14','Scholarship')">
                                <div class="mask" id="cover14"><input type="checkbox" style="visibility: hidden;" id="check14"></div>
                            </a>
                            
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Scholarship</h4>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--/.First column-->

                <!--Second column-->
                <div class="col-lg-3 wow fadeIn" data-wow-delay="0.6s">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-light" id="overlay15">
                            <img src="imagesdomain/moonstone.png" class="img-fluid" style="margin: auto;width: 200px; height: 200px;" alt="">
                            <a onclick="test1('check15','overlay15','cover15','Moonstone')">
                                <div class="mask" id="cover15"><input type="checkbox" style="visibility: hidden;" id="check15"></div>
                            </a>
                            
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Moonstone</h4>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--Second column-->

                <!--Third column-->
                <div class="col-lg-3 wow fadeIn" data-wow-delay="0.8s">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-light" id="overlay16">
                            <img src="imagesdomain/hostel-512.png" class="img-fluid" style="margin: auto;width: 200px; height: 200px;" alt="">
                            <a onclick="test1('check16','overlay16','cover16','Hostel')">
                                <div class="mask" id="cover16"><input type="checkbox" style="visibility: hidden;" id="check16"></div>
                            </a>
                            
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Hostel</h4>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--/.Third column-->
            </div>
            
            <div class="row">
                
                
                
                <!--First column-->
                <div class="col-lg-3 wow fadeIn" data-wow-delay="0.2s">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-light" id="overlay17">
                            <img src="imagesdomain/transportation2.jpg" class="img-fluid" style="margin: auto;width: 200px; height: 200px;" alt="">
                            <a onclick="test1('check17','overlay17','cover17','Transportation')">
                                <div class="mask" id="cover17"><input type="checkbox" style="visibility: hidden;" id="check17"></div>
                            </a>
                            
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Transportation</h4>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--/.First column-->

                <!--Second column-->
                <div class="col-lg-3 wow fadeIn" data-wow-delay="0.4s">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-light" id="overlay18">
                            <img src="imagesdomain/music.jpg" class="img-fluid" style="margin: auto;width: 200px; height: 200px;" alt="">
                            <a onclick="test1('check18','overlay18','cover18','Music Club')">
                                <div class="mask" id="cover18"><input type="checkbox" style="visibility: hidden;" id="check18"></div>
                            </a>
                            
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Music Club</h4>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--Second column-->

                <!--Third column-->
                <div class="col-lg-3 wow fadeIn" data-wow-delay="0.6s">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-light" id="overlay19">
                            <img src="imagesdomain/dance.png" class="img-fluid" style="margin: auto;width: 200px; height: 200px;" alt="">
                            <a onclick="test1('check19','overlay19','cover19','Dance Club')">
                                <div class="mask" id="cover19"><input type="checkbox" style="visibility: hidden;" id="check19"></div>
                            </a>
                            
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Dance Club</h4>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--First column-->
                <div class="col-lg-3 wow fadeIn" data-wow-delay="0.8s">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-light" id="overlay20">
                            <img src="imagesdomain/tlc.jpg" class="img-fluid" style="margin: auto;width: 200px; height: 200px;" alt="">
                            <a onclick="test1('check20','overlay20','cover20','The Literary Club')">
                                <div class="mask" id="cover20"><input type="checkbox" style="visibility: hidden;" id="check20"></div>
                            </a>
                            
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">The Literary Club</h4>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--/.Third column-->
            </div>
            
            <div class="row">
                
                
                <!--/.First column-->

                <!--Second column-->
                <div class="col-lg-3 wow fadeIn" data-wow-delay="0.2s">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-light" id="overlay21">
                            <img src="imagesdomain/stic.jpg" class="img-fluid" style="margin: auto;width: 200px; height: 200px;" alt="">
                            <a onclick="test1('check21','overlay21','cover21','STIC')">
                                <div class="mask" id="cover21"><input type="checkbox" style="visibility: hidden;" id="check21"></div>
                            </a>
                            
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">STIC</h4>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--Second column-->

                <!--Third column-->
                <div class="col-lg-3 wow fadeIn" data-wow-delay="0.4s">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-light" id="overlay22">
                            <img src="imagesdomain/ecell.jpg" class="img-fluid" style="margin: auto;width: 200px; height: 200px;" alt="">
                            <a onclick="test1('check22','overlay22','cover22','E-Cell')">
                                <div class="mask" id="cover22"><input type="checkbox" style="visibility: hidden;" id="check22"></div>
                            </a>
                            
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">E-Cell</h4>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                
                <!--First column-->
                <div class="col-lg-3 wow fadeIn" data-wow-delay="0.6s">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-light" id="overlay23">
                            <img src="imagesdomain/canteen2.jpg" class="img-fluid" style="margin: auto;width: 200px; height: 200px;" alt="">
                            <a onclick="test1('check23','overlay23','cover23','Canteen')">
                                <div class="mask" id="cover23"><input type="checkbox" style="visibility: hidden;" id="check23"></div>
                            </a>
                            
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Canteen</h4>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--/.First column-->

                <!--Second column-->
                <div class="col-lg-3 wow fadeIn" data-wow-delay="0.8s">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-light" id="overlay24">
                            <img src="imagesdomain/logo.bmp" class="img-fluid" style="margin: auto;width: 200px; height: 200px;" alt="">
                            <a onclick="test1('check24','overlay24','cover24','Korero')">
                                <div class="mask" id="cover24"><input type="checkbox" style="visibility: hidden;" id="check24"></div>
                            </a>
                            
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Korero</h4>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--/.Third column-->
            </div>
            
            <div class="row">
                
                
                <!--Second column-->
                <div class="col-lg-4 wow fadeIn" data-wow-delay="0.2s"></div>
                <!--Third column-->
                
                <div class="col-lg-4 wow fadeIn" data-wow-delay="0.2s">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-light" id="overlay25">
                            <img src="imagesdomain/others.png" class="img-fluid" style="margin: auto;width: 200px; height: 200px;" alt="">
                            <a onclick="test1('check25','overlay25','cover25','Other')">
                                <div class="mask" id="cover25"><input type="checkbox" style="visibility: hidden;" id="check25"></div>
                            </a>
                            
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Other</h4>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--/.Third column-->
                <div class="col-lg-4 wow fadeIn" data-wow-delay="0.4s"></div>
                
            </div>
            
            <hr>
            
            
            
            <div class="flex-center ">
                <button class="btn btn-primary" onclick="fetchDomains()"><a style="color: #FFFFFF;">Submit!</a>  </button>
            </div>
            <br>
            <hr>
            
        </div>
        <!--/.Main layout-->
    </main>

    <!--Footer-->
   <footer class="page-footer center-on-small-only mt-0">

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
    </script>
    
    <script>
        function fetchDomains(){
            var domains=test();
            window.location.href="SelectDomain?domains="+domains+"&uid=<%= uid %>";
        }
    </script>
    
</body>

</html>