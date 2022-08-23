package com.skilldistillery.jpabandmate.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpabandmate.entities.TicketSale;

@Service
@Transactional
public class TicketDAOImpl implements TicketDAO {
	@PersistenceContext
	private EntityManager em;
	
	/*
	 * READ*/
	@Override
	public List<TicketSale> findAllTickets() {
		List<TicketSale> tickets = null;
		String jpql = "SELECT t FROM Ticket t ";
		tickets = em.createQuery(jpql, TicketSale.class).getResultList();
		if (tickets != null) {
			System.out.println(tickets);
			return tickets;
		} else {
			return null;
		}
	}

	@Override
	public List<TicketSale> findTicketByEvent(int eventId) {
		List<TicketSale> tickets = null;
		String jpql ="SELECT t FROM Ticket t WHERE t.performance.id = :evenId";
		tickets = em.createQuery(jpql, TicketSale.class).setParameter("evenId", eventId).getResultList();
		if (tickets != null) {
			System.out.println(tickets);
			return tickets;
		} else {
			return null;
		}
	}

	@Override
	public List<TicketSale> findTicketByVenue(int venueId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TicketSale addTicket(TicketSale ticketSale) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TicketSale updateTicketSale(TicketSale ticketSale) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteTicketSale(int ticketId) {
		// TODO Auto-generated method stub
		return false;
	}

}
