package com.javacodegeeks.examples.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface NoteRepository extends JpaRepository<Note, Long> {

	Optional<Note> findAllByCategory(String category);
}
