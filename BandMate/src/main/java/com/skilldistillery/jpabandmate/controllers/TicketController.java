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
	public String schedule(Model model) {
		List<TicketSale> ticketSales = dao.findAllTickets();
		
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


	
	
//	/**
//	 * UPDATE
//	 */
//	@RequestMapping(path = "updateTicketSale", method=RequestMethod.GET)
//	public String showFormForUpdate(int id, Model model) {
//		System.out.println("inside updateTicketSale");
//		
//		TicketSale TicketSale = dao.findById(id);
//		
//		model.addAttribute("TicketSale",TicketSale);
//		
//		return "updateTicketSale";
//	}
//	@RequestMapping(path = "updateTicketSale.do", method=RequestMethod.POST)
//	public String updateTicketSale(TicketSale TicketSale, Model model) {
//		System.out.println("inside updateTicketSale");
//		
//		model.addAttribute("TicketSale",TicketSale);
//		try {
//			boolean isUpdatedSuccess = dao.updateTicketSale(TicketSale);
//			
//			model.addAttribute("updateResult",isUpdatedSuccess);
//			
//			return "redirect:showTicketSale.do";
//			
//		} catch (DataIntegrityViolationException e) {
//			System.out.println("cause" + e.getCause());
//			String errorMsg = "Unable to update since the TicketSalename already exits. Please try again!";
//			model.addAttribute("errorMsg", errorMsg);
//			e.printStackTrace();
//			return "updateTicketSale";
//		}
//	}
////	@RequestMapping(path = "TicketSaleUpdated.do", method=RequestMethod.GET)
////	public String TicketSaleUpdated(Model model) {
////		List<TicketSale> TicketSales = dao.findAllTicketSales();
////		
////		model.addAttribute("TicketSales",TicketSales);
////		return "showAllTicketSales";
////	}
//	
//	/**
//	 * SEARCH
//	 */
//	@RequestMapping(path = "searchTicketSaleByName.do" )
//	public String getTicketSaleByName(Model model, String search) {
//		List<TicketSale> TicketSales = dao.searchTicketSaleByName(search);
//		System.out.println("inside getTicketSaleByName");
//		model.addAttribute("TicketSales", TicketSales);
//		return "showAllTicketSales" ;
//	}
//	
//	/**
//	 * VIEW 
//	 * */
//	@RequestMapping(path="viewProfile.do")
//	public String viewProfile(HttpSession session, Model model) {
//		 TicketSale TicketSale = (TicketSale) session.getAttribute("loggedInTicketSale");
//		 if (TicketSale == null) {
//			 System.out.println("TicketSale is null");
//		 }
//		 model.addAttribute("TicketSale", TicketSale);
//		 System.out.println("Inside view profile page");
//		 return "viewProfile";
//	}
//	
}
