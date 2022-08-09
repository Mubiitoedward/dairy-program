<%-- 
    Document   : index
    Created on : Aug 7, 2022, 10:10:59 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <% String name = (String)session.getAttribute("fullname"); 
           out.print("welcome"+ name);
        %>
        
        ${name}
    </body>
</html>
