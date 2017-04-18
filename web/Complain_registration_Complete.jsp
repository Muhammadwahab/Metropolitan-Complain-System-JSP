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
	<title>Registration Complete</title>
	<script src="js/jquery.js"></script
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/styletwoHome.css">
		<link href="css/simple-sidebar.css" rel="stylesheet">
		
		<!-- Latest compiled and minified JavaScript -->
		<script src="js/bootstrap.min.js"></script>
		<script src="js/custom.js"></script>
		
		
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
        <li class="navbar-text">Metropolitan Complain Center<li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
          <li><p class="navbar-text"><%out.print(session.getAttribute("email"));%></p></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b>Account</b> <span class="caret"></span></a>
			<ul id="login-dp" class="dropdown-menu">
				<li>
					 <div class="row">
							<div class="col-md-12">
								Login via
								<div class="social-buttons">
									<a href="#" class="btn btn-fb"><i class="fa fa-facebook"></i> Facebook</a>
									<a href="#" class="btn btn-tw"><i class="fa fa-twitter"></i> Twitter</a>
								</div>
                                or
								 <form class="form" role="form" method="post" action="login" accept-charset="UTF-8" id="login-nav">
										<div class="form-group">
											
										</div>
										<div class="form-group">
										<form class="form" role="form" method="post" action="logout.jsp" accept-charset="UTF-8" id="login-nav">

										</div>
										<div class="checkbox">
											 <label>
											 <input type="checkbox"> keep me logged-in
											 </label>
										</div>
								 </form>
							</div>
							<div class="bottom text-center">
								New here ? <a href="#"><b>Join Us</b></a>
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
                    <a href="#">Events</a>
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
                    <div class="col-lg-12"><br> <br> <br> <br>
                        <center><h1>Complain Registration Complete</h1>
                        <p>Now for launching a complain Please Click Success Button</p>
                        <a href="Complain.jsp" class="btn btn-default" id="menu-toggle">Success</a></center>
                    </div>
                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>
	
	</body>
	
</html>
