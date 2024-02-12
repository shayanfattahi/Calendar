package com.example.newcalendar.Service;

import com.example.newcalendar.DAO.StudentDAO;
import com.example.newcalendar.Model.Student;
import org.springframework.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;

public class StudentSRV {

    public int insertStudent(Student student){
        StudentDAO sdoa = new StudentDAO();
        if (sdoa.isExist(student.getEmail()) == 1){
            System.out.println("in user vojood dard");
            return 0;
        }else {
            if (student.getUserName() != null && student.getPassword() != null && student.getEmail() != null){
                return sdoa.insertStudent(student);
            }else
                return 0;
        }
    }

    public Student logIn(Student student){
        Student stu = new StudentDAO().readByUsername(student.getEmail() , student.getPassword());
        System.out.println(stu.getEmail());
        if (stu.getEmail() != null && stu.getPassword() !=null && stu.getUserName() !=null){
            return stu;
        }
        else{
            return null;
        }
    }

    public Student readById(int id){
        return new StudentDAO().readById(id);
    }
}
