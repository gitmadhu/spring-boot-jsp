package com.javacodegeeks.examples.controller;

import java.util.Optional;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.javacodegeeks.examples.model.CityRepository;
import com.javacodegeeks.examples.model.Note;
import com.javacodegeeks.examples.model.NoteRepository;
import com.javacodegeeks.examples.model.Tag;
import com.javacodegeeks.examples.model.TagRepocitory;
import com.javacodegeeks.examples.model.User;
import com.javacodegeeks.examples.model.UserRepository;
import com.javacodegeeks.examples.service.NotesService;
import com.javacodegeeks.examples.service.ReadTodoFileService;

@Controller
public class MainController {
	
	@Autowired
	private CityRepository cityRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private NoteRepository noteRepository;
	
	@Autowired
	private TagRepocitory tagRepocitory;
	
	@Resource(name="dbNotesService")
	private NotesService notesService;
	
	
	static {
		ReadTodoFileService.readNotesFromFile();
	}
	
	
	@RequestMapping(value = "/load-notes", method = RequestMethod.POST)
    public String loadNotes(Model model, RedirectAttributes redirectAttrs) {
		ReadTodoFileService.readNotesFromFile();
		
		//since tag is not dependent on Note(i.e. no cascade set) tag should be persisted first
		for(Tag tag: ReadTodoFileService.getAllTags()){
			tagRepocitory.save(tag);
		}
		
		for(Note note: ReadTodoFileService.getNotes()){
			noteRepository.save(note);
		}
		redirectAttrs.addFlashAttribute("message", "Imported "+ReadTodoFileService.getNotes().size()+" note(s) successfully");
		return "redirect:/notes";
    }
	
	/*private Note assingTags(Note note) {
		for(Tag tag: note.getTags()){
			tag = entityManager.merge(tag);
		}
		return note;
	}*/

	@RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView getLoginPage(@RequestParam Optional<String> error, Model model) {
		model.addAttribute("userForm",new User());
        return new ModelAndView("login", "error", error);
    }
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView homepage() {
        return new ModelAndView("index");
    }

    
    @RequestMapping(value="/users",method = RequestMethod.GET)
    public String users(Model model){
    	model.addAttribute("users",userRepository.findAll(new Sort("email")));
        return "users";
    }
    
    @RequestMapping(value="/notes",method = RequestMethod.GET)
    public String notes(Model model){
    	model.addAttribute("notes",notesService.getAllNotes());
    	
        return "notes";
    }
    
    @RequestMapping(value="/notes/search",method = RequestMethod.GET)
    public String searchNotesByText(@RequestParam String tag, @RequestParam String text, Model model){
    	
    	if(null != tag && !tag.isEmpty() ){
    		model.addAttribute("notes",notesService.getNotesByTag(tag));
    	}else{
    		model.addAttribute("notes",notesService.searchNotesByText(text));
    	}
    	
    	model.addAttribute("text", text);
    	model.addAttribute("tag", tag);
        return "notes";
    }
    
    @RequestMapping(value="/notes/tag/{tag}",method = RequestMethod.GET)
    public String filterNotesByTag(@PathVariable String tag, Model model){
    	model.addAttribute("notes",notesService.getAllNotesByForTag(tag));
    	model.addAttribute("tag", tag);
        return "notes";
    }
    
    
    @RequestMapping(value="/note/{noteId}",method = RequestMethod.GET)
    public String noteDetails(@PathVariable Long noteId, Model model){
    	model.addAttribute("note",notesService.getNoteById(noteId));
        return "noteDetails";
    }
    
    //this is to test theme leaf
    
    @RequestMapping(value="/cities")
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
