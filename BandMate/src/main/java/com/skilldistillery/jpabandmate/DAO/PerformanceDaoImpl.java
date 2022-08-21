package com.skilldistillery.jpabandmate.DAO;

import java.util.ArrayList;
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
	
	@Override
	public Performance createPerformance(Performance performance) {
		em.persist(performance);
		return performance;
	}
	
	@Override
	public boolean deletePerformance(int id) {
		Performance performanceToDelete = em.find(Performance.class, id);
		if(performanceToDelete != null) {
			em.remove(performanceToDelete);
			return true;
		}
		return false;
	}
	
	@Override
	public Performance editPerformance(Performance performance) {
		Performance performanceToEdit = em.find(Performance.class, performance.getId());
		if(performanceToEdit != null) {
			performanceToEdit.getPerformanceDate();
			performanceToEdit.getTicketPrice();
			performanceToEdit.getName();
			performanceToEdit.getStartTime();
			performanceToEdit.getEndTime();
			
			
		}
		return performanceToEdit;
	}

	@Override
	public List<Performance> findPerformanceByKeyword(String keyword) {
		List<Performance> performances = new ArrayList<>();
		String jpql = "";
		jpql = "SELECT p FROM Performance p WHERE p.name LIKE :kw";
		performances = em.createQuery(jpql, Performance.class).setParameter("kw", "%" + keyword + "%")
				.getResultList();
		
		return performances;
	}
	
}
