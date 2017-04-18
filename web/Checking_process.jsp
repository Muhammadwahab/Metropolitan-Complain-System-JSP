<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%!

Connection con;
java.sql.Statement statement;
Exception a;
boolean valid=false;
String name,nic,address,displayname,ucnumber,email,complain,chairmon,voicechairmon,concelour;


public Connection connection() throws Exception
{
 
            
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/complaincenter","root","");
return con;
}

// new function for insertion
 
 public void validate(String displayname,String email)
 {
     ResultSet result;
  
     try {
            con=connection();
            statement=con.createStatement();
            if(displayname==null)
            {
                displayname="";
            }
            else
            {
                email="";
            }
            String insert="select *from login_registration where displayname='"+displayname+"' or email='"+email+"'";
            result=statement.executeQuery(insert);
            while(result.next())
            {
                if(email=="" && displayname.equalsIgnoreCase(result.getString("displayname")))
                {
                 valid=true;
                 break;
                }
                if(email.equalsIgnoreCase(result.getString("email")))
                {
                 valid=true;
                 break;
                }
                
                
            }
     }catch (Exception e) {
         a=e;
         
              
        }
 
 }

%>

<!DOCTYPE html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%email=request.getParameter("email");
         displayname=request.getParameter("display_name");
         validate(displayname,email);
        if(email==null)
        {
            
            if(valid==true)
            {
                valid=false;
                out.print("Display Already Taken Choose Another ");
            }
            else
            {
            out.print("Display Valid");
            }
         
        }
        else
        {
            if(valid==true)
            {
            valid=false;
            out.print("Email Already Taken Choose Another ");
            }
            else
            {
            out.print("Email Valid");
            }
        
        }
        %>
       
    </body>
</html>
