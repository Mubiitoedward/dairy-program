

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
       <%
        int i=0;
       try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dairyproduction","root","");
            
             Statement st= conn.createStatement();
                
                
                ResultSet rs = st.executeQuery("Select * from productstable");
            %>
            <table width="50%">
                <tr>
                    <th>ProductName</th>
                    <th>UnitPrice</th>
                    <th>Category</th>
                    <th>Quantity per day</th>
                    <th>Description</th>
                   
                </tr>
            <%
                
                while(rs.next()){
                %><tr><%
                    %><td><%out.println(rs.getString("ProductName"));%></td><%
                    %><td><%out.println(rs.getString("UnitPrice"));%></td><%
                    %><td><%out.println(rs.getString("ProductType"));%></td><%
                    %><td><%out.println(rs.getString("ProductQuantity"));%></td<%
                    %><td><%out.println(rs.getString("Description"));%> </td>
                   
                      
                </tr><%
                  i++;
                }
            %>
            
            </table>
            <%
              //out.println(i);  
        }
        catch(Exception er){
            out.println("Connection Failed" +er.getMessage());
        }
        if(i<4){
    %>
   
    <h3>Add Set of Product</h3>
    <div class="card-body">
          <form action="AddingToTheDataBase" method="POST">
            
            <div class="input-group mb-3">
               <label>Name</label>
                <select name="ProductName" class="form-control">
                    <option value="PowderedMilk">PowderedMilk</option>
                    <option value="Ghee">Ghee</option>
                    <option value="icecream">icecream</option>
                    <option value="Yoghout">Yoghout</option>
                </select>
         
                <div class="input-group-append">
                    <div class="input-group-text">
                        <span class="fas fa-phone"></span>
                    </div>
                </div>
            </div>
           <div class="input-group mb-3">
               <label>Price</label>
                <input type="number" name="price" class="form-control">
         
                <div class="input-group-append">
                    <div class="input-group-text">
                        <span class="fas fa-phone"></span>
                    </div>
                </div>
            </div>
            <div class="input-group mb-3">
                     <label>Category</label>
                        <select name="Productcategory">
                            <option value="Long-term">Long-term</option>
                            <option value="Mid-term">Mid-term</option>
                            <option value="Short-term">Short-term</option>

                        </select>
         
                <div class="input-group-append">
                    <div class="input-group-text">
                        <span class="fas fa-phone"></span>
                    </div>
                </div>
            </div>
              
            <div class="input-group mb-3">
                     <label>Description</label>
                     <input type="textarea" name="description">
         
                <div class="input-group-append">
                    <div class="input-group-text">
                        <span class="fas fa-phone"></span>
                    </div>
                </div>
            </div>
           
            <div class="input-group mb-3">
                      <label>Image</label>
                       <input type="file" name="image">
         
                <div class="input-group-append">
                    <div class="input-group-text">
                        <span class="fas fa-phone"></span>
                    </div>
                </div>
            </div>
            
           
            <button type="submit">Submit</button>
        </form>
    </div>
         <% } else {
                //out.println("Yeye");
                String Category="Long-term";
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dairyproduction","root","");
                     Statement st1= conn.createStatement();
                try{
            
                   
                   ResultSet rs1 = st1.executeQuery("Select ProductQuantity from productstable where ProductType ='"+"Long-term"+"'");
                 
                    %> 
          <h3>Quantity produced daily for Long Term</h3>
          
          <form action="ProductQuantity" method="POST">
             <label>Quantity</label>
             <input type="number" name="quant" " >
             <button type="submit">Update</button>
             
         </form>
        <%
                }catch(SQLException es){
                out.println(es.getMessage());
                }
}   
       %>
       
    </body>
</html>
