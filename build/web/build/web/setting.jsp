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
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%!Connection con;
java.sql.Statement statement;
ResultSet rs;String uc;
 String firstName,middlename,lastname,diplayname,password,phonenumber,email;%>

<%!
public Connection connection() throws Exception
{
 
            
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/complaincenter","root","");
return con;
}%>
      <% try {
                            con=connection();
            statement=con.createStatement();
           
            String insert="SELECT *from login_registration where email='"+session.getAttribute("email")+"'";
                    

            rs=statement.executeQuery(insert);%>
             
             <%while(rs.next())
             {
               
                 firstName=rs.getString("firstname");
                  
                  middlename=rs.getString("middlename");
                  lastname=rs.getString("lastname");
                  diplayname=rs.getString("displayname");
                   password=rs.getString("password");
                  phonenumber=rs.getString("PhoneNumber");
                  email=rs.getString("email");
                   
                
                  
             }
             }catch(Exception e)
                        {
                            out.print(e);
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
                  
                  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
                  <script>
                         
                  </script>
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
                       
                    </div>
                </div>
            </div>
            
            <div class="container-fluid" style="margin-top:7px">
<div class="col-md-10 col-md-offset-1">
    <div class="panel panel-default">
  <div class="panel-heading"><h3 class="panel-title"><strong>Change Setting</strong></h3>
     
  </div>
  
  <div class="panel-body" style="margin-top:-10px">
              
      <div style="height: 100px;width: 236px">
            <img src="image\real.png" class="img-responsive" alt="Metro Politan Complain Center" />
            <div style="height: 152px;border: 1px hidden #001; width: 236px;background-color: #ffffcc;margin-left: 673px;margin-top: -87px;" id="image">
                <img style="height: 152px;width: 236px" src="view.jsp?id=<%out.print(session.getAttribute("email"));%>" alt="Image">
                </div>
            
      </div>

       <center> <output class="img-rounded" id="list"></output></center>
     
          <center> <h3 id="txt"class="text-danger"><h3></center>
   <div class="alert">
              
            </div>
            <div class="row" style="margin-top:-30px">
    			<div class="col-xs-12 col-sm-4 col-md-4">
					<div class="form-group">
                                            <input type="text"   name="first_name" value="<%out.print(firstName);%>"id="first_name" class="form-control" placeholder="First Name" tabindex="1" onclick="" >
					</div>
				</div>
                                        <div class="col-xs-12 col-sm-2 col-md-2">
    				<div class="form-group">
                                    <input type="button" name="" id="" class="form-control btn-primary " value="Update F.Name" tabindex="8" onclick="updateSetting('firstname')">
					</div>
				</div>
                <div class="col-xs-12 col-sm-4 col-md-4">
    				<div class="form-group">
                        <input type="text" name="middle_name" id="middle_name"  class="form-control" placeholder="Middle Name" tabindex="1" value="<%out.print(middlename);%>">
					</div>
				</div>
                                         <div class="col-xs-12 col-sm-2 col-md-2">
    				<div class="form-group">
                                                                   <input type="button" name="" id="" class="form-control btn-primary " value="Update M.Name" tabindex="8" onclick="updateSetting('middlename')">
					</div>
				</div>
				
               
                
			</div>
                                           <div class="row" style="margin-top:-30px">
    			<div class="col-xs-12 col-sm-4 col-md-4">
					<div class="form-group">
                                            <input type="text"   name="last-name" value="<%out.print(lastname);%>"id="lastname" class="form-control" placeholder="Last Name" tabindex="1" >
					</div>
				</div>
                                        <div class="col-xs-12 col-sm-2 col-md-2">
    				<div class="form-group">
                                    <input type="button" name="" id="" class="form-control btn-primary "  value="Update L.Name" tabindex="8" onclick="updateSetting('lastname')">
					</div>
				</div>
                <div class="col-xs-12 col-sm-4 col-md-4">
    				<div class="form-group">
                        <input type="text" name="phone" id="phonenumber"  class="form-control" placeholder="Phone Number" tabindex="1" value="<%out.print(phonenumber);%>">
					</div>
				</div>
                                         <div class="col-xs-12 col-sm-2 col-md-2">
    				<div class="form-group">
                                                                   <input type="button" name="" id="" class="form-control btn-primary " value="Update Number" tabindex="8" onclick="updateSetting('phonenumber')">
					</div>
				</div>
				
               
                
			</div>
                                       
			<div class="form-group col-xs-12 col-sm-10">
                            <input type="text" name="display_name" disabled="true" value="<%out.print(diplayname);%>" id="display_name" class="form-control " style="margin-left: -15px;" placeholder="Display Name" tabindex="3" oninput="buttonEnableDisable()">
			</div>
                        <div class="form-group col-xs-12 col-md-2">
                            <input type="button" name="displayName" disabled="true"id="ajaxName" class="form-control btn-primary " value="Check" tabindex="8" onclick="Ajaxvalidate(1)">
			</div>
			<div class="form-group col-xs-12 col-sm-10">
                            <input type="email" name="email" id="email" class="form-control " oninput="buttonEnableDisable()" style="margin-left: -15px;" disabled="true"placeholder="Email Address" tabindex="8" value="<%out.print(email);%>">
			</div>
                           <div class="form-group col-xs-12 col-md-2">
                               <input type="button" name="" id="" class="form-control btn-primary " disabled="true" value="Check" tabindex="8">
			</div>
   
   
			<div class="row">
				<div class="col-xs-12 col-md-6">
					<div class="form-group">
						<input type="password" name="password" id="password" value="<%out.print(password);%>"class="form-control " placeholder="Password" tabindex="5">
					</div>
				</div>
				<div class="col-xs-12 col-md-6">
					<div class="form-group">
						<input type="password"name="password_confirmation" id="password_confirmation" class="form-control " value="<%out.print(password);%>"placeholder="Confirm Password" tabindex="6">
					</div>
				</div>
			</div>
                                        <div class="row">
				<div class="col-xs-12 col-md-3">
					<div class="form-group">
						                                                                   <input type="button" name="" id="" class="form-control btn-primary "  value="Update Password" tabindex="8" onclick="updateSetting('password')">
					</div>
				</div>
				
			</div>
                                        <form id="update" method="post" enctype="multipart/form-data" action="update" return="false">
                                    
                                    <div class="input-group">
                                      <div class="" style="margin-top: 0px;">
                                        <label>
                                            <span class="btn btn-default btn-file btn-danger">
                                               
                                               Upload Image <input type="file" id="picture" name="files[]" />
                                            </span>
                                      



<script>
  function handleFileSelect(evt) {
    var files = evt.target.files; // FileList object

    // Loop through the FileList and render image files as thumbnails.
    for (var i = 0, f; f = files[i]; i++) {

      // Only process image files.
      if (!f.type.match('image.*')) {
        continue;
      }

      var reader = new FileReader();

      // Closure to capture the file information.
      reader.onload = (function(theFile) {
        return function(e) {
          // Render thumbnail.
          var span = document.createElement('span');
          span.innerHTML = ['<img style="height: 152px;width: 236px" src="', e.target.result,
                            '" title="', escape(theFile.name), '"/>'].join('');
                         document.getElementById('image').innerHTML='';
          document.getElementById('image').insertBefore(span, null);
        };
      })(f);

      // Read in the image file as a data URL.
      reader.readAsDataURL(f);
    }
  }

  document.getElementById('picture').addEventListener('change', handleFileSelect, false);
</script>
                                               
                                        </label>
                                        
                                      </div>
                                    </div>
                                    
                                        <button type="submit" name="done" id="done" class="btn btn-success">Done</button>
  <span></span>
  </form>

  
  <hr style="margin-top:10px;margin-bottom:10px;" >
  
  <div class="form-group">
                                    
                                        <div style="font-size:85%">
                                            Don't have an account! 
                                       
                                            Sign Up Here
                                        </a>
                                        </div>
                                    
                                </div> 
  </div>
</div>
</div>
</div>
           
        </div>
       
            <div>
        <!-- /#page-content-wrapper -->

    </div>
	
	</body>
	
</html>
