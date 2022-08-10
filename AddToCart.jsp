<%-- 
    Document   : AddToCart
    Created on : Aug 10, 2022, 3:06:57 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
     
       String ProductID=request.getParameter("productID");
       String Price= request.getParameter("price");
       
try{
     
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/dairy","root","");
      Statement st1=conn.createStatement();
      String InsertStatement = "insert into cart (productID,quantity,totalPrice) values('"+ProductID +"','1','"+Price+"');";
     
      st1.executeUpdate(InsertStatement);
      response.sendRedirect("ind.jsp");
     
     
    }
      catch(Exception error){
     
      out.println(error);
      }  
  %>
    </body>
</html>