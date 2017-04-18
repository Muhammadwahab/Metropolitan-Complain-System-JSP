<%-- 
    Document   : logout
    Created on : 14-Apr-2016, 23:04:44
    Author     : Engr.Uzma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

session.invalidate();
 request.getSession().removeAttribute("email");
response.sendRedirect("Login.jsp");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
