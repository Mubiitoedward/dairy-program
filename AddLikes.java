
package AddProducts;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class AddLikes extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddLikes</title>"); 
            
            out.println("</head>");
            out.println("<body>");
             String pname = request.getParameter("productName");
             String Like = request.getParameter("Like");
             
             try{
                Class.forName("com.mysql.jdbc.Driver");
                 try{     
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dairyproduction","root","");
                    Statement st= conn.createStatement();
                    st.executeUpdate("update productstable SET Likes = "+Like+" where ProductName = '"+"Ghee"+"'");
                }catch(SQLException es){
                out.println(es.getMessage());
                }
                
            }catch(ClassNotFoundException e){
                out.println(e.getMessage());
            }
             //RequestDispatcher dispatcher=request.getRequestDispatcher("MyCart.jsp");
            //dispatcher.forward(request,response);
            out.println("<h1>Servlet AddLikes at " + request.getContextPath() + "</h1>");
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
