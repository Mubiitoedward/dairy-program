/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Diary;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;


public class Admin_login extends HttpServlet {

   Connection con = null;
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Admin_login</title>");            
            out.println("</head>");
            out.println("<body>");
             String username= request.getParameter("username");
            String pass = request.getParameter("pass");
          try {
            //Retriving our session
            HttpSession login = request.getSession();

            
                Class.forName("com.mysql.jdbc.Driver");//loading the jdbc driver
                
                //making the connection
                try{
                    con= DriverManager.getConnection("jdbc:mysql://localhost:3306/DiaryProducts","root","");
                    
                    Statement st =con.createStatement();
                   
                    //Querying inside the database
            ResultSet resultset = st.executeQuery("select * from Register where user_name='" + username + "' AND password='" + pass + "'");
            //If all the details are correct
            //out.println("successful");
            if (resultset.next()) {
                
                login.setAttribute("username", resultset.getString("user_name"));
                //Redirecting admin to dashboard 
                //JOptionPane.showMessageDialog(null, "your logged in");
                
               response.sendRedirect("Dashboard.jsp");

            } else {
                //If details are wrong
                String message = "You have enter wrong credentials";
                login.setAttribute("credential", message);
                //Redirecting admin to admin login page
                response.sendRedirect("index.jsp");
                }
                }catch(SQLException e){
                    out.println("the error message for not making a connection is:"+ e.getMessage());
                }
            }catch(ClassNotFoundException e){
                
                out.println("the error for not loading the driver is:"+ e.getMessage());
                
            }
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
