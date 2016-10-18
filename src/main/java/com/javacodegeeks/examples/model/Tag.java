package com.javacodegeeks.examples.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class Tag implements Serializable {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	Long id;
	
	@Column
	String name;
	
	@ManyToMany(mappedBy = "tags", fetch=FetchType.LAZY)
	Set<Note> notes;
	
	
	@Override
	public String toString() {
		return "Tag [ name=" + name + "]";
	}

	public Tag() {
		// TODO Auto-generated constructor stub
	}
	
	public Tag(String name){
		this.name = name;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	public Set<Note> getNotes() {
		return notes;
	}

	public void setNotes(Set<Note> notes) {
		this.notes = notes;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}