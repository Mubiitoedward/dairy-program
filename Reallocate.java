

package Group;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;


public class Reallocate extends HttpServlet {


    @Override
    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        PrintWriter out = response.getWriter();
String id = request.getParameter("id");
out.println(id);
int prdt = Integer.parseInt(request.getParameter("productline"));
out.println(prdt);

try{

             DBConnection c = new DBConnection();
             Statement s=c.getConnection();
             s.executeUpdate("Update staff SET Product_Line='"+prdt+"'where StaffID='"+id+"'");
             
//             response.sendRedirect("Reallocation.jsp");

}catch( ClassNotFoundException | SQLException e){
out.println(e.getMessage());}
        }
    }

