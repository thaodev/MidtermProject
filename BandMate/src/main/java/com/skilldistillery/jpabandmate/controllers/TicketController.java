package com.skilldistillery.jpabandmate.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.jpabandmate.DAO.PerformanceDAO;
import com.skilldistillery.jpabandmate.DAO.TicketDAO;
import com.skilldistillery.jpabandmate.entities.Performance;
import com.skilldistillery.jpabandmate.entities.TicketSale;

@Controller
public class TicketController {
	
	@Autowired
	private TicketDAO dao;
	@Autowired
	private PerformanceDAO eventDao;
	
	
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
//		// Sign Up Form- CREATE TicketSale
//		@RequestMapping(path = "addTicketSale.do", method=RequestMethod.POST)
//		public String addTicketSale(TicketSale TicketSale, Model model, RedirectAttributes redir) {
//			boolean isTicketSaleAdded = false;
//			String message = "";
//
//			try {
//				TicketSale TicketSaleAdded = dao.addTicket(TicketSale);
//				if (TicketSaleAdded != null) {
//					isTicketSaleAdded = true;
//
//					//model.addAttribute("TicketSaleAdded", TicketSaleAdded);
//					redir.addFlashAttribute("TicketSaleAdded", TicketSaleAdded);
//					model.addAttribute("isTicketSaleAdded", isTicketSaleAdded);
//				}
//				message = "TicketSale is added successfully";
//				model.addAttribute("message", message);
//				redir.addFlashAttribute("message", message);
//				return "redirect:showTicketSale.do";
//				
//				
//			} catch (DataIntegrityViolationException e) {
//				System.out.println("cause" + e.getCause());
//				message = "Unable to add TicketSale since the TicketSalename already exits. Please try again!";
//				model.addAttribute("message", message);
//				e.printStackTrace();
//				return "loginResult";
//			}
//			
//		}
//
//		@RequestMapping(path = "TicketSaleAdded.do", method = RequestMethod.GET)
//		public String TicketSaleAdded(Model model) {
////			model.addAttribute("message", "TicketSale is added successfully");
//			System.out.println("inside TicketSaleAdded");
//			return "loginResult";
//		}
//		

	/**
	 * SEARCH
	 */
	@RequestMapping(path = "searchTicketByEvent.do" )
	public String getTicketSaleByEventOrVenue(Model model, String search) {
		List<TicketSale> TicketSales = dao.findTicketByEventOrVenue(search);
		System.out.println("inside getTicketSaleByEvent");
		model.addAttribute("TicketSales", TicketSales);
		return "showAllTicketSales" ;
	}
	
//
//	
}
