<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="smtp.Email"%>
<%!

String firstname,middlename,lastname,displayname,password,email,code;
 
Connection con;
java.sql.Statement statement;
ResultSet rs;
boolean valid=false ,loginvalid=false,done=false;
 Random random=new Random();

public Connection connection() throws Exception
{
 
            
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/complaincenter","root","");
return con;
}

// new function for insertion
 public void insert_into_Database(String firstname,String middlename,String lastname,String displayname ,String password,String email,long code) {
        
        try {
            con=connection();
            statement=con.createStatement();
            String insert="insert into login_registration (firstname,middlename,lastname,displayname,password,email,code) values ('"+firstname+"','"+middlename+"','"+lastname+"','"+displayname+"','"+password+"','"+email+"',"+code+")";
            statement.execute(insert);
            con.close();
        } catch (Exception e) {
            
            Exception a=e;
            a=e;
            
            
        }
    }
 public void updateRecord(String verify)
 {
     int ver=1;
     try {
            con=connection();
            statement=con.createStatement();
            String insert="update login_registration set verify="+ver+" where code="+verify+"";
            statement.execute(insert);
            con.close();
        } catch (Exception e) {
        }
 
 
 }
 public void ValidateLogin(String email,String password)
 {
 ResultSet result;
  
     try {
            con=connection();
            statement=con.createStatement();
            int verify=1;
            
            String insert="select *from login_registration where email='"+email+"' and password='"+password+"'";
            result=statement.executeQuery(insert);
            while(result.next())
            {
                loginvalid=true;
                if(verify==result.getInt("verify"))
                {
                 valid=true;
                 break;
                }
            }
     }catch (Exception e) {
        }
 }
 public void validateCode(String code)
 {
     ResultSet result;
  
     try {
            con=connection();
            statement=con.createStatement();
            
            String insert="select *from login_registration where code="+code+"";
            result=statement.executeQuery(insert);
            while(result.next())
            {
                if(code.equalsIgnoreCase(result.getString("code")))
                {
                 valid=true;
                 updateRecord(code);
                 done=true;
                 break;
                }
            }
     }catch (Exception e) {
        }
 
 }
%>
<%
    
     code=request.getParameter("code");
     email=request.getParameter("email");
     if(code!=null)
     {
         validateCode(code);
         
        
     }
     else if(email!=null && request.getParameter("done")==null)
     {
         password=request.getParameter("password");
         ValidateLogin(email,password);
     
     }
     else
     {
         // this is for Image uploading
         
    firstname=request.getParameter("first_name");
    middlename=request.getParameter("middle_name");
    lastname=request.getParameter("last_name");
    displayname=request.getParameter("display_name");
    email=request.getParameter("email");
    password=request.getParameter("password");
    long codenumber=random.nextInt(100)*1000;
    insert_into_Database(firstname,middlename,lastname,displayname,password,email,codenumber);
         new Email(email,codenumber);
         if(request.getPart("files[]")!=null)
         {
         int a=3;
         }
         response.sendRedirect("verify.jsp");
     
     }
     
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
         if(valid==true && code!=null)
         {
             //for confirmation of code
             int a=1;
             out.print(a);
             valid=false;

         }
         else
         {
             if(email!=null)
             {
                 
             }
             else
             {
                 out.print("Invalid Code for Registration");
             }
         
         }
         if(loginvalid==true && valid==true && email!=null)
         {
             int a=2;
             session.setAttribute("email", email);
             out.print(a);
             loginvalid=false;
             valid=false;
         
         }
         else if(loginvalid==true && valid!=true && email!=null)
         {
         // verifivation req
             int a=3;
             out.print(a);
             loginvalid=false;
             valid=false;
         }
         else if(done==false)
         {
             int a=4;
             out.print(a);
         //registration req
         
         }
        %>
    </body>
</html>
