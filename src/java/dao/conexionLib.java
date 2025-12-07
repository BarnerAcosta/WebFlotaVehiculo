/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author wcastro
 */
public class conexionLib {

    // Configuración para Docker - usa el nombre del servicio definido en
    // docker-compose.yml
    // URL simplificada compatible con mysql-connector-java-5.1.49
    private static final String URL = "jdbc:mysql://mysql:3306/concesionario?autoReconnect=true&useSSL=false";
    private static final String USER = "root";
    private static final String PASS = ""; // Sin contraseña según docker-compose.yml

    static {
        try {
            // Usa el driver antiguo compatible con MySQL 5.7
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBC driver no encontrado", e);
        }
    }

    public static Connection conectarnosBD() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASS);
    }
}