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


public class Registration extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<head>");
            out.println("<meta charset=\"UTF-8\">");
            out.println("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">");
            out.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
            out.println("<link rel=\"stylesheet\" href=\"https://pro.fontawesome.com/releases/v5.10.0/css/all.css\" integrity=\"sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p\" crossorigin=\"anonymous\" />");
            out.println("<link rel=\"stylesheet\" href=\"assets/css/login.css\">");
              

            out.println("<title>Servlet Registration</title>");   
            
            out.println("</head>");
            out.println("<body>");
            

            String form="<div class=\"container\">\n" +
"        <div class=\"signin-sign-up\">\n" +

"            <form action=\"/DiaryProducts/SaveUser\" method=\"post\" class=\"sign-up-form\">\n" +
"                <h2 class=\"title\">Sign up</h2>\n" +
"                <div class=\"input-field\">\n" +
"                    <i class=\"fas fa-user\"></i>\n" +
"                    <input type=\"text\" placeholder=\"Username\">\n" +
"                </div>\n" +
"                <div class=\"input-field\">\n" +
"                    <i class=\"fas fa-envelope\"></i>\n" +
"                    <input type=\"email\" placeholder=\"Email\">\n" +
"                </div>\n" +
"                <div class=\"input-field\">\n" +
"                    <i class=\"fas fa-lock\"></i>\n" +
"                    <input type=\"password\" placeholder=\"Password\">\n" +
"                </div>\n" +
"                <input type=\"submit\" value=\"Sign up\" class=\"btn\">\n" +
"                <p>Already have an account? <a href=\"/DiaryProducts/index.jsp\" class=\"account-text\" id=\"sign-in-link\">Login</a></p>\n" +
"\n" +
"            </form>\n" +
"        </div>\n" +
"    </div>";
            
            out.println("<script src=\"assets/css/login.js\"></script>");
            out.println(form);
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
