package com.example.newcalendar.Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseConnection {
    private static Connection connection = null;
    private DataBaseConnection(){}
    public static Connection getInstance() throws SQLException {
        try {
            Class.forName("org.postgresql.Driver");
            if(connection == null){
                connection = DriverManager.getConnection(DbConfig.url , DbConfig.user , DbConfig.password);
            }
            return connection;
        } catch (ClassNotFoundException e) {
            throw  new RuntimeException(e);
        }
    }
}
