package com.javacodegeeks.examples.service;

import java.util.Collection;

import com.javacodegeeks.examples.model.Note;

public interface NotesService {

	public Collection<Note> getAllNotes();
	
	public Collection<Note> getAllNotesByForTag(String tag);

	public Note getNoteById(Long noteId);

	public Collection<Note> getNotesByTag(String tag);

	public Collection<Note> searchNotesByText(String text);

}
