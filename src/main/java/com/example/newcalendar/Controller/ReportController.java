package com.example.newcalendar.Controller;

import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ReportController {

    @RequestMapping(value = "/ReportPage/reportWeekly.jsp" , method = RequestMethod.POST)
    public ModelAndView reportWeeklyPost(HttpServletRequest request , HttpServletResponse response){
        ModelAndView mv = new ModelAndView("/MainPage/mainPage.jsp");
        return mv;
    }
    @RequestMapping(value = "/ReportPage/reportWeekly.jsp" , method = RequestMethod.GET)
    public ModelAndView reportWeeklyGet(HttpServletRequest request , HttpServletResponse response){
        ModelAndView mv = new ModelAndView("/MainPage/mainPage.jsp");
        return mv;
    }
}
