package com.javacodegeeks.examples.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class Note implements Serializable {
	private static final long serialVersionUID = 1L;

	

		public Note(String title, String author, Date date, String content){
			this.title = title;
			this.author = author;
			this.date = date;
			this.content = content;
			this.tags = new HashSet<>();
		}
		
		public Note(){
			//empty..
		}
		@Id @GeneratedValue(strategy=GenerationType.AUTO)
	    private Long id;
		
		@Column(nullable = false, unique=true)
		private String title;

		@Column(nullable = false)
	    private Date date;

		@Column(nullable = false)
	    private String author;
	    
	    
		@Column(nullable = false)
	    private String content;
	    
	    @Column
	    @ElementCollection
	    private Set<String> tags;
	    
	    @Column
	    private String category;
	    
	    public Date getDate() {
			return date;
		}

		public void setDate(Date date) {
			this.date = date;
		}
	    
	    public String getCategory() {
			return category;
		}

		public void setCategory(String category) {
			this.category = category;
		}

		public void addTag(String tag){
	    	this.tags.add(tag);
	    }

		public Set<String> getTags() {
			return tags;
		}

		public void setTags(Set<String> tags) {
			this.tags = tags;
		}

		public Long getId() {
			return id;
		}

		public void setId(Long email) {
			this.id = email;
		}


		public String getAuthor() {
			return author;
		}

		public void setAuthor(String password) {
			this.author = password;
		}

		public String getContent() {
			return content;
		}

		public void setContent(String lastname) {
			this.content = lastname;
		}
		
		
		public String getTitle() {
			return title;
		}

		public void setTitle(String email) {
			this.title = email;
		}

}
