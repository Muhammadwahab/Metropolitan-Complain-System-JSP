<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.
int value=session.getMaxInactiveInterval();

    if(session.getAttribute("email")!=null)
    {
        response.sendRedirect("HOME.jsp");
    
    }
    
    else if(session.getAttribute("resetEmail")==null)
    {
        
     response.sendRedirect("Login.jsp");
     session.setAttribute("check",true);
    
    }
    else
    {
         session.setAttribute("check",false);
    
    
    }
        


%>

<!DOCTYPE html>
<html>
	<head>
	<title>Bootstrap</title>
	<script src="js/jquery.js"></script
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/style.css">
		
		<!-- Latest compiled and minified JavaScript -->
		<script src="js/bootstrap.min.js"></script>
		
                <!-- <script src="js/custom.js"></script> -->
                <script src="js/script.js"></script>
		
		
	</head>
	<body>
	
	
	<div class="container-fluid"> 
		<div class="input-group col-xs-4 search">
                        
	</div>
            <img src="image\Front.png" class="img-responsive" alt="Metro Politan Complain Center" style="position: absolute; top: 200px;left: -20px"/>
           
</div> 
	
        <div class="container-reversed">
  
  <div class="row" id="pwd-container">
    <div class="col-md-4"></div>
    
    <div class="col-md-4" style="margin-top: 100px">
      <section class="login-form">
          <form method="post"role="login" action="updatePassword">
          <img src="image\real.png" class="img-responsive" alt="Metro Politan Complain Center" />  
          <div style="margin-top: 0px"><p id="txt" class="lead">Enter New Password<br> <b>Alert</b><i>This Page expire in 10 minutes Enter New Password within time</i></p></div>
          <input type="password" class="form-control input-lg" id="reset" name="newPass" required=""placeholder="Enter new password" required />
          
          <button type="submit" name="go" class="btn btn-lg btn-primary btn-block">Done</button>
          
        </form>
        
        <div class="form-links">
          <a href="#">www.website.com</a>
        </div>
      </section>  
      </div>
      
      <div class="col-md-4"></div>
      

  </div>
  
  <p>
    <a href="http://validator.w3.org/check?uri=http%3A%2F%2Fbootsnipp.com%2Fiframe%2FW00op" target="_blank"><small>HTML</small><sup>5</sup></a>
    <br>
    <br>
    
  </p>     
  
  
</div>
</body>
	
</html>
