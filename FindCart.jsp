
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
        
       try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dairyproduction","root","");
            
             Statement st= conn.createStatement();
                
                
                ResultSet rs = st.executeQuery("Select * from cart where CustomerID='"+"1"+"'");
                int AllTotal=0;
            %>
            <table width="100%">
                <tr>
                    <th>Product</th>
                    <th>Unit Price</th>
                    <th>Number</th>
                    <th>Item Total</th>
                   
                    <th>Remove From Cart</th>
                   
                </tr>
            <%
                
                while(rs.next()){
                 int P = Integer.parseInt(rs.getString("OrderPrice"));
                int Q = Integer.parseInt(rs.getString("OrderQuantity"));
                int Total = P*Q;
                AllTotal+=Total;
                %><tr><%
                    %><td><%out.println(rs.getString("ProductName"));%></td><%
                    %><td><%out.println(rs.getString("OrderPrice"));%></td><%
                    %><td>
                        <div>
              
                    <%out.println(rs.getString("OrderQuantity"));%>
               
                   
                   </div>
                    </td>
                    <td><%out.println(P*Q);%></td>
                   
                 <form action="RemoveFromCart" method="POST">
                    
                     <input type="hidden" name="orderID" value="<%out.println(rs.getString("OrderID"));%>">
                      
                   
               <%
               %><td><button type="submit">Remove</button></td>
                   
                   </form>     
                    
                </tr><%
                  
                }
            %>
            
            </table>
            <form action="BuyProducts" method="POST">
                  
                <label>Total</label>  
               <%out.println(AllTotal);%><button type="submit">Buy</button>
                   
                   </form>     
            <br><br>
            
            <%
              //out.println(i);  
        }
        catch(Exception er){
            out.println("Connection Failed" +er.getMessage());
        }
    %>
    </body>
</html>
