package com.javacodegeeks.examples.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javacodegeeks.examples.model.CityRepository;

@Controller
public class MainController {
	
	@Autowired
	private CityRepository cityRepository;

    @RequestMapping(value="/",method = RequestMethod.GET)
    public String homepage(){
    	
        return "index";
    }
    
    //this is to test theme leaf
    
    @RequestMapping(value="/test")
    public String hello(Model model){
    	
		System.out.println(cityRepository.findAll());
    	model.addAttribute("hello", "Mr Madhu");
    	return "test2";
    }
}
