package com.skilldistillery.jpabandmate.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.jpabandmate.DAO.VenueDAO;
import com.skilldistillery.jpabandmate.entities.Venue;

@Controller
public class VenueController {
	
	@Autowired
	private VenueDAO dao;
	
	@RequestMapping(path="venueAdmin.do")
	public String venue(Model model) {
		List<Venue> venues = dao.findAllVenue();
		model.addAttribute("venues", venues);
		return "venueAdmin";
	}
	
	@RequestMapping(path="deleteVenue.do")
	public String deleteVenue(int venueId, Model model) {
		dao.deleteVenue(venueId);
		List<Venue> venue = dao.findAllVenue();
		model.addAttribute("venues", venue);
		return "venueAdmin";
		
	}
	
	@RequestMapping(path="createVenue.do")
	public String createVenue(Model model) {
		return "createVenue";
	}
	
	@RequestMapping(path="submitCreateVenueForm.do")
	public String submitVenue(Venue venue, Model model) {
		venue = dao.createVenue(venue);
		List<Venue> venues = dao.findAllVenue();
		model.addAttribute("venues", venues);
		return "venueAdmin";
	}
	
	
	
}
