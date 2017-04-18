<%-- 
    Document   : Complain
    Created on : 24-Mar-2016, 19:10:56
    Author     : Engr.Uzma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.

    if(session.getAttribute("email")==null)
    {
        response.sendRedirect("Login.jsp");
    
    }
        


%>
<!DOCTYPE html>
<html>
	<head>
	<title>MCC Complain</title>
         <style>
                 .thumb {
    height: 39px;
    border: 1px solid #000;
    margin: 7px 5px 0 0;
                        }
                         .uploadImage {
   height: 300px;
    border: 1px solid #000;
    margin: 7px 5px 0 0;
                        }
                
            </style>
	<script src="js/jquery.js"></script
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/styletwoHome.css">
		<link href="css/simple-sidebar.css" rel="stylesheet">
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
							<div class="bottom text-c">
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
           <div class="container">
    <div class="row">
        <br>
        <br>
	<h1>Filled Complain</h1>
	<br>
        <form role="form" method="POST" action="ComplainInsert" enctype="multipart/form-data">
            <div class="col-lg-6">
                 <div  class="well well-sm"><strong id="txt" ><span id="page" class="glyphicon glyphicon-asterisk"></span>Required Field</strong></div>
                <div class="form-group">
                    <label for="InputEmail"><strong>NIC</strong></label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="nic" name="nic" placeholder="Enter NIC" required>
						<span class="input-group-btn">
					<button class="btn btn-primary btn-lg text-center btn-md" width="78px" type="button" onclick="Ajaxvalidate(4,'On Complain')" style="padding: 0%;border-style: hidden;border-radius:0px;height: 35px"><span>Check</span>
                                             
						<i class="icon-ok" style="font-size:30px; vertical-align-align: top;"></i></button>
				</span>
                       
                        <span class="input-group-addon"></span> <span>            <img src="image\Front.png" class="img-responsive" alt="Metro Politan Complain Center" style="position: absolute; top: 200px;left: -20px"/>
</span>
                    </div>
                </div>
                 <br>
                 
                 
                  <div class="btn btn-default btn-file btn-danger">
                      Upload Image <input type="file" id="files" name="files[]"/>
                         
                        </div>
                 <div class="btn btn-default btn-file btn-danger">
                      Upload Video <input type="file" id="files" name="files[]"/>
                         
                        </div>
                 <div class="btn btn-default btn-file btn-danger">
                      Upload Dacument <input type="file" id="files" name="files[]"/>
                         
                        </div>
                  
                 <br>
                 <br>
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
          span.innerHTML = ['<img class="uploadImage img-rounded" style="position:absolute;top: -87px;left: 573px;" src="', e.target.result,
                            '" title="', escape(theFile.name), '"/>'].join('');
                         document.getElementById('list').innerHTML='';
          document.getElementById('list').insertBefore(span, null);
        };
      })(f);

      // Read in the image file as a data URL.
      reader.readAsDataURL(f);
    }
  }

  document.getElementById('files').addEventListener('change', handleFileSelect, false);
</script>

                  
                <div class="form-group">
                     <output class="img-rounded" id="list"></output>
                    <label for="InputMessage"> Complain</label>
                    <div class="input-group">
                        <textarea name="textarea" id="InputMessage" class=" form-control" rows="5" required></textarea>
                        <span class="input-group-addon"></span>
                    </div>
                </div>
<input type="submit" disabled="true" name="submit" id="submit" value="Submit" class="btn btn-info pull-right">
            </div>
        </form>

    </div>
</div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>
	
	</body>
	
</html>