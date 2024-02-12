package com.example.newcalendar.Controller;


import com.example.newcalendar.Model.Student;
import com.example.newcalendar.Service.StudentSRV;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class MainPageController {
    @RequestMapping(value = "/MainPage/mainPage.jsp" , method = RequestMethod.POST)
    public ModelAndView mainPagePost(HttpServletRequest request , HttpServletResponse response){
        ModelAndView mv = new ModelAndView("/MainPage/mainPage.jsp");
        return mv;
    }
    @RequestMapping(value = "/MainPage/mainPage.jsp" , method = RequestMethod.GET)
    public ModelAndView mainPageGet(HttpServletRequest request , HttpServletResponse response){
        ModelAndView mv = new ModelAndView("/MainPage/mainPage.jsp");
        return mv;
    }

    @RequestMapping(value = "/MainPage/SignIn.jsp" , method = RequestMethod.POST)
    public ModelAndView signInPost(HttpServletRequest request , HttpServletResponse response){

        ModelAndView mv = new ModelAndView("/MainPage/SignIn.jsp");
        return mv;
    }
    @RequestMapping(value = "/MainPage/SignIn.jsp" , method = RequestMethod.GET)
    public ModelAndView signInGet(HttpServletRequest request , HttpServletResponse response){
        ModelAndView mv = new ModelAndView("/MainPage/SignIn.jsp");
        return mv;
    }

    @RequestMapping(value = "/MainPage/SignUp.jsp" , method = RequestMethod.POST)
    public ModelAndView signUpPost(HttpServletRequest request , HttpServletResponse response){
        ModelAndView mv = new ModelAndView("/MainPage/SignUp.jsp");
        return mv;
    }
    @RequestMapping(value = "/MainPage/SignUp.jsp" , method = RequestMethod.GET)
    public ModelAndView signUpGet(HttpServletRequest request , HttpServletResponse response){
        ModelAndView mv = new ModelAndView("/MainPage/SignUp.jsp");
        return mv;
    }

    @RequestMapping(value = "/MainPage/SignUpActionInsert" , method = RequestMethod.POST)
    public int signUpActionPost(Student student, HttpServletResponse response){
        int res = new StudentSRV().insertStudent(student);
        return res;
    }
}
