package com.skilldistillery.jpabandmate.DAO;

import java.util.ArrayList;
import java.util.Arrays;
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
import com.skilldistillery.jpabandmate.entities.User;

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
	public Map<Performance, int[]> findTicketSortByEvent() {
		Map<Performance, int[]> ticketByEvent = new HashMap<Performance, int[]>();
		List<Performance> events = performDao.findAllPerformance();
		
		for (Performance event : events) {
			int[] listOfTicketvsCapacity = new int[2];
			listOfTicketvsCapacity[0] = event.getTicketSales().size();
			listOfTicketvsCapacity[1] = event.getVenue().getCapacity();
			
			ticketByEvent.put(event, listOfTicketvsCapacity);
			System.out.println(Arrays.toString(listOfTicketvsCapacity));
		}
		return ticketByEvent;

	}

	@Override
	public List<TicketSale> findTicketByEventOrVenue(String search) {

		List<TicketSale> tickets = null;
		String jpql = "SELECT t FROM TicketSale t WHERE t.performance.name LIKE :search OR t.performance.venue.name LIKE :search ";
		tickets = em.createQuery(jpql, TicketSale.class).setParameter("search", "%" + search + "%").getResultList();
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
	
//	@Override
//	public Map<Performance, Double> findTicketsByUserId(int userId) {
//		List<TicketSale> tickets = null;
//		List<Performance> eventsByUserId = performDao.findPerformanceByUserId(userId);
//		String jpql = "SELECT t FROM TicketSale t WHERE t.user.id = :userId";
//		tickets = em.createQuery(jpql, TicketSale.class).setParameter("userId", userId).getResultList();
//		Map<Performance, Object[]> ticketsByEvent = new HashMap<Performance, Object[]>();
//		for (TicketSale ticket : tickets) {
//			Object[] items = new Object[2];
//			double sum = 0;
//			double price = ticket.getTicketPrice();
//			sum += price;
//			items[0] = ;
//			items[1] = ;
//			ticketsByEvent.put(ticket.getPerformance(), items);
//		}
//		return ticketsByEvent;
//	}

	/*CREATE
	 * */

	@Override
	public TicketSale addTicket(TicketSale ticketSale) {
		ticketSale.getPerformance().addTicket(ticketSale);
		ticketSale.setUser(em.find(User.class, ticketSale.getUser().getId()));
		ticketSale.setTicketPrice(ticketSale.getPerformance().getTicketPrice());
		em.persist(ticketSale);
		if (ticketSale.getUser() != null) { 
			em.persist(ticketSale.getUser());
		}
		
		em.flush();
		return ticketSale;
	}
	
	

	/**
	 * DELETE
	 */
	@Override
	public boolean deleteTicketSale(int ticketId) {
		boolean isDeleted = false;
		TicketSale ticketToDelete = em.find(TicketSale.class, ticketId);
//		ticketToDelete.getPerformance().removeTicket(ticketToDelete);
		
		System.out.println("Inside deleteTicketSale in ticketDAO impl");
		if (ticketToDelete != null) {
//			ticketToDelete.setPerformance(null);
//			ticketToDelete.setUser(null);
			em.remove(ticketToDelete);
			isDeleted = !em.contains(ticketToDelete);
		}
		return isDeleted;
	}




}
