package com.example.newcalendar.Model;

public class Event {
    private int id;
    private String name;
    private String startTime;
    private String endTime;
    private String day;
    private String startDateTime;
    private String startDateTimeFr;
    private String endDateTime;
    private String endDateTimeFr;
    private int studentId;
    private String description;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getStartDateTime() {
        return startDateTime;
    }

    public void setStartDateTime(String startDateTime) {
        this.startDateTime = startDateTime;
    }

    public String getStartDateTimeFr() {
        return startDateTimeFr;
    }

    public void setStartDateTimeFr(String startDateTimeFr) {
        this.startDateTimeFr = startDateTimeFr;
    }

    public String getEndDateTime() {
        return endDateTime;
    }

    public void setEndDateTime(String endDateTime) {
        this.endDateTime = endDateTime;
    }

    public String getEndDateTimeFr() {
        return endDateTimeFr;
    }

    public void setEndDateTimeFr(String endDateTimeFr) {
        this.endDateTimeFr = endDateTimeFr;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
