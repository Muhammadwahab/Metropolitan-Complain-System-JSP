<%-- 
    Document   : HOME
    Created on : 24-Mar-2016, 19:06:27
    Author     : Engr.Uzma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.

    if(session.getAttribute("email")==null)
    {
        response.sendRedirect("Login.jsp");
    
    }
        


%>
<html>
	<head>
            <style>
                 .thumb {
    height: 39px;
    border: 1px solid #000;
    margin: 7px 5px 0 0;
                        }
                
            </style>
	<title>Bootstrap</title>
	<script src="js/jquery.js"></script
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		
		<link href="css/simple-sidebar.css" rel="stylesheet">
                <link rel="stylesheet" href="css/styletwoHome.css">
                <link rel="stylesheet" href="css/style3.css">
                <link rel="stylesheet" href="css/style4.css">
		
		<!-- Latest compiled and minified JavaScript -->
		<script src="js/bootstrap.min.js"></script>
		<script src="js/custom.js"></script>
                <script src="js/script.js"></script>
		
		
	</head>
	<body>
	
	<nav class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation"style="background-color:#001;">
  <div class="container-inverse">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <h3>Welcome</h3>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="navbar-text letter " id="pos">Metropolitan Complain Center<li>
        
      </ul>
     
      <ul class="nav navbar-nav navbar-right">
          <li><img class="thumb img-circle" src="view.jsp?id=<%out.print(session.getAttribute("email"));%>" alt="Image"></li>
          <li><p class="navbar-text"><%out.print(session.getAttribute("email"));%></p></li>
          <li><p class="navbar-text"><a href="HOME.jsp">Home</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b>Account</b> <span class="caret"></span></a>
			<ul id="login-dp" class="dropdown-menu">
				<li>
					 <div class="row">
							<div class="col-md-12">
								
								 <form class="form" role="form" method="post" action="logout.jsp" accept-charset="UTF-8" id="login-nav">
										
										
										<div class="form-group">
                                                                                    <a href="setting.jsp" class="btn btn-warning btn-block">Setting</a>
											 <button type="submit" class="btn btn-primary btn-block">Logout</button>
										</div>
										
								 </form>
							</div>
							<div class="bottom text-center">
								
							</div>
					 </div>
				</li>
			</ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<div id="wrapper" style="margin-top:-10px;">

        <!-- Sidebar -->
        <div id="sidebar-wrapper" class="container-fluid">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="HOME.jsp">
                       Home
                    </a>
                </li>
                <li>
                    <a href="ComplainRegistration.jsp">Registration</a>
                </li>
                <li>
                    <a href="Complain.jsp">Complain</a>
                </li>
                <li>
                    <a href="#">Visitors</a>
                </li>
                
                <li>
                    <a href="#">About</a>
                </li>
                <li>
                    <a href="#">Services</a>
                </li>
                <li>
                    <a href="#">Contact</a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 id="main"><span>O</span><span class="main-text-other">nline Complain Center</span><small><abbr title="Metropolitan Complain Center">MCC<abbr></small></h1>
                        <p class="para">Wellcome to Online complain center.Provide easy way for Registered voice against any unconvinsing think happened in the society.By using any Medium like by making video ,record Audio ,Taking Snaps or upload Dacuments to raise his Voice</p>
                       
                    </div>
                </div>
            </div>
            <div class="tracker-code">
                <div style="border: 2px solid #eef9fa;border-style: hidden;border-radius:3px ;background-color: #845eec;padding-left: 0px;margin-left: 43px;width: 718px;margin-top: 20px;height: 47px"><h2 style="padding-left: 41px;font-family: cursive;padding-top: 7px;">Enter Tracking Code to Track Your Complain</h2></div>
                <div> <input style="width: 347px;margin: 50px;margin-left: 106px"class="form-control" id="code" type="text" placeholder="Enter Tracking Code" onfocus="tracking()">
 
                   
                </div>
                 <span> <button style="width: 80px;margin-left: 495px;margin-top: -153px;"type="button"  onclick="track()" name="go" class="btn btn-primary">Track</button></span>
            </div>
        </div>
        <div style="height: 200px;width: 823px;border: 1px hidden beige;;padding-left: -38px;margin-left: 110px;" id="Track-output">
            </div>
            <div>
        <!-- /#page-content-wrapper -->

    </div>
	
	</body>
	
</html>
