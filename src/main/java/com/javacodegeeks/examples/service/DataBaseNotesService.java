package com.javacodegeeks.examples.service;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javacodegeeks.examples.model.Note;
import com.javacodegeeks.examples.model.NoteRepository;
import com.javacodegeeks.examples.model.Tag;
import com.javacodegeeks.examples.model.TagRepocitory;
@Service(value="dbNotesService")
public class DataBaseNotesService implements NotesService {

	@Autowired
	NoteRepository noteRepository;
	
	@Autowired
	TagRepocitory tagRepository;
	
	@Override
	public Collection<Note> getAllNotes() {
		return noteRepository.findAll();
	}
	
	public Collection<Note> getAllNotesByForTag(String tag){
		Optional<Tag> resultTag = tagRepository.findOneByName(tag);
		return resultTag.orElse(new Tag()).getNotes();
		
	}

	@Override
	public Note getNoteById(Long noteId) {
		return noteRepository.findOne(noteId);
	}

	@Override
	public Collection<Note> getNotesByTag(String tag) {
		return getAllNotesByForTag(tag);
	}

	@Override
	public Collection<Note> searchNotesByText(String text) {
		return noteRepository.findAllByContentContainsIgnoreCase(text);
	}

}
