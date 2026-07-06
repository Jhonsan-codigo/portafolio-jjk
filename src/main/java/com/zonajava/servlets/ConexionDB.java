package com.zonajava.servlets;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexionDB {
    public static Connection getConnection() throws Exception {
        String renderDb = System.getenv("DATABASE_URL");
        if (renderDb != null) {
            Class.forName("org.postgresql.Driver");
            String url = renderDb.replace("postgres://", "jdbc:postgresql://");
            return DriverManager.getConnection(url);
        } else {
           Connection conn = ConexionDB.getConnection();
            return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/portafolio_jjk", "root", "");
        }
    }
}