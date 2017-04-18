<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.
    if(session.getAttribute("email")!=null)
    {
        response.sendRedirect("HOME.jsp");
    
    }
    else if(session.getAttribute("check")==null)
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
	<title>MCC Login</title>
	<script src="js/jquery.js"></script
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/style.css">
		
		<!-- Latest compiled and minified JavaScript -->
		<script src="js/bootstrap.min.js"></script>
		<!--<script src="js/custom.js"></script> -->
                <script src="js/script.js"></script>
		
		
	</head>
	<body>
	
	
	<div class="container-fluid"> 
            <div class="input-group col-xs-4 search" style="margin-left: 530px">
			<input type="text" class="form-control col-sm-10" maxlength="64" id="admin"placeholder="Administration Used Only" style="margin-top:50px">
				<span class="input-group-btn">
                                    <button class="btn btn-primary btn-lg" width="78px" type="button" name="admin" onclick="admin()"style="margin-top:50px;margin-right:100px;padding-bottom:8px;">Go!</button>
				</span>
                        
	</div>
            <img src="image\Front.png" class="img-responsive" alt="Metro Politan Complain Center" style="position: absolute; top: 200px;left: -20px"/>
           
</div> 
	
        <div class="container-reversed">
  
  <div class="row" id="pwd-container">
    <div class="col-md-4"></div>
    
    <div class="col-md-4">
      <section class="login-form">
          <form method="post"role="login">
          <img src="image\real.png" class="img-responsive" alt="Metro Politan Complain Center" />
          <input type="email" id="email" name="email" placeholder="Abdul@gmail.com" required="" class="form-control input-lg"/>
          
          <input type="password" class="form-control input-lg" id="password" placeholder="Password" required />
          
          
          <div id="txt"class="pwstrength_viewport_progress text-danger"></div>
          
          
          <button type="button"  onclick="Ajaxvalidate(2)" name="go" class="btn btn-lg btn-primary btn-block">Done</button>
          <div>
            <a href="Registration.jsp">Create account</a> or <a href="resetPassword.jsp">reset password</a>
          </div>
          
        </form>
        
        <div class="form-links">
          <a href="#">www.website.com</a>
        </div>
      </section>  
      </div>
      
      <div class="col-md-4"></div>
      

  </div>
  
  <p>
    
    <br>
    
  </p>     
  
  
</div>
</body>
	
</html>
