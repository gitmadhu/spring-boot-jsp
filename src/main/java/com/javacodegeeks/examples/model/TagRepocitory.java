package com.javacodegeeks.examples.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface TagRepocitory extends JpaRepository<Tag, Long> {

	Optional<Tag> findOneByName(String name);
}
