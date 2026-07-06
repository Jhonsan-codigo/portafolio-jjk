package com.zonajava.servlets;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexionDB {
    public static Connection getConnection() throws Exception {
        String renderDb = System.getenv("DATABASE_URL");
        if (renderDb != null) {
            Class.forName("org.postgresql.Driver");
            // Forzar jdbc:postgresql://
            String url = "jdbc:postgresql://dpg-d960o89kh4rs73aui54g-a.oregon-postgres.render.com:5432/portafolio_jjk_db?user=portafolio_jjk_db_user&password=46KYo6TcoE4KWkGWr5mxaCIh7sra8rl8&sslmode=require";
            return DriverManager.getConnection(url);
        } else {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/portafolio_jjk", "root", "");
        }
    }
}