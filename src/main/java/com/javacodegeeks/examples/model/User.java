package com.javacodegeeks.examples.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class User implements Serializable {
	private static final long serialVersionUID = 1L;


		@Id @GeneratedValue(strategy=GenerationType.AUTO)
	    private Long id;
		
		@Column(nullable = false, unique=true)
		private String email;

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		@Column(nullable = false)
	    private String firstname;

	    @Column(nullable = false)
	    private String password;
	    
	    @Column(nullable = false)
	    private String lastname;

	    public Long getId() {
			return id;
		}

		public void setId(Long email) {
			this.id = email;
		}

		public String getFirstname() {
			return firstname;
		}

		public void setFirstname(String firstname) {
			this.firstname = firstname;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getLastname() {
			return lastname;
		}

		public void setLastname(String lastname) {
			this.lastname = lastname;
		}

}
