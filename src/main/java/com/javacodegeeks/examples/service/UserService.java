package com.javacodegeeks.examples.service;

import java.util.Collection;
import java.util.Optional;

import com.javacodegeeks.examples.model.User;

public interface UserService {
	
	 Optional<User> getUserById(long id);

	    Optional<User> getUserByEmail(String email);

	    Collection<User> getAllUsers();

	    User create(User user);

}
