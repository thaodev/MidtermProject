package com.skilldistillery.jpabandmate.DAO;

import java.util.List;

import com.skilldistillery.jpabandmate.entities.TicketSale;

public interface TicketDAO {
	List<TicketSale> findAllTickets();
	TicketSale findTicketByEvent(int eventId);
	TicketSale findTicketByVenue(int venueId);
	TicketSale addTicket(TicketSale ticketSale);
	TicketSale updateTicketSale(TicketSale ticketSale);
	boolean deleteTicketSale(int ticketId);
	
	}
	
	

