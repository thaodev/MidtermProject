package com.skilldistillery.jpabandmate.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpabandmate.entities.Band;
import com.skilldistillery.jpabandmate.entities.Performance;
import com.skilldistillery.jpabandmate.entities.TicketSale;
import com.skilldistillery.jpabandmate.entities.Venue;

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
	public Performance createPerformance(Performance performance, int bandId, int venueId) {
		Band band = em.find(Band.class, bandId);
		if( band != null) {
			performance.setBand(band);
		}
		Venue venue = em.find(Venue.class, venueId);
		if( venue != null) {
			performance.setVenue(venue);
		}
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
			performanceToEdit.setPerformanceDate(performance.getPerformanceDate());
			performanceToEdit.setName(performance.getName());
			performanceToEdit.setVenue(em.find(Venue.class, performance.getVenue().getId()));
			performanceToEdit.setTicketPrice(performance.getTicketPrice());
			performanceToEdit.setStartTime(performance.getStartTime());
			performanceToEdit.setEndTime(performance.getEndTime());
			
			
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

	@Override
	public Map<Performance, Object[]> findPerformanceByUserId(int userId) {
		List<Performance> allPerformances = findAllPerformance();
		
		Map<Performance, Object[]> performancesByUserId = new HashMap<>();
		for (Performance performance : allPerformances) {
			List<TicketSale> numberOfTickets = new ArrayList<>();
			Object[] items = new Object[2];
			int sum = 0;
			for (TicketSale ticket : performance.getTicketSales()) {
				if (ticket.getUser().getId() == userId) {
					numberOfTickets.add(ticket);
					sum += ticket.getTicketPrice();
				}
				
			}
			items[0] = numberOfTickets.size();
			items[1] = sum;
			performancesByUserId.put(performance, items);
		}
		return performancesByUserId;
	}
	
}
