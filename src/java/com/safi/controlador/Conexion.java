package com.safi.controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion implements AutoCloseable {
    private static Connection conn = null;

    public Connection AbrirConexion() throws SQLException, java.sql.SQLException {
        if (conn == null || conn.isClosed()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdsafi?serverTimezone=UTC", "root", "2556229");
            } catch (ClassNotFoundException e) {
                System.out.println("error: " + e.getMessage());
            }
        }
        return conn;
    }

    @Override
    public void close() throws Exception {
        if (conn != null && !conn.isClosed()) {
            conn.close();
        }
    }
}
