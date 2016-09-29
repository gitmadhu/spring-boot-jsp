package com.javacodegeeks.examples.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.javacodegeeks.examples.model.CityRepository;
import com.javacodegeeks.examples.model.Note;
import com.javacodegeeks.examples.model.NoteRepository;
import com.javacodegeeks.examples.model.User;
import com.javacodegeeks.examples.model.UserRepository;

@Controller
public class MainController {
	
	@Autowired
	private CityRepository cityRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private NoteRepository noteRepository;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView getLoginPage(@RequestParam Optional<String> error, Model model) {
		model.addAttribute("userForm",new User());
        return new ModelAndView("login", "error", error);
    }

    
    @RequestMapping(value="/users",method = RequestMethod.GET)
    public String users(Model model){
    	model.addAttribute("users",userRepository.findAll(new Sort("email")));
        return "users";
    }
    
    @RequestMapping(value="/notes",method = RequestMethod.GET)
    public String notes(Model model){
    	model.addAttribute("notes",noteRepository.findAll(new Sort("date")));
        return "notes";
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
    		return "/login";
    	}
    	userRepository.save(user);
    	return "redirect:/users";
    }
}
