package com.javacodegeeks.examples.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.Transient;

@Entity
public class Note implements Serializable, Cloneable {
	private static final long serialVersionUID = 1L;
	
	private static final String JAVA_START_CSS = "<pre><code class='language-js'>";
	private static final String JAVA_END_CSS = "</code></pre>";

	public static final String JAVA_START = "@java";
	public static final String JAVA_END = "@endJava";
	

		public Note(String title, String author, Date date){
			this.title = title;
			this.author = author;
			this.date = date;
			this.tags = new HashSet<Tag>();
			this.content = "";
			
		}
		
		public Note(){
			//empty..
		}
		@Id @GeneratedValue(strategy=GenerationType.AUTO)
	    private Long id;
		
		@Column
		private String title;

		@Column
	    private Date date;

		@Column
	    private String author;
	    
	    
		@Lob @Basic(fetch = FetchType.LAZY)
		@Column(length=100000)
	    private String content;
		
		@ManyToMany(fetch=FetchType.LAZY)
	    @JoinTable( name = "nate_tag", joinColumns = @JoinColumn(name = "noteId"), inverseJoinColumns = @JoinColumn(name = "tagId"))
	    private Set<Tag> tags;
	    
	   
		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + ((author == null) ? 0 : author.hashCode());
			result = prime * result + ((date == null) ? 0 : date.hashCode());
			result = prime * result + ((title == null) ? 0 : title.hashCode());
			return result;
		}

		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			Note other = (Note) obj;
			if (author == null) {
				if (other.author != null)
					return false;
			} else if (!author.equals(other.author))
				return false;
			if (date == null) {
				if (other.date != null)
					return false;
			} else if (!date.equals(other.date))
				return false;
			if (title == null) {
				if (other.title != null)
					return false;
			} else if (!title.equals(other.title))
				return false;
			return true;
		}
		@Column
	    private String category;
	    
	    @Override
		public Note clone() {
			try {
				return (Note) super.clone();
			} catch (CloneNotSupportedException e) {
				e.printStackTrace();
			}
			return null;
		}
	    
	    
		public void addLine(boolean hasCode, String line, Set<Tag> allTags) {
			if (line.contains("<")) {
				line = line.replace("<", "&lt;");
			}
			if (hasCode) {

				if (line.contains(JAVA_START)) {
					line = line.replace(JAVA_START, JAVA_START_CSS);
				} else if (line.contains(JAVA_END)) {
					line = line.replace(JAVA_END, JAVA_END_CSS);
				}
				
				content += line+"\n";

			}else{
				content += line+"<br/>";
			}
			
			readTagsFromLine(line, allTags);

		}
	    
	    private void readTagsFromLine(String line, Set<Tag> allTags) {
	    	String[] words = line.split(" ");
	    	for(String word: words){
	    		if(word.startsWith("#") && word.length() > 1){
	    			String newTagString = word.substring(word.indexOf("#")+1, word.length());
	    			boolean foudTag = false;
	    			for(Tag tag: allTags){
	    				if(tag.getName().equalsIgnoreCase(newTagString)){
	    					addTag(tag);
	    					foudTag = true;
	    					break;
	    				}
	    			}
	    			if(!foudTag){
	    				Tag newTag = new Tag(newTagString);
	    				addTag(newTag);
	    				allTags.add(newTag);
	    			}
	    		}
	    	}
		}

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

		public void addTag(Tag tag){
	    	this.tags.add(tag);
	    }

		public Set<Tag> getTags() {
			return tags;
		}

		public void setTags(Set<Tag> tags) {
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
