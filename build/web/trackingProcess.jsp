<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%!

Connection con;
java.sql.Statement statement;
Exception a;
ResultSet rs;
 String name,nicNum,complain,code,status,dis,email,address,uc;


public Connection connection() throws Exception
{
 
            
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/complaincenter","root","");
return con;
}

// new function for insertion
%>
      <% try {
                            con=connection();
            statement=con.createStatement();
            String reString=request.getParameter("code");
            StringBuilder nic=new StringBuilder(reString);
            int index=nic.indexOf("-");
              String ActualValue=reString.substring(0, index);
            String insert="SELECT administrator.nic,"
                    + " administrator.complain, "
                    + "administrator.TrackingCode, "
                    + "administrator.Status,"
                    + " registratin.name,"
                    + " registratin.address,"
                    + " registratin.email, "
                    + "distric.distrcName,"
                    + "distric.UC from administrator "
                    + "INNER JOIN registratin ON administrator.nic = registratin.nic "
                    + "RIGHT JOIN distric ON registratin.nic = distric.nic "
                    + "WHERE administrator.TrackingCode ='"+reString+"'";

            rs=statement.executeQuery(insert);%>
             
             <%while(rs.next())
             {
                
                 name=rs.getString("name");
                  
                  nicNum=rs.getString("nic");
                  complain=rs.getString("complain");
                  code=rs.getString("TrackingCode");
                   status=rs.getString("Status");
                  dis=rs.getString("distrcName");
                  email=rs.getString("email");
                  address=rs.getString("address");
                   StringBuilder ucVaribele=new StringBuilder(rs.getString("UC"));
            int ucIndex=ucVaribele.indexOf("-");
               uc=rs.getString("UC").substring(0, ucIndex);
                
                  
             }
             }catch(Exception e)
                        {
                            out.print(e);
                        }
                        
             %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div style="height: 200px;border: 1px solid #46b8da;background-color: #46b8da;width: 823px;">
           <div style="height: 30%;border: 1px solid #46b8da;background-color: #d6e9c6;margin: -1px;padding-left: 301px;padding-top: 0px">
               <h4 style="font-family: cursive;font: bold;font-size: 30px">Complain Tracker</h4>
               </div>
            <div style="height: 143px;border: 1px solid #46b8da;background-color: #AC29FB;padding-left: 61px;padding-top: 20px">
                <div style="height: 115px;width: 90%;border: 1px hidden #255625;overflow: auto;font-family: sans-serif;font-size: 20px
                     ">
                    <h6 id="empty" style="font-size: 22px">Dear <b><%out.print(name);%></b>,Registered With Nic <%out.print(nicNum);%> Email ID:<%out.print(email);%> Street Address <%out.print(address);%> Your Complain <%out.print(complain);%> Current Status Is <%out.print(status);%> Complain Location is <%out.print(uc);%> District <%out.print(dis);%> </h6>
                     <%name="";
                       nicNum="";
                       address="";
                       dis="";
                       email="";
                       complain="";
                       status="";
                       uc="";
                       
                       
                     %>
                 </div>
                </div>
       </div>
    </body>
</html>
