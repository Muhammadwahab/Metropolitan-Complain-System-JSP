<%-- 
    Document   : Complain_process
    Created on : 01-Apr-2016, 05:05:39
    Author     : Engr.Uzma
--%>

<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%!

Connection con;
java.sql.Statement statement;
ResultSet rs;
boolean valid=false;
Random random=new Random();
String name,nic,address,districname,ucnumber,email,complain,chairmon,voicechairmon,concelour;


public Connection connection() throws Exception
{
 
            
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/complaincenter","root","");
return con;
}

// new function for insertion
 
 public void validate(String nic)
 {
  
     try {
            con=connection();
            statement=con.createStatement();
            String insert="select *from registratin where nic='"+nic+"'";
            rs=statement.executeQuery(insert);
            while(rs.next())
            {
                if(nic.equalsIgnoreCase(rs.getString("nic")))
                {
                 valid=true;
                 break;
                }
                
            }
     }catch (Exception e) {
              
        }
 
 }
 
 public void insert_into_Administration(String nic,String complain,String Code) {
        
        try {
            con=connection();
            statement=con.createStatement();
            String insert="insert into administrator(complain,nic,TrackingCode) values ('"+complain+"','"+nic+"','"+Code+"')";
            statement.execute(insert);
            con.close();
        } catch (Exception e) {
            
            
        }
    }
%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="ComplainCss.css" rel="stylesheet">
        <title>ComplainRegistered</title>
    </head>
     
    
        
        <% if(request.getParameter("check")!=null)
        {
         
          session.setAttribute("message","valid NIC" );
          String nicComplain=request.getParameter("nic");
          validate(nicComplain);
          if(valid==true)
          {
              session.setAttribute("message","Valid Nic Number");
              session.setAttribute("nic",nicComplain);
              valid=false;
          request.getRequestDispatcher("/Home.jsp").forward(request, response);
          }
          else
          {
              session.setAttribute("message","InValid Nic Number");
           request.getRequestDispatcher("/Home.jsp").forward(request, response);
          }
          request.getRequestDispatcher("/Home.jsp").forward(request, response);

        }
        else{
        
         String nic=request.getParameter("nic");
         complain=request.getParameter("textarea");
         long codenumber=random.nextInt(100)*1000;
         String trackingCode=nic+"-"+codenumber;
         insert_into_Administration(nic,complain,trackingCode);
         
        }
        %>
    <body>
         <h1><MARQUEE behavior="scroll" direction="left" width="100%" scrollamount="20">Metropolitan Complain Center</marquee></h1>
          <br>
          
        <div class="Mainblock">
            
            <div>
                <label class="text">
                
                Congratulation <%out.print(this.name+" Nic #="+nic);%>
                Your Complain Registered SuccessFully.<br> Your Complain Solve As Soon As Possible Please
                Keep In touch Thanks,Regard
                
            </label>
                <a href="Home.jsp"><input type="button" value="Back To Home">
            </div>
            
        </div>
    </body>
