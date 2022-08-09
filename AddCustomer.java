package dairy;
import com.db.DatabaseConnection;
import com.db.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.sql.Statement;
import java.sql.*;


public class AddCustomer extends HttpServlet {

    
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
         HttpSession hs = request.getSession();
         String username = request.getParameter("username");
         String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String location = request.getParameter("location");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
       
        
         try{
         
          DatabaseConnection db = new DatabaseConnection();
          Connection con = db.getConnections();
          Statement s = con.createStatement();
        
        
        int addCustomer =  s.executeUpdate("insert into customer (username, fullname, email, gender ,location ,password ,phone) values ('"+username+"', '"+fullname+"','"+email+"','"+gender+"','"+location+"','"+password+"','"+phone+"')");
         
       // out.println(addCustomer);//returns an int(row count in most cases).
        
         //If customer registered successfully
            if (addCustomer > 0) {
                response.sendRedirect("customerLogin.jsp");
            } 
        }
         catch(IOException | SQLException e){
        out.println("error:" +e.getMessage());
        }
        
    }

    

}
