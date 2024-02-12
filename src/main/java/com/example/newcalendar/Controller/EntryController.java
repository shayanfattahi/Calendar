package com.example.newcalendar.Controller;

import jakarta.servlet.http.HttpServletResponse;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EntryController {


    @RequestMapping(value = "/firstPage/LogIn.jsp" , method = RequestMethod.POST)
    public ModelAndView firstPagePost(HttpRequest request , HttpServletResponse response){
        ModelAndView mv = new ModelAndView("/firstPage/LogIn.jsp");
        mv.addObject("salam" , "salam");
        String shayan  = "shayan";
        mv.addObject("name" , shayan);
        return mv;
    }
    @RequestMapping(value = "/firstPage/LogIn" , method = RequestMethod.GET)
    public ModelAndView firstPageGet(HttpRequest request , HttpServletResponse response){
        ModelAndView mv = new ModelAndView("/firstPage/LogIn.jsp");
        mv.addObject("name" , "shayan");
        return mv;
    }
}
