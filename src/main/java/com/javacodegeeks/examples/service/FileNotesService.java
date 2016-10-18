package com.javacodegeeks.examples.service;

import java.util.Collection;

import org.springframework.stereotype.Service;

import com.javacodegeeks.examples.model.Note;
@Service
public class FileNotesService implements NotesService {

	@Override
	public Collection<Note> getAllNotes() {
		return ReadTodoFileService.getNotesByTag("more");
	}

	@Override
	public Collection<Note> getAllNotesByForTag(String tag) {
		return ReadTodoFileService.getNotesByTag(tag);
	}

	@Override
	public Note getNoteById(Long noteId) {
		// TODO Auto-generated method stub
		return new Note();
	}

	@Override
	public Collection<Note> getNotesByTag(String tag) {
		return ReadTodoFileService.getNotesByTag(tag);
	}

	@Override
	public Collection<Note> searchNotesByText(String text) {
		return ReadTodoFileService.searchNotesByText(text);
	}

}
