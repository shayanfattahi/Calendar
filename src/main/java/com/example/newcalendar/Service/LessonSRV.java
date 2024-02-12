package com.example.newcalendar.Service;

import com.example.newcalendar.DAO.EventDAO;
import com.example.newcalendar.DAO.LessonDAO;
import com.example.newcalendar.Model.Lesson;

import java.time.Period;
import java.util.*;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class LessonSRV {

    public int insertLesson (Lesson ls){
        return new LessonDAO().insertLesson(ls);
    }

    public List<List<Lesson>> readLesson(int id){
        LessonDAO ldao = new LessonDAO();
        List<Lesson> fri = new ArrayList<>();
        List<List<Lesson>> lss = new ArrayList<>();
        List<Lesson> satA= new ArrayList<>();
        List<Lesson> sunA = new ArrayList<>();
        List<Lesson> monA = new ArrayList<>();
        List<Lesson> tueA = new ArrayList<>();
        List<Lesson> wedA = new ArrayList<>();
        List<Lesson> thrA = new ArrayList<>();


        for ( Lesson ls: ldao.readLessonByIdAndSaturday(id) ) {
            if (ls.getZojFard() == 1){
                satA.add(ls);
            }else if (ls.getZojFard() == 2){
                if (ls.getQuarter() == 1){
                    LocalDate currentDate = LocalDate.now();
                    LocalDate specificDate = LocalDate.of(LocalDate.now().getYear(), 9, 23);
                    Period period = Period.between(specificDate, currentDate);
                    if (((period.getDays() / 7) + 1) %2 != 0){
                        satA.add(ls);
                    }
                }else if (ls.getQuarter() == 2){
                    LocalDate currentDate = LocalDate.now();
                    LocalDate specificDate = LocalDate.of(LocalDate.now().getYear(), 2, 10);
                    Period period = Period.between(specificDate, currentDate);
                    if (((period.getDays() / 7) + 1) %2 != 0){
                        satA.add(ls);
                    }
                }
            }else if (ls.getZojFard() == 3){
                if (ls.getQuarter() == 1){
                    LocalDate currentDate = LocalDate.now();
                    LocalDate specificDate = LocalDate.of(LocalDate.now().getYear(), 9, 23);
                    Period period = Period.between(specificDate, currentDate);
                    if (((period.getDays() / 7) + 1) %2 == 0){
                        satA.add(ls);
                    }
                }else if (ls.getQuarter() == 2){
                    LocalDate currentDate = LocalDate.now();
                    LocalDate specificDate = LocalDate.of(LocalDate.now().getYear(), 2, 10);
                    Period period = Period.between(specificDate, currentDate);
                    if (((period.getDays() / 7) + 1) %2 == 0){
                        satA.add(ls);
                    }
                }
            }
        }
        for ( Lesson ls: ldao.readLessonByIdAndSunday(id)){
            if (ls.getZojFard() == 1){
                sunA.add(ls);
            }else if (ls.getZojFard() == 2){
                if (ls.getQuarter() == 1){
                    LocalDate currentDate = LocalDate.now();
                    LocalDate specificDate = LocalDate.of(LocalDate.now().getYear(), 9, 23);
                    Period period = Period.between(specificDate, currentDate);
                    if (((period.getDays() / 7) + 1) %2 != 0){
                        sunA.add(ls);
                    }
                }else if (ls.getQuarter() == 2){
                    LocalDate currentDate = LocalDate.now();
                    LocalDate specificDate = LocalDate.of(LocalDate.now().getYear(), 2, 10);
                    Period period = Period.between(specificDate, currentDate);
                    if (((period.getDays() / 7) + 1) %2 != 0){
                        sunA.add(ls);
                    }
                }
            }else if (ls.getZojFard() == 3){
                if (ls.getQuarter() == 1){
                    LocalDate currentDate = LocalDate.now();
                    LocalDate specificDate = LocalDate.of(LocalDate.now().getYear(), 9, 23);
                    Period period = Period.between(specificDate, currentDate);
                    if (((period.getDays() / 7) + 1) %2 == 0){
                        sunA.add(ls);
                    }
                }else if (ls.getQuarter() == 2){
                    LocalDate currentDate = LocalDate.now();
                    LocalDate specificDate = LocalDate.of(LocalDate.now().getYear(), 2, 10);
                    Period period = Period.between(specificDate, currentDate);
                    if (((period.getDays() / 7) + 1) %2 == 0){
                        sunA.add(ls);
                    }
                }
            }
        }
        for ( Lesson ls: ldao.readLessonByIdAndmonday(id)) {
            if (ls.getZojFard() == 1){
                monA.add(ls);
            }else if (ls.getZojFard() == 2){
                if (ls.getQuarter() == 1){
                    LocalDate currentDate = LocalDate.now();
                    LocalDate specificDate = LocalDate.of(LocalDate.now().getYear(), 9, 23);
                    Period period = Period.between(specificDate, currentDate);
                    if (((period.getDays() / 7) + 1) %2 != 0){
                        monA.add(ls);
                    }
                }else if (ls.getQuarter() == 2){
                    LocalDate currentDate = LocalDate.now();
                    LocalDate specificDate = LocalDate.of(LocalDate.now().getYear(), 2, 10);
                    Period period = Period.between(specificDate, currentDate);
                    if (((period.getDays() / 7) + 1) %2 != 0){
                        monA.add(ls);
                    }
                }
            }else if (ls.getZojFard() == 3){
                if (ls.getQuarter() == 1){
                    LocalDate currentDate = LocalDate.now();
                    LocalDate specificDate = LocalDate.of(LocalDate.now().getYear(), 9, 23);
                    Period period = Period.between(specificDate, currentDate);
                    if (((period.getDays() / 7) + 1) %2 == 0){
                        monA.add(ls);
                    }
                }else if (ls.getQuarter() == 2){
                    LocalDate currentDate = LocalDate.now();
                    LocalDate specificDate = LocalDate.of(LocalDate.now().getYear(), 2, 10);
                    Period period = Period.between(specificDate, currentDate);
                    if (((period.getDays() / 7) + 1) %2 == 0){
                        monA.add(ls);
                    }
                }
            }
        }
        for ( Lesson ls: ldao.readLessonByIdAndtuesday(id)) {
            if (ls.getZojFard() == 1){
                tueA.add(ls);
            }else if (ls.getZojFard() == 2){
                if (ls.getQuarter() == 1){
                    LocalDate currentDate = LocalDate.now();
                    LocalDate specificDate = LocalDate.of(LocalDate.now().getYear(), 9, 23);
                    Period period = Period.between(specificDate, currentDate);
                    if (((period.getDays() / 7) + 1) %2 != 0){
                        tueA.add(ls);
                    }
                }else if (ls.getQuarter() == 2){
                    LocalDate currentDate = LocalDate.now();
                    LocalDate specificDate = LocalDate.of(LocalDate.now().getYear(), 2, 10);
                    Period period = Period.between(specificDate, currentDate);
                    if (((period.getDays() / 7) + 1) %2 != 0){
                        tueA.add(ls);
                    }
                }
            }else if (ls.getZojFard() == 3){
                if (ls.getQuarter() == 1){
                    LocalDate currentDate = LocalDate.now();
                    LocalDate specificDate = LocalDate.of(LocalDate.now().getYear(), 9, 23);
                    Period period = Period.between(specificDate, currentDate);
                    if (((period.getDays() / 7) + 1) %2 == 0){
                        tueA.add(ls);
                    }
                }else if (ls.getQuarter() == 2){
                    LocalDate currentDate = LocalDate.now();
                    LocalDate specificDate = LocalDate.of(LocalDate.now().getYear(), 2, 10);
                    Period period = Period.between(specificDate, currentDate);
                    if (((period.getDays() / 7) + 1) %2 == 0){
                        tueA.add(ls);
                    }
                }
            }
        }
        for ( Lesson ls: ldao.readLessonByIdAndwednesday(id)) {
            if (ls.getZojFard() == 1){
                wedA.add(ls);
            }else if (ls.getZojFard() == 2){
                if (ls.getQuarter() == 1){
                    LocalDate currentDate = LocalDate.now();
                    LocalDate specificDate = LocalDate.of(LocalDate.now().getYear(), 9, 23);
                    Period period = Period.between(specificDate, currentDate);
                    if (((period.getDays() / 7) + 1) %2 != 0){
                        wedA.add(ls);
                    }
                }else if (ls.getQuarter() == 2){
                    LocalDate currentDate = LocalDate.now();
                    LocalDate specificDate = LocalDate.of(LocalDate.now().getYear(), 2, 10);
                    Period period = Period.between(specificDate, currentDate);
                    if (((period.getDays() / 7) + 1) %2 != 0){
                        wedA.add(ls);
                    }
                }
            }else if (ls.getZojFard() == 3){
                if (ls.getQuarter() == 1){
                    LocalDate currentDate = LocalDate.now();
                    LocalDate specificDate = LocalDate.of(LocalDate.now().getYear(), 9, 23);
                    Period period = Period.between(specificDate, currentDate);
                    if (((period.getDays() / 7) + 1) %2 == 0){
                        wedA.add(ls);
                    }
                }else if (ls.getQuarter() == 2){
                    LocalDate currentDate = LocalDate.now();
                    LocalDate specificDate = LocalDate.of(LocalDate.now().getYear(), 2, 10);
                    Period period = Period.between(specificDate, currentDate);
                    if (((period.getDays() / 7) + 1) %2 == 0){
                        wedA.add(ls);
                    }
                }
            }
        }
        for ( Lesson ls: ldao.readLessonByIdAndthursday(id)) {
            if (ls.getZojFard() == 1){
                thrA.add(ls);
            }else if (ls.getZojFard() == 2){
                if (ls.getQuarter() == 1){
                    LocalDate currentDate = LocalDate.now();
                    LocalDate specificDate = LocalDate.of(LocalDate.now().getYear(), 9, 23);
                    Period period = Period.between(specificDate, currentDate);
                    if (((period.getDays() / 7) + 1) %2 != 0){
                        thrA.add(ls);
                    }
                }else if (ls.getQuarter() == 2){
                    LocalDate currentDate = LocalDate.now();
                    LocalDate specificDate = LocalDate.of(LocalDate.now().getYear(), 2, 10);
                    Period period = Period.between(specificDate, currentDate);
                    if (((period.getDays() / 7) + 1) %2 != 0){
                        thrA.add(ls);
                    }
                }
            }else if (ls.getZojFard() == 3){
                if (ls.getQuarter() == 1){
                    LocalDate currentDate = LocalDate.now();
                    LocalDate specificDate = LocalDate.of(LocalDate.now().getYear(), 9, 23);
                    Period period = Period.between(specificDate, currentDate);
                    if (((period.getDays() / 7) + 1) %2 == 0){
                        thrA.add(ls);
                    }
                }else if (ls.getQuarter() == 2){
                    LocalDate currentDate = LocalDate.now();
                    LocalDate specificDate = LocalDate.of(LocalDate.now().getYear(), 2, 10);
                    Period period = Period.between(specificDate, currentDate);
                    if (((period.getDays() / 7) + 1) %2 == 0){
                        thrA.add(ls);
                    }
                }
            }
        }

//        lss.add(ldao.readLessonByIdAndSaturday(id));
//        lss.add(ldao.readLessonByIdAndSunday(id));
//        lss.add(ldao.readLessonByIdAndmonday(id));
//        lss.add(ldao.readLessonByIdAndtuesday(id));
//        lss.add(ldao.readLessonByIdAndwednesday(id));
//        lss.add(ldao.readLessonByIdAndthursday(id));//
//
        lss.add(satA);
        lss.add(sunA);
        lss.add(monA);
        lss.add(tueA);
        lss.add(wedA);
        lss.add(thrA);
        lss.add(fri);
        return lss;
    }

    public void testKon(){
        LocalDate startDate = LocalDate.of(2024, 1, 1);
        LocalDate endDate = LocalDate.of(2024, 1, 31);

        Map<DayOfWeek, Integer> weekdayCountMap = countWeekdaysInRange(startDate, endDate);

        // Display the results ordered by the day that starts the week
        Map<DayOfWeek, Integer> sortedWeekdayCountMap = new TreeMap<>(weekdayCountMap);

        for (Map.Entry<DayOfWeek, Integer> entry : sortedWeekdayCountMap.entrySet()) {
            System.out.println(entry.getKey() + ": " + entry.getValue() + " occurrences");
        }
    }

    private static Map<DayOfWeek, Integer> countWeekdaysInRange(LocalDate startDate, LocalDate endDate) {
        Map<DayOfWeek, Integer> weekdayCountMap = new HashMap<>();

        LocalDate currentDate = startDate;

        while (!currentDate.isAfter(endDate)) {
            DayOfWeek dayOfWeek = currentDate.getDayOfWeek();

            // Increment the count for the current weekday
            weekdayCountMap.put(dayOfWeek, weekdayCountMap.getOrDefault(dayOfWeek, 0) + 1);

            // Move to the next day
            currentDate = currentDate.plus(1, ChronoUnit.DAYS);
        }

        return weekdayCountMap;
    }

    public int delete(long id) {
        return new LessonDAO().delete(id);
    }
}
