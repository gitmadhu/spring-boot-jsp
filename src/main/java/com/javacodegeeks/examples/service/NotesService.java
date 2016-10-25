package com.javacodegeeks.examples.service;

import java.util.Collection;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.javacodegeeks.examples.model.Note;

public interface NotesService {

	public Page<Note> getAllNotes(Pageable pageable);
	
	public Collection<Note> getAllNotes();
	
	public Collection<Note> getAllNotesByForTag(String tag);

	public Note getNoteById(Long noteId);

	public Collection<Note> getNotesByTag(String tag);

	public Collection<Note> searchNotesByText(String text);

}
