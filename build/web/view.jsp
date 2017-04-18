<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%!


Connection con;
java.sql.Statement statement;
ResultSet rs;
boolean valid=false ,loginvalid=false;

public Connection connection() throws Exception
{
 
            
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/complaincenter","root","");
return con;
}

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View File</title>
    </head>
    <body>
        
        <%  
            String email=(request.getParameter("id"));
            
            Blob file = null;
            byte[ ] fileData = null ;

            try
            {    
                
                Connection conn=connection();
            
                String sqlString = "SELECT *FROM login_registration where email='"+email+"'";
                Statement myStatement = conn.createStatement();
                
                ResultSet rs=myStatement.executeQuery(sqlString);
                
                if (rs.next()) 
                {
                    file = rs.getBlob("picture");
                    fileData = file.getBytes(1,(int)file.length());
                } else 
                {
                    out.println("file not found!");
                    return;
                }
                
                response.setContentType("application/png");
                response.setHeader("Content-Disposition", "inline");
                response.setContentLength(fileData.length);
                
                OutputStream output = response.getOutputStream();
                output.write(fileData);
                
                output.flush();
                
            } catch (SQLException ex) {Logger.getLogger(Logger.class.getName()).log(Level.SEVERE, null, ex);} 
        %>
        
        <br><br>
        <a href="main_page.jsp">Go to Main Page...</a>        
                
        <div style="position: relative">
            <div style="position: fixed ; bottom: 0 ; width:100% ; text-align:center ">
                <p><a href="https://www.youtube.com/user/TechWorld3g?sub_confirmation=1">CLICK HERE TO SUBSCRIBE</a></p>
            </div>
        </div>
        
    </body>
</html>