package com.javacodegeeks.examples.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javacodegeeks.examples.model.CityRepository;
import com.javacodegeeks.examples.model.User;
import com.javacodegeeks.examples.model.UserRepository;

@Controller
public class MainController {
	
	@Autowired
	private CityRepository cityRepository;
	
	@Autowired
	private UserRepository userRepository;

    @RequestMapping(value="/",method = RequestMethod.GET)
    public String homepage(Model model){
    	model.addAttribute("userForm",new User());
        return "index";
    }
    
    
    @RequestMapping(value="/users",method = RequestMethod.GET)
    public String users(Model model){
    	model.addAttribute("users",userRepository.findAll());
        return "users";
    }
    
    //this is to test theme leaf
    
    @RequestMapping(value="/test")
    public String hello(Model model){
    	
    	model.addAttribute("cities", cityRepository.findAll());
    	return "test2";
    }
    
    
    @RequestMapping(value="/register",method = RequestMethod.POST)
    public String register(@ModelAttribute("userForm")User user, BindingResult bindingResult, Model model){
    	
    	if(bindingResult.hasErrors()){
    		return "index";
    	}
    	userRepository.save(user);
    	return "redirect:users";
    }
}
