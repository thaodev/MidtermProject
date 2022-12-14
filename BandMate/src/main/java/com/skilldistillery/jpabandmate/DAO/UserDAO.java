package com.skilldistillery.jpabandmate.DAO;

import java.util.List;

import com.skilldistillery.jpabandmate.entities.User;

public interface UserDAO {

	
	User findById(int userId);
	List<User> findAllUsers();
	List<User> findAllUsers(int pageStart);
	User getUserByUserNameAndPassword(String userName, String password);
	User addUser(User user);
	boolean updateUser(User user);
	boolean deleteUser(int userId);
	List<User> searchUserByName(String keyword);
	
	}
	
	

