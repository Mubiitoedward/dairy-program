<%-- 
    Document   : landingpage
    Created on : Aug 11, 2022, 6:57:01 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Landing page</title>
        <style>
body {
  background-image: url('assets/images/download.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
}

.did{
    margin: auto;
  width: 50%;
  border: 3px solid orange;
  padding: 10px;
  color:orange;
  position: relative;
  top: 50%;
  width: 100%;
  text-align: center;
  font-size: 40px;
  font-weight: bold;
  font-family: Arial, Helvetica, sans-serif;
}
.button{
    margin: auto;
  width: 50%;
  text-align: center;
  padding: 10px;
  
  position: absolute;
  top: 50%;
  width: 100%;
  text-align: center;
  font-size: 18px;
}
</style>
    </head >
    <body>
        
        <div class="did">
            Dairy Fresh
        </div>
        <div class="button">
          <button name="button" value="Shop Now" class="btn btn-warning" ><a href="Dashboard.jsp">Shop Now</a></button>
         <button name="button" value="Admin Login" class="btn btn-warning"><a href="Dashboard.jsp">Manager Login</a></button>  
        </div>
    </body>
</html>
