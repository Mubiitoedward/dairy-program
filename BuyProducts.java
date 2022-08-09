/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package AddProducts;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;
/**
 *
 * @author Gilbert
 */
@WebServlet(name = "BuyProducts", urlPatterns = {"/BuyProducts"})
public class BuyProducts extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddToSales</title>");            
            out.println("</head>");
            out.println("<body>");
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                 try{     
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dairyproduction","root","");
                    Statement st= conn.createStatement();
                     ResultSet rs = st.executeQuery("Select * from cart where CustomerID='"+"1"+"'");
                     
                     while(rs.next()){
                         int P = Integer.parseInt(rs.getString("OrderPrice"));
                         int Q = Integer.parseInt(rs.getString("OrderQuantity"));
                         int Total = P*Q;
                         String OID=rs.getString("OrderID");
                         String PName=rs.getString("ProductName");
                         String OQuantity=rs.getString("OrderQuantity");
                         String CID=rs.getString("CustomerID");
                         st.executeUpdate("insert into sales(OrderID,ProductName,OrderQuantity,SalesTotal,CustomerID)values('"+OID+"','"+PName+"','"+OQuantity+"','"+Total+"','"+CID+"')");
                          st.executeUpdate("Delete From cart where OrderID='"+OID+"'");
                     }
                    
                }catch(SQLException es){
                out.println(es.getMessage());
                }
                
            }catch(ClassNotFoundException e){
                out.println(e.getMessage());
            }
            RequestDispatcher dispatcher=request.getRequestDispatcher("FindCart.jsp");
           dispatcher.forward(request,response);
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
