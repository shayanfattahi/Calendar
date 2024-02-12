package com.example.newcalendar.DAO;

import com.example.newcalendar.Connection.DataBaseConnection;
import com.example.newcalendar.Model.Student;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentDAO {

    public int insertStudent (Student stu){
        String query = "INSERT INTO STUDENT (username , password , email) values (? , ? , ?)";
        try {
            PreparedStatement preparedStatement = DataBaseConnection.getInstance().prepareStatement(query);
            preparedStatement.setString(1, stu.getUserName());
            preparedStatement.setString(2, stu.getPassword());
            preparedStatement.setString(3, stu.getEmail());
            preparedStatement.execute();
            preparedStatement.close();
            return 2;

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public int isExist(String username){
        int res = 0;
        String query = "select email from student where email = ?";
        try {
            PreparedStatement preparedStatement =  DataBaseConnection.getInstance().prepareStatement(query);
            preparedStatement.setString(1, username);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                  if (username.equals(rs.getString("email"))){
                      res= 1;
                  }else
                      res= 0;
            }
            preparedStatement.close();
        } catch (Exception e) {
            System.out.println("this username do not found");
            e.printStackTrace();

        }
        return res;
    }

    public Student readByUsername(String userName , String password){
        String query = "select * from student where email = ? and password = ?";
        Student stu = new Student();
        try {
            PreparedStatement preparedStatement = DataBaseConnection.getInstance().prepareStatement(query);
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                stu.setUserName( rs.getString("username"));
                stu.setPassword( rs.getString("password"));
                stu.setId( rs.getInt("id"));
                stu.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stu;
    }

    public int delete(long id) {
        int res = 0;
        try {
            String query = "delete from student where id = ?";
            PreparedStatement preparedStatement = DataBaseConnection.getInstance().prepareStatement(query);
            preparedStatement.setLong(1, id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            res = 1;

        } catch (Exception e) {
            System.out.println("id not found");
            e.printStackTrace();
        }
        return res;
    }

    public Student readById(int id){
        String query = "select * from student where id = ?";
        Student stu = new Student();
        try {
            PreparedStatement preparedStatement = DataBaseConnection.getInstance().prepareStatement(query);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                stu.setUserName( rs.getString("username"));
                stu.setPassword( rs.getString("password"));
                stu.setId( rs.getInt("id"));
                stu.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stu;
    }
}
