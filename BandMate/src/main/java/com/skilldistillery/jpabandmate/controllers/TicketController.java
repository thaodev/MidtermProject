package com.skilldistillery.jpabandmate.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.jpabandmate.DAO.TicketDAO;
import com.skilldistillery.jpabandmate.entities.TicketSale;

@Controller
public class TicketController {
	
	@Autowired
	private TicketDAO dao;
	
	
	@RequestMapping(path = "showTicket.do")
	public String tickets(Model model) {
		List<TicketSale> ticketSales = dao.findAllTickets();
		if (ticketSales == null) {
			System.out.println("inside ticketshow controller, ticket sales list is null");
		}
		model.addAttribute("ticketSales",ticketSales);
		
		return "showAllTickets";
	}
	
	/**
	 * CREATE
	 */
	// Forward to Create Ticket Sale page/form
		@RequestMapping(path = "createTicket.do")
		public String createTicket() {
			return "createTicket";
		}

		// Sign Up Form- CREATE TicketSale
		@RequestMapping(path = "addTicketSale.do", method=RequestMethod.POST)
		public String addTicketSale(TicketSale TicketSale, Model model, RedirectAttributes redir) {
			boolean isTicketSaleAdded = false;
			String message = "";

			try {
				TicketSale TicketSaleAdded = dao.addTicket(TicketSale);
				if (TicketSaleAdded != null) {
					isTicketSaleAdded = true;

					//model.addAttribute("TicketSaleAdded", TicketSaleAdded);
					redir.addFlashAttribute("TicketSaleAdded", TicketSaleAdded);
					model.addAttribute("isTicketSaleAdded", isTicketSaleAdded);
				}
				message = "TicketSale is added successfully";
				model.addAttribute("message", message);
				redir.addFlashAttribute("message", message);
				return "redirect:showTicketSale.do";
				
				
			} catch (DataIntegrityViolationException e) {
				System.out.println("cause" + e.getCause());
				message = "Unable to add TicketSale since the TicketSalename already exits. Please try again!";
				model.addAttribute("message", message);
				e.printStackTrace();
				return "loginResult";
			}
			
		}

		@RequestMapping(path = "TicketSaleAdded.do", method = RequestMethod.GET)
		public String TicketSaleAdded(Model model) {
//			model.addAttribute("message", "TicketSale is added successfully");
			System.out.println("inside TicketSaleAdded");
			return "loginResult";
		}

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
