package com.skilldistillery.jpabandmate.DAO;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpabandmate.entities.User;

@Service
@Transactional
public class UserDaoImpl implements UserDAO{
	
	@PersistenceContext
	private  EntityManager em;

	@Override
	public User findById(int userId) {
		return em.find(User.class, userId);
	}

}
