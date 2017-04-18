<%-- 
    Document   : view_Complain_And_images
    Created on : 10-Apr-2016, 01:07:54
    Author     : Engr.Uzma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Dashboard with Off-canvas Sidebar</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="css/bootstrap.min.css" rel="stylesheet">
                 <script src="js/script.js"></script>
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="css/admin.css" rel="stylesheet">
	</head>
	<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Metropolitan Complain Center</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">LOG-OUT</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Enter Tracking Code">
          </form>
        </div>
      </div>
</nav>

<div class="container-fluid">
      
      <div class="row row-offcanvas row-offcanvas-left">
        
         <div class="col-sm-3 col-md-2 sidebar-offcanvas" id="sidebar" role="navigation">
           
            <ul class="nav nav-sidebar">
             
            </ul>
            <ul class="nav nav-sidebar">
             
            </ul>
            <ul class="nav nav-sidebar">
            
            </ul>
          
        </div><!--/span-->
        
        <div class="col-sm-9 col-md-10 main">          
          <!--toggle sidebar button-->
           <p class="visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas"><i class="glyphicon glyphicon-chevron-left"></i></button>
          </p>
          <br>
		  <h1 class="page-header">
            Metropolitan Complain Center
          </h1>

          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder text-center">
              <img src="image\-text.png" class="center-block img-responsive img-circle" alt="Generic placeholder thumbnail">
              <div style="margin-top: -129px;">
                   <a href="#"><h4>Registered <br />Member</h4></a>
              </div>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder text-center">
              <img src="image\green.png" class="center-block img-responsive img-circle" alt="Generic placeholder thumbnail">
              <div style="margin-top: -129px;">
                   <a href="#"><h4>Registered <br />Member</h4></a>
              </div>
             
            </div>
            <div class="col-xs-6 col-sm-3 placeholder text-center">
              <img src="image\-text.png" class="center-block img-responsive img-circle" alt="Generic placeholder thumbnail">
              <div style="margin-top: -129px;">
                   <a href="#"><h4>Registered <br />Member</h4></a>
              </div>
             
            </div>
            <div class="col-xs-6 col-sm-3 placeholder text-center">
              <img src="image\green.png" class="center-block img-responsive img-circle" alt="Generic placeholder thumbnail">
             <div style="margin-top: -129px;">
                  <a href="#"><h4>Registered <br />Member</h4></a>
              </div>
             
            </div>
          </div>
          <br />
          <br />
          <br />
          <br />
          <hr>

         <center><h2 class="sub-header">Complain</h2></center>
         <div class="table-responsive" id="img">
            <table class="table table-striped">
              <thead>
                <tr>
			
			
			<th>
				COMPLAIN
			</th>
                        <th>
				Images
			</th>
                        <th>
				Videos
			</th>
                        <th>
				Files
			</th>
			
		</tr>
              </thead>
              <tbody>
                <tr>
                  
                    <td><%String complain=request.getParameter("complain");
                    String name=System.getProperty("user.home");
                     out.print(complain);%></td>
                    <td>
                     <!--<a href="Image.jsp?id=<%out.print(request.getParameter("code"));%>" class="btn btn-success" onclick="retieveImage()">Click to see images    
                               <a/> -->
                        <button  id="getImageID"class="btn btn-success" value="<%out.print(request.getParameter("code"));%>" onclick="RetrieveImage('Snaps')">Click Here To see Image</button>
			
                    </td>
                        <td>
                           <button  id="getImageID"class="btn btn-success" value="<%out.print(request.getParameter("code"));%>" onclick="RetrieveImage('Videos')">Click Here To see Video</button>
			</td>
                        <td>
                        <!--    <button  class="btn btn-success" value="<%out.print(request.getParameter("code"));%>" onclick="RetrieveImage('Videos')">Click Here To see Dacument</button> -->
			<a href="retrieveImage?value=<%out.print(request.getParameter("code"));%>&type=Dacuments" target="_blank"class="btn btn-success" onclick="RetrieveImage('Videos')">Click Here To see Dacument    
                               <a/> 
                        </td>
                </tr>
                
              </tbody>
            </table>
                       
          </div>

          
      </div><!--/row-->
	</div>
</div><!--/.container-->

<footer>
  <p class="pull-right">©2016 Company</p>
</footer>
        
	<!-- script references -->
		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/scripts.js"></script>
	</body>
</html>