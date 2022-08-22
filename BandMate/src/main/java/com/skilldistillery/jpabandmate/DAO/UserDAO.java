package com.skilldistillery.jpabandmate.DAO;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

import com.skilldistillery.jpabandmate.entities.User;

public interface UserDAO {
	User findById(int userId);
	List<User> findAllUsers();
	User getUserByUserNameAndPassword(String userName, String password);
	User addUser(User user) throws SQLIntegrityConstraintViolationException;
	boolean updateUser(User user);
	boolean deleteUser(int userId);
	
	}
	
	

