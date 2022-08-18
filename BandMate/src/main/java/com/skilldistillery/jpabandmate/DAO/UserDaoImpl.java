package com.skilldistillery.jpabandmate.DAO;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

@Service
@Transactional
public class UserDaoImpl implements UserDAO{
	
	@PersistenceContext
	private  EntityManager em;

}
