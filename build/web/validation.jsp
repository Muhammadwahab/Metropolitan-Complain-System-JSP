<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%!

Connection con;
java.sql.Statement statement;
ResultSet rs;
boolean valid=false;
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
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <title>ComplainRegistered</title>
    </head>
     
        
        <% 
          String nicComplain=request.getParameter("nic");
          validate(nicComplain);
        %>
    <body>
         
        <%if(valid==true)
        {
        
        out.print("not valid");
        valid=false;
        }
        else
        {
            out.print("Valid");
         
        }
        %>
          
       
    </body>
</html>
