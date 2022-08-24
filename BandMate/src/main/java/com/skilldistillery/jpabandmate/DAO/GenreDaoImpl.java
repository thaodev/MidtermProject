package com.skilldistillery.jpabandmate.DAO;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpabandmate.entities.Genre;


@Service
@Transactional
public class GenreDaoImpl implements GenreDAO {
	
	@PersistenceContext
	private EntityManager em;
	

	
	@Override
	public Genre getGenreById(int id) {
		return em.find(Genre.class, id);
	}
	
	

	

	
}
