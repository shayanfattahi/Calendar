package com.example.newcalendar.DAO;

import com.example.newcalendar.Connection.DataBaseConnection;
import com.example.newcalendar.Model.Event;
import com.example.newcalendar.Model.Student;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class EventDAO {
    public int insertEvent (Event ev){
        String query = "INSERT INTO event (name , start_time , end_time , day , start_date_time , start_date_time_fr , end_date_time , end_date_time_fr , student_id , description) values ( ? , ? , ? , ? , ? , ? , ? , ? , ? , ?)";
        try {
            PreparedStatement preparedStatement = DataBaseConnection.getInstance().prepareStatement(query);
            preparedStatement.setString(1, ev.getName());
            preparedStatement.setString(2, ev.getStartTime());
            preparedStatement.setString(3, ev.getEndTime());
            preparedStatement.setString(4, ev.getDay());
            preparedStatement.setString(5, ev.getStartDateTime());
            preparedStatement.setString(6, ev.getStartDateTimeFr());
            preparedStatement.setString(7, ev.getEndDateTime());
            preparedStatement.setString(8, ev.getEndDateTimeFr());
            preparedStatement.setInt(9, ev.getStudentId());
            preparedStatement.setString(10, ev.getDescription());

            preparedStatement.execute();
            preparedStatement.close();
            return 1;

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public List<Event> readEventById(int id){
        String query = "select * from event where student_id = ?";
        List<Event> events = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = DataBaseConnection.getInstance().prepareStatement(query);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Event event = new Event();
                event.setId(rs.getInt("id"));
                event.setName(rs.getString("name"));
                event.setStartTime(rs.getString("start_time"));
                event.setEndTime(rs.getString("end_time"));
                event.setStartDateTime(rs.getString("start_date_time"));
                event.setStartDateTimeFr(rs.getString("start_date_time_fr"));
                event.setEndDateTime(rs.getString("end_date_time"));
                event.setEndDateTimeFr(rs.getString("end_date_time_fr"));
                event.setDay(rs.getString("day"));
                event.setStudentId(rs.getInt("student_id"));
                event.setDescription(rs.getString("description"));
                 events.add(event);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return events;
    }

    public List<Event> readEventByIdAndDay(int id){
        String query = "select * from event where student_id = ? and start_date_time_fr = ?";
        List<Event> events = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = DataBaseConnection.getInstance().prepareStatement(query);
            preparedStatement.setInt(1, id);
            preparedStatement.setString(2, String.valueOf(java.time.LocalDate.now()));
            System.out.println(String.valueOf(java.time.LocalDate.now()));
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Event event = new Event();
                event.setId(rs.getInt("id"));
                event.setName(rs.getString("name"));
                event.setStartTime(rs.getString("start_time"));
                event.setEndTime(rs.getString("end_time"));
                event.setStartDateTime(rs.getString("start_date_time"));
                event.setStartDateTimeFr(rs.getString("start_date_time_fr"));
                event.setEndDateTime(rs.getString("end_date_time"));
                event.setEndDateTimeFr(rs.getString("end_date_time_fr"));
                event.setDay(rs.getString("day"));
                event.setStudentId(rs.getInt("student_id"));
                event.setDescription(rs.getString("description"));
                events.add(event);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return events;
    }

    public int delete(long id) {
        int res = 0;
        try {
            String query = "delete from event where id = ?";
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

    public List<Event> readEventByIdWeekly(int id){
        String end = null;
        String start = null;
        int d = 0;
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Format f = new SimpleDateFormat("EEEE");
        String str = f.format(new Date());
        System.out.println(str);
        if (str.equals("Saturday")){
            d = 6;
            start = sdf.format(cal.getTime());
            cal.add(Calendar.DAY_OF_MONTH , 6);
            end = sdf.format(cal.getTime());
        }else if (str.equals("Sunday")){
            d = 5;
            cal.add(Calendar.DAY_OF_MONTH , -1);
            start = sdf.format(cal.getTime());
            cal.add(Calendar.DAY_OF_MONTH , 6);
            end = sdf.format(cal.getTime());
        }else if (str.equals("Monday")){
            d = 4;
            cal.add(Calendar.DAY_OF_MONTH , -2);
            start = sdf.format(cal.getTime());
            cal.add(Calendar.DAY_OF_MONTH , 6);
            end = sdf.format(cal.getTime());
        }else if (str.equals("Tuesday")){
            d = 3;
            cal.add(Calendar.DAY_OF_MONTH , -3);
            start = sdf.format(cal.getTime());
            cal.add(Calendar.DAY_OF_MONTH , 6);
            end = sdf.format(cal.getTime());
        }else if (str.equals("Wednesday")){
            d = 2;
            cal.add(Calendar.DAY_OF_MONTH , -4);
            start = sdf.format(cal.getTime());
            cal.add(Calendar.DAY_OF_MONTH , 6);
            end = sdf.format(cal.getTime());
        }else if (str.equals("Thursday")){
            System.out.println("inajm");
            d = 1;
            cal.add(Calendar.DAY_OF_MONTH , -5);
            start = sdf.format(cal.getTime());
            cal.add(Calendar.DAY_OF_MONTH , 6);
            end = sdf.format(cal.getTime());
        }else if (str.equals("Friday")){
            d = 0;
            cal.add(Calendar.DAY_OF_MONTH , -6);
            start = sdf.format(cal.getTime());
            cal.add(Calendar.DAY_OF_MONTH , 6);
            end = sdf.format(cal.getTime());
        }

        String query = "select * from event where student_id = ? and start_date_time_fr >= ?  and start_date_time_fr <= ?";
        List<Event> events = new ArrayList<>();
        System.out.println("salam");
        System.out.println(start);
        System.out.println(end);
        try {
            PreparedStatement preparedStatement = DataBaseConnection.getInstance().prepareStatement(query);
            preparedStatement.setInt(1, id);
            preparedStatement.setString(2, start);
            preparedStatement.setString(3, end);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Event event = new Event();
                event.setId(rs.getInt("id"));
                event.setName(rs.getString("name"));
                event.setStartTime(rs.getString("start_time"));
                event.setEndTime(rs.getString("end_time"));
                event.setStartDateTime(rs.getString("start_date_time"));
                event.setStartDateTimeFr(rs.getString("start_date_time_fr"));
                event.setEndDateTime(rs.getString("end_date_time"));
                event.setEndDateTimeFr(rs.getString("end_date_time_fr"));
                event.setDay(rs.getString("day"));
                event.setStudentId(rs.getInt("student_id"));
                event.setDescription(rs.getString("description"));
                events.add(event);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return events;
    }


    public List<Event> readEventByIdForRange(int id , String start , String end){
        String query = "select * from event where student_id = ? and start_date_time >= ?  and start_date_time <= ?";
        List<Event> events = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = DataBaseConnection.getInstance().prepareStatement(query);
            preparedStatement.setInt(1, id);
            preparedStatement.setString(2, start);
            preparedStatement.setString(3, end);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Event event = new Event();
                event.setId(rs.getInt("id"));
                event.setName(rs.getString("name"));
                event.setStartTime(rs.getString("start_time"));
                event.setEndTime(rs.getString("end_time"));
                event.setStartDateTime(rs.getString("start_date_time"));
                event.setStartDateTimeFr(rs.getString("start_date_time_fr"));
                event.setEndDateTime(rs.getString("end_date_time"));
                event.setEndDateTimeFr(rs.getString("end_date_time_fr"));
                event.setDay(rs.getString("day"));
                event.setStudentId(rs.getInt("student_id"));
                event.setDescription(rs.getString("description"));
                events.add(event);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return events;
    }

}
