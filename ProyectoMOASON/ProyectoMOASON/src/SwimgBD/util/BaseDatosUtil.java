package SwimgBD.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseDatosUtil {
    public static Connection creaConexion(){
        try{
            String url = "jdbc:mysql://localhost:3306/via?useLegacyDatetimeCode=false&serverTimezone=America/Lima";
            String user = "root";
            String password = "admin";
            Connection conn = DriverManager.getConnection(url, user, password);
            return conn;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return null;
    }
}
