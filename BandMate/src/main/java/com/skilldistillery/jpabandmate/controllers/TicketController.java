package com.skilldistillery.jpabandmate.controllers;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.jpabandmate.DAO.PerformanceDAO;
import com.skilldistillery.jpabandmate.DAO.TicketDAO;
import com.skilldistillery.jpabandmate.entities.Performance;
import com.skilldistillery.jpabandmate.entities.TicketSale;
import com.skilldistillery.jpabandmate.entities.User;

@Controller
public class TicketController {
	
	@Autowired
	private TicketDAO dao;
	@Autowired
	private PerformanceDAO pDao;
	
	
	@RequestMapping(path = "showTicket.do")
	public String tickets(Model model) {
		
		Map<Performance, int[]> ticketByEvent = dao.findTicketSortByEvent();
		

		model.addAttribute("ticketByEvent",ticketByEvent);
		
		return "ticketByEvent";
	}
	
	@RequestMapping(path = "showTicketByEventDetails.do")
	public String ticketByEventDetails(int eventId, Model model) {
		System.out.println("inside ticketByEventDetails controller method");
		System.out.println("event id" + eventId);
		List<TicketSale> tickets = dao.findTicketByGivenEvent(eventId);
		
		
		model.addAttribute("ticketSales",tickets);
		
		return "ticketByEventDetails";
	}
	@RequestMapping(path = "showTicketsInCart.do")
	public String ticketsInCart(HttpSession session, Model model) {
		System.out.println("inside tickets in cart method");
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		Map<Performance, Object[]> tickets = pDao.findPerformanceByUserId(loggedInUser.getId());
		
		
		model.addAttribute("ticketSales",tickets);
		
		return "ticketsInCartByUser";
	}
	
	@RequestMapping(path = "checkout.do")
	public String checkout(Model model) {
		System.out.println("inside tickets checkout method controller");
		String message = "You checked out successfully";
		model.addAttribute("message", message);
		
		return "checkout";
	}
	
	/**
	 * CREATE
	 */
	// Forward to Create Ticket Sale page/form
		@RequestMapping(path = "createTicket.do")
		public String createTicket() {
			return "createTicket";
		}

//		@RequestMapping(path = "addTicketByEventForm")
//		public String addTicketByEventIdForm(String eventId, Model model) {
//			int id = Integer.parseInt(eventId);
//			Performance performance = eventDao.getPerformanceById(id);
//			
//			model.addAttribute("performance", performance);
//			
//			return "addTicketByEvent";
//		}
		@RequestMapping(path = "addTicketByEvent.do")
		public String addTicketByEventId(TicketSale ticket, Model model) {
			
			dao.addTicket(ticket);
			System.out.println("inside add ticket by event id");
			
			return "redirect:showTicket.do";
		}
		@RequestMapping(path = "addTicketByEventByNonAdmin.do")
		public String addTicketByEventIdNonAdmin(TicketSale ticket, Model model) {
			
			dao.addTicket(ticket);
			System.out.println("inside add ticket by event id");
			
			return "redirect:eventListPage.do";
		}

	/**
	 * SEARCH
	 */
	@RequestMapping(path = "searchTicketByEvent.do" )
	public String getTicketSaleByEventOrVenue(Model model, String search) {
		List<TicketSale> ticketSales = dao.findTicketByEventOrVenue(search);
		System.out.println("inside getTicketSaleByEvent");
		model.addAttribute("ticketSales", ticketSales);
		return "ticketByEventDetails" ;
	}
	
	/**
	 * REMOVE
	 */
//	 @RequestMapping(path="deleteTicket")
//	 public String removeTicket(String id) {
//		 int ticketId = Integer.parseInt(id);
//		 dao.deleteTicketSale(ticketId);
//		 
//		 return "ticketsInCartByUser";
//	 }
	 @RequestMapping(path="deleteTicketsInCard")
	 public String removeTicketsInCard(HttpSession session, String id) {
		 int performanceId = Integer.parseInt(id);
		 User loggedInUser = (User) session.getAttribute("loggedInUser");
		 Performance performance = pDao.getPerformanceById(performanceId);
		 for (TicketSale ticket : performance.getTicketSales() ) {
			 if (ticket.getUser().getId() == loggedInUser.getId()) {
				 dao.deleteTicketSale(ticket.getId());
				 System.out.println("inside the if statement");
			 }
		 }
		 
		 System.out.println("inside remove ticket in card");
		 
		 
		 return "redirect:showTicketsInCart.do";
	 }
	 
	 
	
}
