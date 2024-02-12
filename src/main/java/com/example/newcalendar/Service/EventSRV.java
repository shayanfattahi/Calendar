package com.example.newcalendar.Service;

import com.example.newcalendar.DAO.EventDAO;
import com.example.newcalendar.DAO.StudentDAO;
import com.example.newcalendar.Model.Event;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;
import java.util.List;

public class EventSRV {

    public int insertEvent(Event ev){
        return new EventDAO().insertEvent(ev);
    }


    public List<Event> readEventById(int id){
        return new EventDAO().readEventById(id);
    }
    public List<Event> readEventByIdAndDay(int id){
        return new EventDAO().readEventByIdAndDay(id);
    }


    public int delete(long id) {
        return new EventDAO().delete(id);
    }


    public List<Event> readEventWeekly(int id){
        return new EventDAO().readEventByIdWeekly(id);
    }


    public List<Event> readEventByIdForRange(int id , String start , String end) {
        return new EventDAO().readEventByIdForRange(id, start, end);
    }





    }
