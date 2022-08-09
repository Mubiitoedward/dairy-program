
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

@WebServlet(name = "Quantity", urlPatterns = {"/Quantity"})
public class ProductQuantity extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Quantity</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String pQuant = request.getParameter("quant");
            int Mid = 2*Integer.parseInt(pQuant);
            int Short = 5*Mid;
            String pQuant1 = Integer.toString(Mid);
            String pQuant2 = Integer.toString(Short);
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                 try{     
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dairyproduction","root","");
                    Statement st= conn.createStatement();
                    st.executeUpdate("Update productstable SET ProductQuantity="+pQuant+" where ProductType='"+"Long-term"+"'");
                    st.executeUpdate("Update productstable SET ProductQuantity="+pQuant1+" where ProductType='"+"Mid-term"+"'");
                   st.executeUpdate("Update productstable SET ProductQuantity="+pQuant2+" where ProductType='"+"Short-term"+"'");
                }catch(SQLException es){
                out.println(es.getMessage());
                }
                
            }catch(ClassNotFoundException e){
                out.println(e.getMessage());
            }
            
            RequestDispatcher dispatcher=request.getRequestDispatcher("AddingProducts.jsp");
            dispatcher.forward(request,response);
            //out.println("<h1>Servlet Quantity at " + request.getContextPath() + "</h1>");
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
