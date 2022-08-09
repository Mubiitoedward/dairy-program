
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*, java.util.Date, java.text.SimpleDateFormat" %>
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
                
                
                ResultSet rs = st.executeQuery("Select * from productstable");
                 
            %>
           <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <% while(rs.next()){ %>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem"><%out.println(rs.getString("ProductName"));%></div>
                            <!-- Product image-->
                            <img class="card-img-top" src="./assets/<%rs.getString("Image");%>" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"></h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through"> Shs <%out.println(rs.getString("UnitPrice"));%></span>
                                     <!--<span class="text-muted text-decoration-line-through"> Shs <%//out.println(rs.getString("Image"));%></span>  -->
                                   
                                  
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                               <form action="AddToCart" method="POST">
                                   <label> Quantity(Kgs/Liter)</label>
                                   <select name="quantityorder">
                                       <option value="1">1</option>
                                       <option value="2">2</option>
                                       <option value="3">3</option>
                                       <option value="4">4</option>
                                       <option value="5">5</option>
                                       <option value="6">6</option>
                                       <option value="7">7</option>
                                       <option value="8">8</option>
                                       <option value="9">9</option>
                                       <option value="10">10</option>
                                   </select>
                                <input type="hidden" name="customerID" value="1">
                                <input type="hidden" name="productName" value="<%out.println(rs.getString("ProductName"));%>">
                                <input type="hidden" name="productPrice" value="<%out.println(rs.getString("UnitPrice"));%>">
                                
                                <button type="submit">Add to Cart</button>
                   
                   </form>    
                                
                <form action = "AddLikes" method = "POST"> <button class="like__btn">
                          <input type="hidden" name="productName" value="<%out.println(rs.getString("ProductName"));%>">
                            <input type="hidden" name="Like" value="<%out.println(rs.getString("Likes")+1);%>">
                    <span id="icon"><i class="far fa-thumbs-up"></i></span>
                    <span id="count"><%out.println(rs.getString("Likes"));%></span> Like
                 </button>  </form>
                            </div>
                        </div>
                    </div>
                    <% } %> 
                    
                </div>
            </div>
        </section>
            <br><br>
           
            <a href="FindCart.jsp">Check Out Your Cart</a>
            <%
              //out.println(i);  
        }
        catch(Exception er){
            out.println("Connection Failed" +er.getMessage());
        }
    %>
    <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
