/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Group;

import java.sql.*;

public class DBConnection {
  
    Statement st = null;
    public Statement getConnection() throws SQLException , ClassNotFoundException{
       
           Class.forName("com.mysql.jdbc.Driver");
                
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/groupdb", "root", "");
           st= conn.createStatement();
           
           return st; 
           
    }
}
