package com.skilldistillery.jpabandmate.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.jpabandmate.entities.Performance;
import com.skilldistillery.jpabandmate.entities.TicketSale;

@Service
@Transactional
public class TicketDAOImpl implements TicketDAO {
	@PersistenceContext
	private EntityManager em;

	@Autowired
	private PerformanceDAO performDao;

	/*
	 * READ
	 */

	@Override
	public TicketSale findTicketById(int ticketId) {
		return em.find(TicketSale.class, ticketId);
	}

	@Override
	public List<TicketSale> findAllTickets() {
		List<TicketSale> tickets = null;
		String jpql = "SELECT t FROM TicketSale t ";
		tickets = em.createQuery(jpql, TicketSale.class).getResultList();
		if (tickets != null) {
			System.out.println(tickets.size());
			return tickets;
		} else {
			System.out.println("inside findAllTickets method with null list");
			return null;
		}
	}

	@Override
	public Map<Performance, Integer> findTicketSortByEvent() {
		Map<Performance, Integer> ticketByEvent = new HashMap<Performance, Integer>();
		List<Performance> events = performDao.findAllPerformance();
		for (Performance event : events) {
			ticketByEvent.put(event, event.getTicketSales().size());
		}
		return ticketByEvent;

	}

	@Override
	public List<TicketSale> findTicketByEventOrVenue(String search) {

		List<TicketSale> tickets = null;
		String jpql = "SELECT t FROM TicketSale t WHERE t.performance.name LIKE :search OR t.performance.venue.name LIKE :search ";
		tickets = em.createQuery(jpql, TicketSale.class).setParameter("event", "%" + search + "%").getResultList();
		if (tickets != null) {
			System.out.println(tickets);
			return tickets;
		} else {
			return null;
		}
	}
	
	@Override
	public List<TicketSale> findTicketByGivenEvent(int eventId) {
		List<TicketSale> tickets = null;
		String jpql = "SELECT t FROM TicketSale t WHERE t.performance.id = :eventId ";
		tickets = em.createQuery(jpql, TicketSale.class).setParameter("eventId", eventId).getResultList();
		return tickets;
	}

	@Override
	public TicketSale addTicket(TicketSale ticketSale) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * DELETE
	 */
	@Override
	public boolean deleteTicketSale(int ticketId) {
		boolean isDeleted = false;
		TicketSale ticketToDelete = em.find(TicketSale.class, ticketId);

		if (ticketToDelete != null) {
			ticketToDelete.setPerformance(null);
			ticketToDelete.setUser(null);
			isDeleted = !em.contains(ticketToDelete);
		}
		return isDeleted;
	}



}
