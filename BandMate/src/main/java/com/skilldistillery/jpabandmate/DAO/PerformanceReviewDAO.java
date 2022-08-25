package com.skilldistillery.jpabandmate.DAO;

import com.skilldistillery.jpabandmate.entities.PerformanceReview;

public interface PerformanceReviewDAO {

	PerformanceReview getPerformanceReviewById(int userId, int performanceId);
	PerformanceReview addReview(PerformanceReview review);
}
