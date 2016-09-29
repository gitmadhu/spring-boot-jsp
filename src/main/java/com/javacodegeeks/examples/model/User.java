package com.javacodegeeks.examples.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
@Entity
public class User implements Serializable {
	private static final long serialVersionUID = 1L;


		public User(String email, String password, String firstname, String lastname){
			this.email = email;
			this.password = password;
			this.firstname = firstname;
			this.lastname = lastname;
			setPasswordHash(password);
		}
		
		public User(){
			//empty..
		}
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
	    
	    @Column(name = "password_hash", nullable = false)
	    private String passwordHash;
	    
		@Column(nullable = false)
	    private String lastname;
	    
	    @NotNull
	    private Role role = Role.USER;

	    public Role getRole() {
			return role;
		}

		public void setRole(Role role) {
			this.role = role;
		}

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
			setPasswordHash(password);
		}

		public String getLastname() {
			return lastname;
		}

		public void setLastname(String lastname) {
			this.lastname = lastname;
		}
		
		 public String getPasswordHash() {
			return passwordHash;
		}

		public void setPasswordHash(String password) {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			this.passwordHash = encoder.encode(password);
		}

}
