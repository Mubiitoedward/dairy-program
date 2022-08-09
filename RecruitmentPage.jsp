<%-- 
    Document   : RecruitmentPage
    Created on : Aug 2, 2022, 9:53:55 AM
    Author     : ETHEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Recruitment page </title>
    </head>
    <body>
        <h1>STAFF INFORMATION</h1>
        <form method="post" action="Queries">
            <label>First Name:</label>
            <input type="text" name="fname"><br/><br/><!-- this is the staff first name -->
             <label>Last Name:</label>
            <input type="text" name="lname"><br/><br/>
             <label>Email Address:</label>
            <input type="text" name="email"><br/><br/>
             <label>Contact:</label>
            <input type="text" name="contact"><br/><br/>
             <label>Age:</label>
            <input type="text" name="age"><br/><br/>
             <label>Gender:</label>
             <select name="gend" >
                 <option value="Female">F</option> 
                 <option value="Male">M</option>
             </select><br/><br/>
             <label>Product LIne:</label>
             <select name="productline" >
                 <option value="1">1</option> 
                 <option value="2">2</option>
                 <option value="3">3</option>
                 <option value="4">4</option>
                 
             </select>
             
             <br/><br/>
             <input type="submit" name="save "value="RECRUIT">
             <input type="reset" name="reset "value="CLEAR">
             
        </form>
        
        <!-- here we need to get the number of Mid term staff recruited and use it to calculate the number of staff required -->
        
    </body>
</html>
