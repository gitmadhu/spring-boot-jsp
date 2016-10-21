package com.javacodegeeks.examples.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import com.javacodegeeks.examples.model.Note;
import com.javacodegeeks.examples.model.Tag;


/**
 * {@link mkyong.com}
 * 
 * @author madhu bonakula
 *
 */
@Service
public class ReadTodoFileService {

	private static Set<Note> notes = new HashSet<>();
	private static Set<Tag> allTags = new HashSet<>(); 

	public static Set<Tag> getAllTags() {
		return allTags;
	}

	public static void setAllTags(Set<Tag> allTags) {
		ReadTodoFileService.allTags = allTags;
	}

	public static Set<Note> getNotes() {
		return notes;
	}

	public static void setNotes(Set<Note> notes) {
		ReadTodoFileService.notes = notes;
	}

	public static void testMain(String[] args) {
		String fileName = "D:\\invenio\\todo\\mJava\\spring\\springboot-angularjs-jsp\\springboot-angularjs\\src\\main\\resources\\m.txt";
		//readNotesFromFile(fileName);
		// notes.forEach(System.out::println);

	}

	public static void readNotesFromFile() {
		
		notes.clear();
		String fileName = "D:\\invenio\\todo\\mJava\\spring\\springboot-angularjs-jsp\\springboot-angularjs\\src\\main\\resources\\m.txt";

		try (Stream<String> stream = Files.lines(Paths.get(fileName))) {
			
			List<String> lines = stream.collect(Collectors.toList());
			
			createNotes(lines);
			

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * TODO: remove
	 */
	protected static void createTags() {
		for(Note note: notes){
			createTagsFromNote(note);
		}
		
	}

	private static Collection<? extends Tag> createTagsFromNote(Note note) {
		// TODO Auto-generated method stub
		String[] words = note.getContent().split(" ");
    	for(String word: words){
    		if(word.startsWith("#") && word.length() > 1){
    			String newTagString = word.substring(word.indexOf("#")+1, word.length());
    			
    			boolean foudTag = false;
    			for(Tag tag: allTags){
    				if(tag.getName().equalsIgnoreCase(newTagString)){
    					foudTag = true;
    					note.addTag(tag);
    					break;
    				}
    			}
    			if(!foudTag){
    				Tag newTag = new Tag(newTagString);
    				note.addTag(newTag);
    				allTags.add(newTag);
    			}
    		}
    	}
		return null;
	}

	private static void createNotes(List<String> lines) {
		// TODO Auto-generated method stub
		
		NoteState noteState = new ReadTodoFileService.NoteState();
		
		for (String line : lines) {
			noteState = createNote(line.trim(), noteState);
		}
		
	}

	private static class NoteState {

		Note note = null;
		boolean hasCode = false;

		public Note getNote() {
			return note;
		}

		public void setNote(Note note) {
			this.note = note;
		}

		public boolean isHasCode() {
			return hasCode;
		}

		public void setHasCode(boolean hasCode) {
			this.hasCode = hasCode;
		}
	}

	private static NoteState createNote(String line, NoteState noteState) {

		preProcess(noteState, line);

		if (null == noteState.getNote()) {
			
			noteState.setHasCode(false);
			noteState.setNote(new Note(line, "madhu", Calendar.getInstance().getTime()));

		}

		if (!line.contains("-----")) {
			Date date = ifLineHasDate(line);
			if(null != date){
				noteState.getNote().setDate(date);
			}else{
				noteState.getNote().addLine(noteState.isHasCode(), line, allTags);
			}
			
		} else {
			addNotes(noteState.getNote().clone());
			noteState.setNote(null);
		}

		postProcess(noteState, line);

		return noteState;
	}

	private static void addNotes(Note newNote) {
		
		notes.add(newNote);
		allTags.addAll(newNote.getTags());
	}

	private static Date ifLineHasDate(String line) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("MMM, dd yyyy");
		try {
			return sdf.parse(line);
		} catch (Exception e) {
			return null;
		}
		
		// TODO Auto-generated method stub
		
	}

	private static void preProcess(NoteState noteState, String line) {
		if (line.trim().startsWith(Note.JAVA_START)) {
			noteState.setHasCode(true);
		}
	}

	private static void postProcess(NoteState noteState, String line) {
		if (line.trim().startsWith(Note.JAVA_END)) {
			noteState.setHasCode(false);
		}
	}

	public static Collection<Note> getNotesByTag(String tag) {
		return notes.stream().filter(note -> note.getTags().contains(new Tag(tag))).collect(Collectors.toList());
	}

	public static Collection<Note> searchNotesByText(String text) {
		// TODO Auto-generated method stub
		notes.stream().filter(note -> note.getContent().toUpperCase().contains(text.toUpperCase())).collect(Collectors.toList());
		return null;
	}
	

}
