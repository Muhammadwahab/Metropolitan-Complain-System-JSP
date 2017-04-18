var EAST=['UC 1','UC 2','UC 3','UC 4'];
var WEST=['UC 5','UC 6','UC 7','UC 8'];
var NORTH=['UC 9','UC 10','UC 11','UC 12'];
var SOUTH=['UC 13','UC 14','UC 15','UC 16'];
var CENTRAL=['UC 17','UC 18','UC 19','UC 20'];
var picCount=0;
var vidCount=0;
var buttonDisplayName=false;
var buttonEmail=false;
var checkConfirm=false;
var notMatch;
function CheckStatus()
{
    document.getElementById('submint')
    
}
function admin()
{
   var admin= document.getElementById('admin').value;
   if(admin=='EP 1449084')
   {
       window.location='Administration_Access_Control.jsp';
   }
   else
   {
        alert("Administrator Code invalid");
   }
}
 $(document).ready(function(){

    
        
        $('#update').submit(function() { // catch the form's submit event
           var dataValue="picture";
    $.ajax({ // create an AJAX call...
        data:{
            name:dataValue
        } , // get the form data
        type: $(this).attr('method',"POST"), // GET or POST
        url: $(this).attr('action',"update?name="+dataValue), // the file to call
        success: function(response) {
            
            
                // on success..
            //$('#txt').html(response); // update the DIV
             if(response=="1")
             {
                 document.getElementById('txt').innerHTML='wahab';
             }
        {
            
            
        }
        }
    });
    return false; // cancel original event to prevent form submitting
});

//       $("form#yourform").attr('action',"update");
//       $("form#yourform").attr('enctype', "multipart/form-data");
//       $("form#yourform").attr('method', "get");
//         
//         alert("wahab");
//        $('yourform').submit(); //upload button 
//                 
                  
                  
//            $.ajax({
//                  type: "get",
//                  url: "update",
//                   data: {
//                     name:dataValue  
//                   },
//                   async: false,
//                    contentType: 'multipart/form-data',
//                  dataType: "text",
//                   success: function(result) {
//                       //do something
//                        console.log(result)
//                   }
//              });
//             
    }); 

    

function updateSetting(dataValue)
{
      var xhttp;
if (window.XMLHttpRequest) {
    xhttp = new XMLHttpRequest();
    } else {
    // code for IE6, IE5
    xhttp = new ActiveXObject("Microsoft.XMLHTTP");
}
  xhttp.onreadystatechange = function(){
   
      if(xhttp.readyState == 4){
          
         var ajaxDisplay = document.getElementById('txt');
         var data=xhttp.responseText;
         var ele=document.createElement("html");
         ele.innerHTML=data;
         var txt=jQuery(ele).find("body").text().trim();
         // for enable button
         if(txt==1)
         {
             document.getElementById('txt').innerHTML=dataValue+' Update Successfully'
             
         }
         else if(checkConfirm==true)
         {
              document.getElementById('txt').innerHTML=notMatch;
              checkConfirm=false;
         }
         
     }
 }
    if(dataValue=='firstname')
    {
        var updateValue=document.getElementById('first_name').value
        var queryString = "?name=" + dataValue+"&value="+updateValue;
        xhttp.open("GET", "update" + queryString, true);
        xhttp.send(null);
    }
    else if(dataValue=='middlename')
    {
        var updateValue=document.getElementById('middle_name').value
        var queryString = "?name=" + dataValue+"&value="+updateValue;
        xhttp.open("GET", "update" + queryString, true);
        xhttp.send(null);
    }
    else if(dataValue=='lastname')
    {
        var updateValue=document.getElementById('lastname').value
        var queryString = "?name=" + dataValue+"&value="+updateValue;
        xhttp.open("GET", "update" + queryString, true);
        xhttp.send(null);
    }
    else if(dataValue=='phonenumber')
    {
        var updateValue=document.getElementById('phonenumber').value
        var queryString = "?name=" + dataValue+"&value="+updateValue;
        xhttp.open("GET", "update" + queryString, true);
        xhttp.send(null);
    }
    else if(dataValue=='password')
    {
        var updateValue=document.getElementById('password').value
         var updateValueConfirm=document.getElementById('password_confirmation').value
         if(updateValue==updateValueConfirm)
         {
             checkConfirm=true;
              var queryString = "?name=" + dataValue+"&value="+updateValue;
        xhttp.open("GET", "update" + queryString, true);
        xhttp.send(null);
         }
         else
         {
             notMatch='Confirm Password Did Not Match';
             document.getElementById('txt').innerHTML=notMatch;
             
         }
       
    }
     else if(dataValue=='picture')
     {
          var updateValue=document.getElementById('picture').value
           var queryString = "?name=" + dataValue+"&value="+updateValue;
           xhttp.open("GET", "update" + queryString, true);
        xhttp.send(null);
     }
   
    

}
function onOff()
{
    document.getElementById('first_name').disabled=true;
}
function tracking()
{
     document.getElementById("Track-output").innerHTML="";
}
 function track()
     {
         
         
         var xhttp;
if (window.XMLHttpRequest) {
    xhttp = new XMLHttpRequest();
    } else {
    // code for IE6, IE5
    xhttp = new ActiveXObject("Microsoft.XMLHTTP");
}
            xhttp.onreadystatechange = function(){
   
      if(xhttp.readyState == 4){
          
         var ajaxDisplay = document.getElementById('txt');
         var data=xhttp.responseText;
         var ele=document.createElement("html");
         ele.innerHTML=data;
         var txt=jQuery(ele).find("body").text().trim();
         var searchValue=txt.search("null");
         var indexSearch=txt.search("range");
         if(searchValue>=0 || indexSearch>=0)
         {
           // document.getElementById("Track-output").innerHTML="Sorry You did not filled in Complain";
                alert("Sorry You did not filled any Complain")
            
         }
         else
         {
             document.getElementById("Track-output").innerHTML=data;
         }
         
         
         
         
                }
         
     }
     var code = document.getElementById('code').value;
   var queryString = "?code=" + code ;
   xhttp.open("GET", "trackingProcess.jsp" + queryString, true);
   xhttp.send(null);
     }
function buttonEnableDisable()
{
        
        document.getElementById('enableDisable').disabled=true;
    
    
}

function Fun() {
    var vid = document.getElementById("myVideo");
    alert(vid.error.code);
}

function RetrieveImage(type)
{
    
    var id=document.getElementById("getImageID").value;
    
    if(type=="Snaps" && picCount==0)
    {
           document.getElementById("img").innerHTML += "<img class='picture' src='retrieveImage?value="+id+"&type="+type+"' width='200' height='200' alt='The Image'/>";
           picCount++;
        
    }
    else if(type=="Videos" && vidCount==0)
    {
//        var videlem = document.createElement("video");
///// ... some setup like poster image, size, position etc. goes here...
///// now, add sources:
//videlem.setAttribute("controls", "controls");
//videlem.setAttribute("width", "320");
//    videlem.setAttribute("height", "240");
//
//var sourceMP4 = document.createElement("source"); 
//sourceMP4.type = "video/MP4";
//sourceMP4.src = "retrieveImage?value="+id+"&type="+type+"";
//videlem.appendChild(sourceMP4);
//document.getElementById("img").innerHTML +=videlem;

        // new video work
//         var x = document.createElement("VIDEO");
//
//    if (x.canPlayType("video/mp4")) {
//        x.setAttribute("src","retrieveImage?value="+id+"&type="+type+"");
//    } else {
//        x.setAttribute("src","retrieveImage?value="+id+"&type="+type+"");
//    }
//
//    x.setAttribute("width", "320");
//    x.setAttribute("height", "240");
//    x.setAttribute("controls", "controls");
//    document.getElementById("img").innerHTML +=x;
                vidCount++;
               document.getElementById("img").innerHTML += "<video class='video'id='myVideo' type='video/mp4' codecs='mp4v.20.8' src='retrieveImage?value="+id+"&type="+type+"' width='200' height='200' controls/>";
                
   // }
    
}
}

            function getVal(){

                var id=document.getElementById("chose").value;
           
                if(id==="EAST")
                {
                  var ucNames=document.getElementById("choseUC");
                  ucNames.innerHTML="";
                  EAST.forEach(function(i,j){
                  ucNames.innerHTML+="<option>"+i+"</option>"
                  });
                }
                else if(id==="WEST")
                {
                   var ucNames=document.getElementById("choseUC");
                  ucNames.innerHTML="";
                  WEST.forEach(function(i,j){
                  ucNames.innerHTML+="<option>"+i+"</option>"
                  }); 
                }
                else if(id==="NORTH")
                {
                 var ucNames=document.getElementById("choseUC");
                 ucNames.innerHTML="";
                  NORTH.forEach(function(i,j){
                  ucNames.innerHTML+="<option>"+i+"</option>"
                  });   
                    
                }
                else if(id==="SOUTH")
                {
                  var ucNames=document.getElementById("choseUC");   
                 ucNames.innerHTML="";
                  SOUTH.forEach(function(i,j){
                  ucNames.innerHTML+="<option>"+i+"</option>"
                  });   
                }
                else if(id==="CENTRAL")
                {
                  var ucNames=document.getElementById("choseUC");   
                 ucNames.innerHTML="";
                  CENTRAL.forEach(function(i,j){
                  ucNames.innerHTML+="<option>"+i+"</option>"
                  });   
                    
                }
                

            }
             function ValidateRegistration()
        {
        var first_name = document.forms["register"]["first_name"].value;    
        var middle_name = document.forms["register"]["middle_name"].value;
        var last_name = document.forms["register"]["last_name"].value;
        var display_name = document.forms["register"]["display_name"].value;
         var email = document.forms["register"]["email"].value;
          var password = document.forms["register"]["password"].value;
          var confirmpassword = document.forms["register"]["password_confirmation"].value;
          var phonenumber=document.forms["register"]["Phone"].value;
        
        
        if(first_name==="")
        {
           
            document.getElementById("txt").innerHTML ='first name must be filled out';
            document.getElementById("first_name").style.borderColor="red";
            return false;
        }
        else if(middle_name==="")
        {
            document.getElementById("txt").innerHTML ='middle name must be filled out';
            document.getElementById("middle_name").style.borderColor="red";
        return  false;
        }
        else if (last_name==="")
        {
            document.getElementById("txt").innerHTML ='last name must be filled out';
            document.getElementById("last_name").style.borderColor="red";   
             return  false;
        }
        else if (phonenumber==="")
        {
            document.getElementById("txt").innerHTML ='Phonenumber must be filled out';
            document.getElementById("Phone").style.borderColor="red";   
             return  false;
        }
        else if (display_name==="")
        {
            document.getElementById("txt").innerHTML ='display name must be filled out';
            document.getElementById("display_name").style.borderColor="red";
             return  false;
        }
        else if (email==="")
        {
            document.getElementById("txt").innerHTML ='email must be filled out';
            document.getElementById("email").style.borderColor="red";
             return  false;
        }
        else if (password==="")
        { 
            document.getElementById("txt").innerHTML ='password must be filled out';
            document.getElementById("password").style.borderColor="red";
             return  false;
        }
         else if (confirmpassword==="")
        {
            document.getElementById("txt").innerHTML ='confirmpassword must be filled out';
            document.getElementById("password_confirmation").style.borderColor="red";
             return  false;
        }
         else if (confirmpassword!==password)
        {
            document.getElementById("txt").innerHTML ='Password Did Not Match';
            document.getElementById("password_confirmation").style.borderColor="green";
       
             return  false;
        }
        else 
        {
            
             
            return true;
            
        }
        
        }
        function Ajaxvalidate(Decider,Content)
        {
            var xhttp;
if (window.XMLHttpRequest) {
    xhttp = new XMLHttpRequest();
    } else {
    // code for IE6, IE5
    xhttp = new ActiveXObject("Microsoft.XMLHTTP");
}
            xhttp.onreadystatechange = function(){
   
      if(xhttp.readyState == 4){
          
         var ajaxDisplay = document.getElementById('txt');
         var data=xhttp.responseText;
         var ele=document.createElement("html");
         ele.innerHTML=data;
         var txt=jQuery(ele).find("body").text().trim();
         // for enable button
         if(txt=='Display Valid')
         {
             buttonDisplayName=true;
             
             if(buttonDisplayName==true && buttonEmail==true)
             {
                 document.getElementById('enableDisable').disabled=false;
                 buttonDisplayName=false
                 buttonEmail=false;
             }
         }
         else if(txt=='Email Valid')
         {
             buttonEmail=true;
             if(buttonDisplayName==true && buttonEmail==true)
             {
                 document.getElementById('enableDisable').disabled=false;
                 buttonDisplayName=false
                 buttonEmail=false;
             }
         }
         else
         {
          //document.getElementById('enableDisable').disabled=true;   
         }
         if(txt=='1')
         {
             window.location='Login.jsp';
         }
         else if(txt=='2')
         {
             window.location='HOME.jsp';
                return true;
         }
         else if(txt=='3')
         {
            var link=document.createElement('a');
            link.setAttribute("href","verify.jsp");
            link.innerHTML=' Verify'
//         
             ajaxDisplay.innerHTML = 'Please Check your Email to  Verify Your Account Using verification code and click this Link';
             ajaxDisplay.appendChild(link);
                return false;
         }
         else if(txt=='4')
         {
             ajaxDisplay.innerHTML = 'First register Your self';
                return false;
         }
         else if(txt=='not valid' && Content=='On Registration')
         {
             // document.getElementById("page").className = "";
            // document.getElementById("page").className = "glyphicon glyphicon-asterisk well well-sm form-control";
           
             document.getElementById("txt").className = "text-danger";
             
             ajaxDisplay.innerHTML = 'Nic Already In Registered';
                return false;
         }
         else if(txt=='Valid' && Content=='On Complain')
         {
             // document.getElementById("page").className = "";
            // document.getElementById("page").className = "glyphicon glyphicon-asterisk well well-sm form-control";
             document.getElementById("txt").className = "text-danger";
           
             ajaxDisplay.innerHTML ='Please Registered On this nic';
                return false;
         }
         else if(txt=='not valid' && Content=='On Complain')
         {
             // document.getElementById("page").className = "";
            // document.getElementById("page").className = "glyphicon glyphicon-asterisk well well-sm form-control";
             document.getElementById("txt").className = "text-danger";
             document.getElementById('submit').disabled=false;  
             ajaxDisplay.innerHTML = 'Valid Nic';
          
                return false;
         }
         else if(txt=='Valid' && Content=='On Registration')
         {
             ajaxDisplay.innerHTML = 'Valid Nic';
                document.getElementById('submit').disabled=false;
                return false;
         }
         else if(txt=='Invalid Code for Registration4')
         {
             ajaxDisplay.innerHTML = 'Invalid Code for Registration';
         }
         else if(txt=='Reset email valid')
         {
             window.location='sucessResetPassword.jsp'
             
         }
         else if(txt=='reset not valid')
         {
             var reset = document.getElementById('reset').value;
              document.getElementById('txt').innerHTML=reset+' Incorrect Email or Display Name'
             
         }
         else
         {
             
             ajaxDisplay.innerHTML = xhttp.responseText;
         }
      }
   }
   if(Decider==1)
   {
   var Name = document.getElementById('display_name').value;
   var queryString = "?display_name=" + Name ;
   xhttp.open("GET", "Checking_process.jsp" + queryString, true);
   xhttp.send(null);
   }
    else if(Decider==6)
   {
   var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;
   var queryString = "?email=" + email+"&password="+password;
   xhttp.open("GET", "Checking_process.jsp" + queryString, true);
   xhttp.send(null);
   }
   else if(Decider==2)
   {
   var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;
   var queryString = "?email=" + email+"&password="+password;
   xhttp.open("GET", "process.jsp" + queryString, true);
   xhttp.send(null);
   }
   else if(Decider==3)
   {
   var code = document.getElementById('code').value;
   var queryString = "?code=" + code ;
   xhttp.open("GET", "process.jsp" + queryString, true);
   xhttp.send(null);
   }
   else if(Decider==4)
   {
       var nic = document.getElementById('nic').value;
       var queryString = "?nic=" + nic ;
   xhttp.open("GET", "validation.jsp" + queryString, false);
   xhttp.send(null);
       
   }
    else if(Decider==7)
   {
       var reset = document.getElementById('reset').value;
       var queryString = "?resetText=" + reset ;
   xhttp.open("GET", "Reset" + queryString, false);
   xhttp.send(null);
       
   }
   else
   {
       var email = document.getElementById('email').value;
   var queryString = "?email=" + email ;
   xhttp.open("GET", "Checking_process.jsp" + queryString, true);
   xhttp.send(null);
       
   }
            
        }
        
       


