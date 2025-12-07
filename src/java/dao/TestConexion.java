package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class TestConexion {
    public static void main(String[] args) {
        System.out.println("=== Probando conexión a MySQL ===");

        try {
            Connection conn = conexionLib.conectarnosBD();
            System.out.println("✓ Conexión exitosa a la base de datos!");

            Statement stmt = conn.createStatement();

            // Probar consulta a tipovehi
            System.out.println("\n--- Tipos de Vehículo ---");
            ResultSet rs1 = stmt.executeQuery("SELECT * FROM tipovehi");
            while (rs1.next()) {
                System.out.println("ID: " + rs1.getInt("IdTv") + " - Nombre: " + rs1.getString("nomTv"));
            }
            rs1.close();

            // Probar consulta a vehiculo
            System.out.println("\n--- Vehículos ---");
            ResultSet rs2 = stmt.executeQuery("SELECT * FROM vehiculo");
            while (rs2.next()) {
                System.out.println("Placa: " + rs2.getString("placa") +
                        " - Marca: " + rs2.getString("marca") +
                        " - Modelo: " + rs2.getString("modelo"));
            }
            rs2.close();

            stmt.close();
            conn.close();

            System.out.println("\n✓ Todas las pruebas completadas exitosamente!");

        } catch (Exception e) {
            System.err.println("✗ Error al conectar:");
            e.printStackTrace();
        }
    }
}
