package com.skilldistillery.jpabandmate.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpabandmate.entities.Performance;

@Service
@Transactional
public class PerformanceDaoImpl implements PerformanceDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Performance getPerformanceById(int id) {
		return em.find(Performance.class, id);
	}
	
	@Override
	public List<Performance> findAllPerformance(){
		List<Performance> performances = null;
		String jpql = "SELECT p FROM Performance p";
		performances = em.createQuery(jpql, Performance.class).getResultList();
		if(performances != null ) {
			System.out.println(performances);
			return performances;
		} else {
			return null;
		}
	}
	
	public Performance createPerformance(Performance performance) {
		em.persist(performance);
		return performance;
	}
	
	
//	public boolean deletePerformance(Performance performance) {
//		em.remove(performance);
//		return false;
//	}
	
}
