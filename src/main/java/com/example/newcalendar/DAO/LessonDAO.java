package com.example.newcalendar.DAO;

import com.example.newcalendar.Connection.DataBaseConnection;
import com.example.newcalendar.Model.Event;
import com.example.newcalendar.Model.Lesson;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LessonDAO {

    public int insertLesson (Lesson ls){
        String query = "INSERT INTO lesson (name ,quarter ,saturday , sunday , monday , tuesday , wednesday , thursday , friday ,start_date_time , start_date_time_fr , end_date_time , end_date_time_fr , student_id , zoj_fard) values (? , ? , ? , ? , ? , ? , ? , ? , ?,? , ? , ? , ? , ? , ?)";
        try {
            PreparedStatement preparedStatement = DataBaseConnection.getInstance().prepareStatement(query);
            preparedStatement.setString(1, ls.getName());
            preparedStatement.setInt(2, ls.getQuarter());
            preparedStatement.setInt(3, ls.getSaturday());
            preparedStatement.setInt(4, ls.getSunday());
            preparedStatement.setInt(5, ls.getMonday());
            preparedStatement.setInt(6, ls.getTuesday());
            preparedStatement.setInt(7, ls.getWednesday());
            preparedStatement.setInt(8, ls.getThursday());
            preparedStatement.setInt(9, ls.getFriday());
            preparedStatement.setString(10, ls.getStartDateTime());
            preparedStatement.setString(11, ls.getStartDateTimeFr());
            preparedStatement.setString(12, ls.getEndDateTime());
            preparedStatement.setString(13, ls.getEndDateTimeFr());
            preparedStatement.setInt(14, ls.getStudentId());
            preparedStatement.setInt(15, ls.getZojFard());

            preparedStatement.execute();
            preparedStatement.close();
            System.out.println("salam");
            return 1;

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public List<Lesson> readLessonByIdAndSaturday(int id){
        String query = "select * from lesson where student_id = ? and saturday = 1";
        List<Lesson> lss = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = DataBaseConnection.getInstance().prepareStatement(query);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Lesson ls = new Lesson();
                ls.setId(rs.getInt("id"));
                ls.setName(rs.getString("name"));
                ls.setStartDateTime(rs.getString("start_date_time"));
                ls.setEndDateTime(rs.getString("end_date_time"));
                ls.setStudentId(rs.getInt("student_id"));
                ls.setZojFard(rs.getInt("zoj_fard"));
                ls.setQuarter(rs.getInt("quarter"));
                lss.add(ls);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lss;
    }
    public List<Lesson> readLessonByIdAndSunday(int id){
        String query = "select * from lesson where student_id = ? and sunday = 1";
        List<Lesson> lss = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = DataBaseConnection.getInstance().prepareStatement(query);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Lesson ls = new Lesson();
                ls.setId(rs.getInt("id"));
                ls.setName(rs.getString("name"));
                ls.setStartDateTime(rs.getString("start_date_time"));
                ls.setEndDateTime(rs.getString("end_date_time"));
                ls.setStudentId(rs.getInt("student_id"));
                ls.setZojFard(rs.getInt("zoj_fard"));
                ls.setQuarter(rs.getInt("quarter"));


                lss.add(ls);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lss;
    }
    public List<Lesson> readLessonByIdAndmonday(int id){
        String query = "select * from lesson where student_id = ? and monday = 1";
        List<Lesson> lss = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = DataBaseConnection.getInstance().prepareStatement(query);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Lesson ls = new Lesson();
                ls.setId(rs.getInt("id"));
                ls.setName(rs.getString("name"));
                ls.setStartDateTime(rs.getString("start_date_time"));
                ls.setEndDateTime(rs.getString("end_date_time"));
                ls.setStudentId(rs.getInt("student_id"));
                ls.setZojFard(rs.getInt("zoj_fard"));
                ls.setQuarter(rs.getInt("quarter"));


                lss.add(ls);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lss;
    }
    public List<Lesson> readLessonByIdAndtuesday(int id){
        String query = "select * from lesson where student_id = ? and tuesday = 1";
        List<Lesson> lss = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = DataBaseConnection.getInstance().prepareStatement(query);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Lesson ls = new Lesson();
                ls.setId(rs.getInt("id"));
                ls.setName(rs.getString("name"));
                ls.setStartDateTime(rs.getString("start_date_time"));
                ls.setEndDateTime(rs.getString("end_date_time"));
                ls.setStudentId(rs.getInt("student_id"));
                ls.setZojFard(rs.getInt("zoj_fard"));
                ls.setQuarter(rs.getInt("quarter"));


                lss.add(ls);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lss;
    }
    public List<Lesson> readLessonByIdAndwednesday(int id){
        String query = "select * from lesson where student_id = ? and wednesday = 1";
        List<Lesson> lss = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = DataBaseConnection.getInstance().prepareStatement(query);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Lesson ls = new Lesson();
                ls.setId(rs.getInt("id"));
                ls.setName(rs.getString("name"));
                ls.setStartDateTime(rs.getString("start_date_time"));
                ls.setEndDateTime(rs.getString("end_date_time"));
                ls.setStudentId(rs.getInt("student_id"));
                ls.setZojFard(rs.getInt("zoj_fard"));
                ls.setQuarter(rs.getInt("quarter"));


                lss.add(ls);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lss;
    }
    public List<Lesson> readLessonByIdAndthursday(int id){
        String query = "select * from lesson where student_id = ? and thursday = 1";
        List<Lesson> lss = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = DataBaseConnection.getInstance().prepareStatement(query);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Lesson ls = new Lesson();
                ls.setId(rs.getInt("id"));
                ls.setName(rs.getString("name"));
                ls.setStartDateTime(rs.getString("start_date_time"));
                ls.setEndDateTime(rs.getString("end_date_time"));
                ls.setStudentId(rs.getInt("student_id"));
                ls.setZojFard(rs.getInt("zoj_fard"));
                ls.setQuarter(rs.getInt("quarter"));


                lss.add(ls);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lss;
    }

    public int delete(long id) {
        int res = 0;
        try {
            String query = "delete from lesson where id = ?";
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

}
