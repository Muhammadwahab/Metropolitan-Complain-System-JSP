<%-- 
    Document   : Union_Council
    Created on : 10-Apr-2016, 04:07:47
    Author     : Engr.Uzma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- 
    Document   : Administration_Access_Control
    Created on : 03-Apr-2016, 04:47:53
    Author     : Engr.Uzma
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%!Connection con;
java.sql.Statement statement;
ResultSet rs;String uc;%>

<%!
public Connection connection() throws Exception
{
 
            
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/complaincenter","root","");
return con;
}%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Dashboard with Off-canvas Sidebar</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="css/bootstrap.min.css" rel="stylesheet">
                <script src="js/bootstrap.min.js"></script>
		
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
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Help</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
</nav>

<div class="container-fluid">
      
      <div class="row row-offcanvas row-offcanvas-left">
        
         <div class="col-sm-3 col-md-2 sidebar-offcanvas" id="sidebar" role="navigation">
           
            <ul class="nav nav-sidebar">
              <li class="active"><a href="#">Overview</a></li>
              <li><a href="http://bootstrapzero.com" target="_ext">Themes</a></li>
              <li><a href="http://bootstrap.theme.cards" target="_ext">Analytics</a></li>
              <li><a href="https://wrapbootstrap.com?ref=skelly" target="_ext">Export</a></li>
            </ul>
            <ul class="nav nav-sidebar">
              <li><a href="">Nav item</a></li>
              <li><a href="">Nav item again</a></li>
              <li><a href="">One more nav</a></li>
              <li><a href="">Another nav item</a></li>
              <li><a href="">More navigation</a></li>
            </ul>
            <ul class="nav nav-sidebar">
              <li><a href="">Nav item again</a></li>
              <li><a href="">One more nav</a></li>
              <li><a href="">Another nav item</a></li>
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
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder text-center">
              <img src="image\green.png" class="center-block img-responsive img-circle" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder text-center">
              <img src="image\-text.png" class="center-block img-responsive img-circle" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder text-center">
              <img src="image\green.png" class="center-block img-responsive img-circle" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
          </div>
          
          <hr>
          
            
          
            
          
          <div class="table-responsive">
              <center><h2 class="sub-header"></h2></center>
            <table class="table table-striped table table-hover">
              
                <tr>
			<th>
				
                                <img src="retrieveImage?value=<%out.print(request.getParameter("id"));%>" alt="imageto be load" width="200" height="200">
			</th>
			
			
			
		
			
		</tr>
             
                
              
             
                       
                        </tr>
                       
                       
                
             
            </table>
          </div>

          
      </div><!--/row-->
	</div>
</div><!--/.container-->

<footer>
  <p class="pull-right">©2016 Metropolitan Complain Center</p>
</footer>
        
	<!-- script references -->
		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/scripts.js"></script>
	</body>
</html>

