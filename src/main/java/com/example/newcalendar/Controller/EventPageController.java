package com.example.newcalendar.Controller;

import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
@Controller
public class EventPageController {

    @RequestMapping(value = "/Event/AddEvent.jsp" , method = RequestMethod.POST)
    public ModelAndView AddEventPost(HttpServletRequest request , HttpServletResponse response){
        ModelAndView mv = new ModelAndView("/Event/AddEvent.jsp");
        return mv;
    }
    @RequestMapping(value = "/Event/AddEvent.jsp" , method = RequestMethod.GET)
    public ModelAndView AddEventGet(HttpServletRequest request , HttpServletResponse response){
        ModelAndView mv = new ModelAndView("/Event/AddEvent.jsp");
        return mv;
    }
}
