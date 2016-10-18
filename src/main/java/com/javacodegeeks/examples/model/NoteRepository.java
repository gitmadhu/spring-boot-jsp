package com.javacodegeeks.examples.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface NoteRepository extends JpaRepository<Note, Long> {

	Optional<Note> findAllByCategory(String category);
	
	 List<Note> findAllByContentContainsIgnoreCase(String text);
	
}
