/* ****************************************************
 * 
 * CONFIGURACION GLOBAL DE CONEXION A LA BASE DE DATOS
 * 
 * ****************************************************
 */

package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Laharys Lobo
 */
public class Database {
    public static Connection connect() throws SQLException, ClassNotFoundException {

        /*
         * Nueva implementacion en proceso 
         * //*****Datos de conexion a la Base de Datos (BD)*****
         * 
         * //Direccion de la BD String 
         * host = "database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com";
         * 
         * //Puerto de la BD String 
         * port = "1433";
         * 
         * //Nombre de la BD String 
         * DBName = "BancOcci";
         * 
         * //Usuario y Contrasenia de conexion a la BD 
         * String user = "admin"; 
         * String password = "system123";
         * system123
         * 
         * //**************************************************
         * 
         * //*********Ajustes de Driver de conexion************
         * 
         * //Registrar driver necesario para versiones viejas de JDK (Opcional)
         * Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
         * 
         * //Prefijo de tipo de BD a utilizar segun driver 
         * String prefix = "jdbc:sqlserver";
         * 
         * //**************************************************
         * 
         * String database = prefix + "://" + host + ":" + port + ";DatabaseName=" +
         * DBName;
         */

        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String database = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
        String user = "admin";
        String password = "system123";

        Connection con = null;

        try {
            con = DriverManager.getConnection(database, user, password);
            if (con == null) {
                System.out.println("Conexion a la BD Fallida!");
            } else {
                System.out.println("Conexion a la BD Exitosa!");
            }
        } catch (SQLException e) {
            System.out.println("Error en Conexion a BD: " + e);
        }

        return con;
    }
}
