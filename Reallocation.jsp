
<%@page import="Group.DBConnection" %>
<%@page import= "java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reallocation</title>
    </head>
    <body>
        <form method="post" action="Reallocate">
        <table>
            <b> STAFF DETAILS</b>
            <% 
            
            DBConnection c = new DBConnection();
             Statement s=c.getConnection();
           
            %>
            
            <tr>
                <th>Staff ID </th> 
                <th>Staff Name </th>
                <th>Product Line</th>
                <th>Reallocate to</th>
                <th>Action</th>  
            </tr>
           <% 
           ResultSet rs = s.executeQuery("SELECT * FROM staff");
            
           while(rs.next()){
           %>
           <tr>
               <td><%= rs.getString("StaffID")%></td>
               <td><%= rs.getString("first_name")%> <%= rs.getString("last_name")%></td>
               <td><%= rs.getInt("Product_Line")%></td>
               <td>
                   
                 <select name="productline" >
                 <option value="Long-term">Long-term</option> 
                 <option value="Short-term">Short-term</option>
                 <option value="Middle-term">Middle-term</option>
                 </select>
                   <input type="hidden" name="id" value="<%= rs.getString("StaffID")%>">
               </td>
               <td><input type="submit" value="REALLOCATE"></td>
           </tr>
           
           
           
           
               <% } %> 
            
        </table>
               </form>  
    </body>
</html>
