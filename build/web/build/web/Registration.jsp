<%-- 
    Document   : Registration
    Created on : 24-Mar-2016, 21:16:01
    Author     : Engr.Uzma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
		<script src="js/custom.js"></script>
                <script src="js/script.js"></script>
                      <style>
  .thumb {
    height: 75px;
    border: 1px solid #000;
    margin: 10px 5px 0 0;
  }
</style>

		
		
	</head>
	<body>
	
	<div class="container-fluid" style="margin-top:100px">
<div class="col-md-10 col-md-offset-1">
    <div class="panel panel-default">
  <div class="panel-heading"><h3 class="panel-title"><strong>Create Account </strong></h3>
     
  </div>
  
  <div class="panel-body" style="margin-top:-10px">
              <div style="height: 100px;width: 236px">
            <img src="image\real.png" class="img-responsive" alt="Metro Politan Complain Center" />
            <div style="height: 152px;border: 1px hidden #001; width: 236px;background-color: #ffffcc;margin-left: 673px;margin-top: -87px;" id="image">
               <!-- <img style="height: 152px;width: 236px" src="view.jsp?id=<%out.print(session.getAttribute("email"));%>" alt="Image">  -->
                </div>
            
      </div>

       <center> <output class="img-rounded" id="list"></output></center>
       <form role="form" name="register" method="post" enctype="multipart/form-data" onsubmit="return ValidateRegistration()"action="im">
          <center> <h3 id="txt"class="text-danger"><h3></center>
   <div class="alert">
              
            </div>
            <div class="row" style="margin-top:-30px">
    			<div class="col-xs-12 col-sm-4 col-md-4">
					<div class="form-group">
                        <input type="text"  name="first_name" id="first_name" class="form-control" placeholder="First Name" tabindex="1">
					</div>
				</div>
                <div class="col-xs-12 col-sm-2 col-md-2">
    				<div class="form-group">
                        <input type="text" name="middle_name" id="middle_name" class="form-control" placeholder="Middle Name" tabindex="1">
					</div>
				</div>
				<div class="col-xs-12 col-sm-2 col-md-2">
					<div class="form-group">
						<input type="text" name="last_name" id="last_name" class="form-control " placeholder="Last Name" tabindex="2">
					</div>
				</div>
                <div class="col-xs-12 col-sm-4 col-md-4">
					<div class="form-group">
						<input type="text" name="Phone_Number" id="Phone" class="form-control " placeholder="PhoneNumber" tabindex="2">
					</div>
				</div>
                
			</div>
			<div class="form-group col-xs-12 col-sm-10">
				<input type="text" name="display_name" oninput="buttonEnableDisable()" id="display_name" class="form-control " style="margin-left: -15px;" placeholder="Display Name" tabindex="3">
			</div>
                        <div class="form-group col-xs-12 col-md-2">
                            <input type="button" name="displayName" id="ajaxName" class="form-control btn-primary " value="Check" tabindex="8" onclick="Ajaxvalidate(1)">
			</div>
			<div class="form-group col-xs-12 col-sm-10">
				<input type="email" name="email" id="email" class="form-control " oninput="buttonEnableDisable()" style="margin-left: -15px;" placeholder="Email Address" tabindex="8">
			</div>
                           <div class="form-group col-xs-12 col-md-2">
                               <input type="button" name="" id="" class="form-control btn-primary " value="Check" tabindex="8" onclick="Ajaxvalidate(6)">
			</div>
   
   
			<div class="row">
				<div class="col-xs-12 col-md-6">
					<div class="form-group">
						<input type="password" name="password" id="password" class="form-control " placeholder="Password" tabindex="5">
					</div>
				</div>
				<div class="col-xs-12 col-md-6">
					<div class="form-group">
						<input type="password" name="password_confirmation" id="password_confirmation" class="form-control " placeholder="Confirm Password" tabindex="6">
					</div>
				</div>
			</div>
                                    
                                    <div class="input-group">
                                      <div class="" style="margin-top: 0px;">
                                        <label>
                                            <span class="btn btn-default btn-file btn-danger">
                                               Upload Image <input type="file" id="files" name="files[]" />
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

  document.getElementById('files').addEventListener('change', handleFileSelect, false);
</script>
                                               
                                        </label>
                                        
                                      </div>
                                    </div>
                                    
                      <button type="submit" disabled="true"name="done" id="enableDisable"class="btn btn-success">Done</button>
  <span></span>
  
  <hr style="margin-top:10px;margin-bottom:10px;" >
  
  <div class="form-group">
                                    
                                        <div style="font-size:85%">
                                            Don't have an account! 
                                        <a href="#" onClick="$('#loginbox').hide(); $('#signupbox').show()">
                                            Sign Up Here
                                        </a>
                                        </div>
                                    
                                </div> 
</form>
  </div>
</div>
</div>
</div>
</body>
	
</html>