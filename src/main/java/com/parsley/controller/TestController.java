package com.parsley.controller;

import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
    @RequestMapping("/test")
    public ModelAndView test(){
        ModelAndView testPage = new ModelAndView("test");
        return testPage;
    }
}
