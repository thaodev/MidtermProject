package com.skilldistillery.jpabandmate.DAO;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpabandmate.entities.Performance;
import com.skilldistillery.jpabandmate.entities.PerformanceReview;
import com.skilldistillery.jpabandmate.entities.PerformanceReviewId;
import com.skilldistillery.jpabandmate.entities.User;

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

	@Override
	public PerformanceReview addReview(PerformanceReview review) {
		review.setPerformance(em.find(Performance.class, review.getPerformance().getId()));
		review.setUser(em.find(User.class, review.getUser().getId()));
		em.persist(review);
//		em.persist(review.getId().getUserId());
//		em.persist(review.getId().getPerformanceId());
		
		em.flush();
		return review;
	}
}
