package com.javacodegeeks.examples.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class City implements Serializable {
	private static final long serialVersionUID = 1L;

	    @Id
	    @GeneratedValue(strategy=GenerationType.AUTO)
	    private Long id;

		@Column(nullable = false)
	    private String name;

	    @Column(nullable = false)
	    private String country;

	    // ... additional members, often include @OneToMany mappings

	    protected City() {
	        // no-args constructor required by JPA spec
	        // this one is protected since it shouldn't be used directly
	    }

	    public City(String name, String country) {
	        this.name = name;
	        this.country = country;
	    }

	    public String getName() {
	        return this.name;
	    }

	    public String getCountry() {
	        return this.country;
	    }
	    
	    public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

}
