package com.skilldistillery.jpabandmate.DAO;

import java.util.List;
import java.util.Map;

import com.skilldistillery.jpabandmate.entities.Performance;

public interface PerformanceDAO {
	Performance getPerformanceById(int id);
	List<Performance> findAllPerformance();
	Performance createPerformance(Performance performance, int bandId, int venueId);
	boolean deletePerformance(int id);
	Performance editPerformance(Performance performance);
	List<Performance> findPerformanceByKeyword(String keyword);
	Map<Performance, Object[]> findPerformanceByUserId(int userId);
	
}
