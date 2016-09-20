package com.javacodegeeks.examples.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

    @RequestMapping(value="/",method = RequestMethod.GET)
    public String homepage(){
    	
        return "index.html";
    }
    
    //this is to test theme leaf
    
    @RequestMapping(value="/test")
    public String hello(Model model){
    	model.addAttribute("hello", "Mr Madhu");
    	return "test2.jsp";
    }
}
