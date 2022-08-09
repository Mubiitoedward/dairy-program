

import com.db.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Authentication extends HttpServlet {

    
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         //PrintWriter out = response.getWriter();
            
         
    
     try{
         
         
          DatabaseConnection db = new DatabaseConnection();
          Connection con = db.getConnections();
          Statement s = con.createStatement();
        
      
                String Name = request.getParameter("name");
                String Pass = request.getParameter("password");
               
             ResultSet r =  s.executeQuery("select Name, Password from customer ");
             boolean auth = false;
            while(r.next()){
                String XY = r.getString("Name");
                String YX = r.getString("Password");
            if(XY.equalsIgnoreCase(Name) && YX.equalsIgnoreCase(Pass)){
                auth = true;
                response.sendRedirect("Cart.jsp");
                break;
                }}
                if(auth == false){
                response.sendRedirect("customerlogin.jsp");
                }

    }   catch (Exception ex) {
            Logger.getLogger(Authentication.class.getName()).log(Level.SEVERE, null, ex);
        }

    

}}
