package com.skilldistillery.jpabandmate.DAO;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpabandmate.entities.User;

@Service
@Transactional
public class UserDaoImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	

	/*
	 * CREATE 
	 * */
	
	//Add User
	@Override
	public User addUser(User user) {
		// add user to user table 
		em.persist(user);
		if (user.getAddress() != null) {
			em.persist(user.getAddress());
		}
		//update the local user object
		em.flush();
		return user;
	}
	
	/**
	 * READ
	 */
	@Override
	public User getUserByUserNameAndPassword(String userName, String password) {
		List<User> allUsers = findAllUsers();
		User u = null;
		for (User user : allUsers) {
			if (user.getUsername().equals(userName) && user.getPassword().equals(password)) {
				u = user;
				break;
			}
		}
		return u;
	}

	@Override
	public User findById(int userId) {
		return em.find(User.class, userId);
	}

	@Override
	public List<User> findAllUsers() {
		List<User> users = null;
		String jpql = "SELECT u FROM User u";
		users = em.createQuery(jpql, User.class).getResultList();
		if (users != null) {
			System.out.println(users);
			return users;
		} else {
			return null;
		}
	}

	/**
	 * UPDATE
	 */
	
	/**
	 * DELETE
	 */
}
