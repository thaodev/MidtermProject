package com.skilldistillery.jpabandmate.DAO;

import java.util.List;
import java.util.Map;

import com.skilldistillery.jpabandmate.entities.Performance;
import com.skilldistillery.jpabandmate.entities.TicketSale;

public interface TicketDAO {
	List<TicketSale> findAllTickets();
	Map<Performance, int[]> findTicketSortByEvent();
	List<TicketSale> findTicketByGivenEvent(int eventId);
	TicketSale  findTicketById(int ticketId);
	List<TicketSale>  findTicketByEventOrVenue(String event);
	TicketSale addTicket(TicketSale ticketSale);
	boolean deleteTicketSale(int ticketId);
	
	}
	
	

