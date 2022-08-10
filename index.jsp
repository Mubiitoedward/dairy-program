<%-- 
    Document   : index
    Created on : Aug 7, 2022, 1:25:16 PM
    Author     : MR. DEE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*, java.util.Date, java.text.SimpleDateFormat" %>

<%    

  
            
            
       

%>


<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Cake Template">
    <meta name="keywords" content="Cake, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Dairy Products</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap"
    rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__cart">
            <div class="offcanvas__cart__links">
                <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
                <a href="#"><img src="img/icon/heart.png" alt=""></a>
            </div>
            <div class="offcanvas__cart__item">
                <a href="#"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
                <div class="cart__price">Cart: <span>
                                                   
                    </span></div>
            </div>
        </div>
        <div class="">
            <a href="./index.html"><img src="img/logo.jpg" alt=""></a>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__option">
           
        </div>
    </div>
    <!-- Offcanvas Menu End -->

    <!-- Header Section Begin -->
    <header class="header">
        <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-6 col-sm-6">
                    <div class="breadcrumb__text text-center" style="background-color:#1c7430 " >
                        <h2 style = "color: #fff">Fresh Dairy For You</h2>
                    </div>
                     <div class="">
                    <div class="breadcrumb__links">
                        <a style = "color: #fff" href="./index.html">Home</a>
                        <span>Fresh Dairy For You</span>
                    </div>
                </div>
                </div>
               <div class="header__top__left">
                                <ul>
                                   
                                    <li style = "color: #fff">Logout<span  style = "color: #fff" class="arrow_carrot-down"></span>
                                        <ul>
                                            <li></li>
                                           
<!--                                        </ul>
                                    </li>
                                    <li><a style = "color: #fff" href="#">Sign in</a> <span  style = "color: #fff" class="arrow_carrot-down"></span></li>
                                </ul>-->
                            </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="header__top__inner">
                           
                            
                            
<!--                         renoved log in  -->
                            
                            
                            <div class="header__logo">
                                <a href="./index.html"><img src="img/logo.png" alt=""></a>
                            </div>
                            <div class="header__top__right">
                                <div class="header__top__right__links">
                                    <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
                                    <a href="#"><img src="img/icon/heart.png" alt=""></a>
                                </div>
                                <div class="header__top__right__cart">
                                    <a href="shoppingcart.jsp"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
                                    <div class="cart__price">Cart: <span>
                                         <%
        
       try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dairyproduction","root","");
            String CustomerID="1";
             Statement st= conn.createStatement();
                
                
                ResultSet rs1 = st.executeQuery("select count(OrderID)from cart where CustomerID='"+CustomerID+"'");
            
                
                while(rs1.next()){
                 int count = rs1.getInt(1);
                 out.println(count);
                                                        }
                %>
                                        </span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="canvas__open"><i class="fa fa-bars"></i></div>
            </div>
        </div>
        <!-- <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li><a href="./index.html">Home</a></li>
                            <li><a href="./about.html">About</a></li>
                            <li class="active"><a href="./shop.html">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="dropdown">
                                    <li><a href="./shop-details.html">Shop Details</a></li>
                                    <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                                    <li><a href="./checkout.html">Check Out</a></li>
                                    <li><a href="./wisslist.html">Wisslist</a></li>
                                    <li><a href="./Class.html">Class</a></li>
                                    <li><a href="./blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="./blog.html">Blog</a></li>
                            <li><a href="./contact.html">Contact</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div> -->
    </header>
    <!-- Header Section End -->

    

    <!-- Shop Section Begin -->
    <section class="shop spad">
        <div class="container">
            <div class="shop__option">
                <div class="row">
                    <div class="col-lg-7 col-md-7">
                        <div class="shop__option__search">
                            <form action="#">
                                <select>
                                    <option value="">Categories</option>
                                    <option value="">Milk Powder</option>
                                    <option value="">Ice Cream</option>
                                    <option value=""> Ghee Varieties</option>
                                     <option value=""> Yogurt Varieties</option>
                                </select>
                                <input type="text" placeholder="Search">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                    </div>
<!--                    <div class="col-lg-5 col-md-5">
                        <div class="shop__option__right">
                            <select>
                                <option value="">Default sorting</option>
                                <option value="">A to Z</option>
                                <option value="">1 - 8</option>
                                <option value="">Name</option>
                            </select>
                            <a href="#"><i class="fa fa-list"></i></a>
                            <a href="#"><i class="fa fa-reorder"></i></a>
                        </div>
                    </div>-->
                </div>
            </div>
            <div class="row">
           <% 
        
                
                   ResultSet rs = st.executeQuery("select*from productstable");
                  
          
       
               while(rs.next()){ %>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/<%out.println(rs.getString("Image"));%>">
                            <div class="product__label">
                                <span><%out.println(rs.getString("ProductName"));%></span>
                            </div>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#"><%out.println(rs.getString("Description"));%></a></h6>
                            <div class="product__item__price">shs <%out.println(rs.getString("UnitPrice"));%></div>
                             <div class="product__item__price"><%out.println(rs.getString("Likes"));%> likes</div>
                            <div class="cart_add">
                                <form action="AddToCart" method="POST">
                               
                                <input type="hidden" name="productName" value="<%out.println(rs.getString("ProductName"));%>">
                                <input type="hidden" name="productPrice" value="<%out.println(rs.getString("UnitPrice"));%>">
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
                                <button type="submit " class="">Add to Cart</button>
                   
                                </form>
                                <form action="index.jsp" method="POST">
                                <input type="hidden" name="productName" value="<%out.println(rs.getString("ProductName"));%>">
                                <input type="hidden" name="like" value="<%out.println(rs.getInt("likes")+1);%>">
                                <input type="hidden" name="likettz" value="<%out.println(rs.getInt("likes"));%>">
                                <button type="submit"  class="">Like</button>
                            </form>
                            </div>
                             
                              

                           
                        </div>
                    </div>
                </div>
                <% }  }
        catch(Exception er){
            out.println("Connection Failed" +er.getMessage());
        }%> 
            <!--start Of Ice cream section-->

            <h2 class="text-center">Would You Like To Buy?</h2>

            
<!--                
                
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/strawbelly.jpg">
                            <div class="product__label">
                                <span>Coconut</span>
                            </div>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Range Of Amounts</a></h6>
                            <div class="product__item__price">20000.shs</div>
                            <div class="cart_add">
                                <a href="#"><i class="fas fa fa-shopping-cart"></i> to cart</a>
                            </div>
                        </div>
                    </div>
                
                </div>
                
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/ccc.jpg">
                            <div class="product__label">
                                <span>Chocolate combo</span>
                            </div>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Range Of Amounts</a></h6>
                            <div class="product__item__price">17000.shs</div>
                            <div class="cart_add">
                                <a href="#"><i class="fas fa fa-shopping-cart"></i> to cart</a>
                            </div>
                        </div>
                    </div>
                
                </div>
                
                
                 <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/coconut.jpg">
                            <div class="product__label">
                                <span>Straw berry combo</span>
                            </div>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Range Of Amounts</a></h6>
                            <div class="product__item__price">15000.shs</div>
                            <div class="cart_add">
                                <a href="#"><i class="fas fa fa-shopping-cart"></i> to cart</a>
                            </div>
                        </div>
                    </div>
                
                </div>
                
                
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/vanillaflavor.jpg">
                            <div class="product__label">
                                <span>Vanilla combo</span>
                            </div>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Range in amounts</a></h6>
                            <div class="product__item__price">12000.shs</div>
                            <div class="cart_add">
                                <a href="#"><i class="fas fa fa-shopping-cart"></i> to cart</a>
                            </div>
                        </div>
                    </div>
                    End Of Ice cream section
                    
                    
                    start Ghee section
                </div>
                
                <div style="align-content: center">
                         
                     <h2 class="text-center">Ghee Products</h2>
                         
                     
                 <div class="row">
                     
                
                 <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/ghee1.jpg">
                            <div class="product__label">
                                <span>Pure Ghee</span>
                            </div>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Range Of Amounts</a></h6>
                            <div class="product__item__price">34000.shs</div>
                            <div class="cart_add">
                                <a href="#"><i class="fas fa fa-shopping-cart"></i> to cart</a>
                            </div>
                        </div>
                    </div>
                    
                    
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/ghee4.jpg">
                            <div class="product__label">
                                <span>English Ghee</span>
                            </div>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Range In Amounts</a></h6>
                            <div class="product__item__price">36000.shs</div>
                            <div class="cart_add">
                                <a href="#"><i class="fas fa fa-shopping-cart"></i> to cart</a>
                            </div>
                        </div>
                    </div>
                    
                    
                </div>
                
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/Ghee3.jpg">
                            <div class="product__label">
                                <span>Pure Ghee</span>
                            </div>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Range Of Amounts</a></h6>
                            <div class="product__item__price">34000.shs</div>
                            <div class="cart_add">
                                <a href="#"><i class="fas fa fa-shopping-cart"></i> to cart</a>
                            </div>
                        </div>
                    </div>
                
                
               
               
               
            </div>
                 
                 
                 <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/ghee2.jpg">
                            <div class="product__label">
                                <span>Pure Ghee</span>
                            </div>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Range Of Amounts</a></h6>
                            <div class="product__item__price">34000.shs</div>
                            <div class="cart_add">
                                <a href="#"><i class="fas fa fa-shopping-cart"></i> to cart</a>
                            </div>
                        </div>
                    </div>
                
                
               
               
               
            </div>

             end ghee section

                 start Powdered milk and yogurt section
                </div>
                
                <div style="align-content: center">
                         
                     <h2 class="text-center">Yogurt And Powdered Milk Section</h2>
                         
                     
                 <div class="row">
                     
                
                 <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/vanillayogat.jpg">
                            <div class="product__label">
                                <span>Vanilla Flavor</span>
                            </div>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Range Of Amounts</a></h6>
                            <div class="product__item__price">34000.shs</div>
                            <div class="cart_add">
                                <a href="#"><i class="fas fa fa-shopping-cart"></i> to cart</a>
                            </div>
                        </div>
                    </div>
                    
                    
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/plainyogat.png">
                            <div class="product__label">
                                <span>Plain Yogurt</span>
                            </div>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Range In Amounts</a></h6>
                            <div class="product__item__price">36000.shs</div>
                            <div class="cart_add">
                                <a href="#"><i class="fas fa fa-shopping-cart"></i> to cart</a>
                            </div>
                        </div>
                    </div>
                    
                    
                </div>
                
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/strawberryyoghurt.jpg">
                            <div class="product__label">
                                <span>Strawberry Yogurt</span>
                            </div>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Range Of Amounts</a></h6>
                            <div class="product__item__price">34000.shs</div>
                            <div class="cart_add">
                                <a href="#"><i class="fas fa fa-shopping-cart"></i> to cart</a>
                            </div>
                        </div>
                    </div>
                
                
               
               
               
            </div>
                 
                 
                 <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/MILK.jpg">
                            <div class="product__label">
                                <span>Powdered Milk Products</span>
                            </div>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Range Of Amounts</a></h6>
                            <div class="product__item__price">34000.shs</div>
                            <div class="cart_add">
                                <a href="#"><i class="fas fa fa-shopping-cart"></i> to cart</a>
                            </div>
                        </div>
                    </div>
                
                
               
               
               
            </div>

             end Milk and Yogurt section

             
             
            <div class="shop__last__option">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="shop__pagination">
                            <a href="#">1</a>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#"><span class="arrow_carrot-right"></span></a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="shop__last__text">
                       <p>Showing 1-9 of 10 results</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
     Shop Section End 

     Footer Section Begin 
    
    
    <footer class="footer set-bg" data-setbg="img/logo.jpg ">
        <div  class="container" style="background-color:#1c7430">
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="footer__widget">
                        <h6>WORKING HOURS</h6>
                        <ul>
                            <li>Monday - Friday: 08:00 am – 08:30 pm</li>
                            <li>Saturday: 10:00 am – 16:30 pm</li>
                            <li>Sunday: 10:00 am – 16:30 pm</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__logo">
                            <a href="#"><img src="img/footer-logo.png" alt=""></a>
                        </div>
                        <p>Lorem ipsum dolor amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                        labore dolore magna aliqua.</p>
                        <div class="footer__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-youtube-play"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="footer__newslatter">
                        <h6>Subscribe</h6>
                        <p>Get latest updates and offers.</p>
                        <form action="#">
                            <input type="text" placeholder="Email">
                            <button type="submit"><i class="fa fa-send-o"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7">
                        <p class="copyright__text text-white"> Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. 
                          Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This System is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Group 31</a>
                           Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. 
                      </p>
                  </div>
                  <div class="col-lg-5">
                    <div class="copyright__widget">
                        <ul>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Terms & Conditions</a></li>
                            <li><a href="#">Site Map</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
 Footer Section End 

 Search Begin 
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch">+</div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>-->
<!-- Search End -->

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery.barfiller.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.nicescroll.min.js"></script>
<script src="js/main.js"></script>
</body>

</html>