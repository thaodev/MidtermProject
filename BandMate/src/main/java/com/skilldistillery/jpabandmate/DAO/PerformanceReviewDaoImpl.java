package com.skilldistillery.jpabandmate.DAO;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpabandmate.entities.PerformanceReview;
import com.skilldistillery.jpabandmate.entities.PerformanceReviewId;

@Service
@Transactional
public class PerformanceReviewDaoImpl implements PerformanceReviewDAO {

	 
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public PerformanceReview getPerformanceReviewById(int userId, int performanceId) {
		PerformanceReviewId pr = new PerformanceReviewId(userId, performanceId);
		return em.find(PerformanceReview.class, pr);
	}
}
