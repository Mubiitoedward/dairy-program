package com.db;


import java.sql.*;


public class DatabaseConnection {

    public static ResultSet getResultFromSqlQuery(String string) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    //Creating database Connection in java online shopping system
    public  Connection connection;
    public Statement c = null;
    //Creating universal method to open connect will mysql database
    public  Connection getConnections() {
        try {
            //Registering with mysql Driver
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dairy", "root", "");
            c = connection.createStatement();
        } catch (Exception e) {
        System.out.println("connection failed" + e.getMessage());
        }
        return connection;
    }
    //Creating universal method to close connect will mysql database
   /* public static void CloseConnection() {
        if (connection != null) {
            try {
                connection.close();
                connection = null;
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
    //Creating universal method to query for retrieving information
    public static ResultSet getResultFromSqlQuery(String SqlQueryString) {
        //Creating Resultset object
        ResultSet rs = null;
        try {
            //Checking whether the connection is null or null
            if (connection == null) {
                getConnection();
            }
            //Querying the query
            rs = connection.createStatement().executeQuery(SqlQueryString);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return rs;
    }
    //Creating universal method to query for inserting or updating information in mysql database
    public static int insertUpdateFromSqlQuery(String SqlQueryString) {
        int i = 2;
        try {
            //Checking whether the connection is null or null
            if (connection == null) {
                getConnection();
            }
            //Querying the query
            i = connection.createStatement().executeUpdate(SqlQueryString);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return i;
    }
*/}