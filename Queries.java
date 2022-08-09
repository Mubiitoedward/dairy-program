
package Group;



import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



public class Queries extends HttpServlet {

    
 @Override
 public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        
        // where to store what has been captured
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        String age = request.getParameter("age");
        String gender = request.getParameter("gend");
        int line = Integer.parseInt(request.getParameter("productline"));
        
        
       try{ 
           DBConnection conn = new DBConnection();
        Statement s = conn.getConnection();
        s.executeUpdate("insert into staff(first_name,last_name,Email,Contact,Age,Gender,Product_Line) values ('"+fname+"','"+lname+"','"+email+"','"+contact+"','"+age+"','"+gender+"', '"+line+"')");
         response.sendRedirect("RecruitmentPage.jsp");
       }catch(ClassNotFoundException | SQLException e ){
           out.println("Error got " + e.getMessage());
       }
                
        }
    }


