package com.skilldistillery.jpabandmate.DAO;

import java.util.List;

import com.skilldistillery.jpabandmate.entities.TicketSale;

public interface TicketDAO {
	List<TicketSale> findAllTickets();
	TicketSale  findTicketById(int ticketId);
	List<TicketSale>  findTicketByEventOrVenue(String event);
	TicketSale addTicket(TicketSale ticketSale);
	boolean deleteTicketSale(int ticketId);
	
	}
	
	

