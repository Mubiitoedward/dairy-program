package dairy;

import java.io.IOException;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.db.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/CustomerLogin")
public class CustomerLogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Getting all data from user/customer
        //Creating Session
        String username = request.getParameter("username");
        String password = request.getParameter("password");
         
        HttpSession hs = request.getSession();
        
        try {
            
            //Creating Resultset
            ResultSet resultset = null;
            //Query to check Login Details
            DatabaseConnection db = new DatabaseConnection();
            Connection con = db.getConnections();
            
            String sql= "select * from customer where username= ? and password=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            
            resultset = pstmt.executeQuery();
            //Checking whether the details of user are null or not
            if (username != null && password != null) {
                
                
               
                if (resultset.next()) {
                    //Storing the login details in session
                    hs.setAttribute("userid", resultset.getInt("userid"));
                    hs.setAttribute("fullname", resultset.getString("fullname"));
                    //Redirecting response to the index.jsp
                    response.sendRedirect("index.jsp");
                } else {
                    //If wrong credentials are entered in java online shopping system
                    String message = "You have enter wrong credentials";
                    hs.setAttribute("credential", message);
                    //Redirecting response to the customerLogin.jsp
                    response.sendRedirect("customerLogin.jsp");
                }
            } else {
                //If username or password is empty or null
                String message = "User name or Password is null";
                hs.setAttribute("credential", message);
                //Redirecting response to the customerLogin.jsp
                response.sendRedirect("customerLogin.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

