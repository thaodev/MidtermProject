package com.skilldistillery.jpabandmate.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.jpabandmate.DAO.BandDAO;
import com.skilldistillery.jpabandmate.entities.Band;
import com.skilldistillery.jpabandmate.entities.BandMember;
import com.skilldistillery.jpabandmate.entities.User;

@Controller
public class BandController {
	
	@Autowired
	private BandDAO dao;
	
	@RequestMapping(path="bandListPage.do")
	public String bandList(Model model) {
		List<Band> bands = dao.findAllBands();
		List<BandMember> bandMembers = dao.findAllBandMembers();
		model.addAttribute("bands", bands);
		model.addAttribute("bandMembers", bandMembers);
		return "bandList";
	}
	
	@RequestMapping(path="bandByKeyword.do")
	public String bandByKeyword(Model model, String keyword) {
		List<Band> bands = dao.findBandByKeyword(keyword);
		model.addAttribute("bands", bands);
		return "bandList";
	}
	
	@RequestMapping(path="bandPage.do")
	public String band(Model model, Integer id) {
		Band band = dao.getBandById(id);
		List<BandMember> bandMembers = dao.findAllBandMembers();
		model.addAttribute("band", band);
		model.addAttribute("bandMembers", bandMembers);
		return "band";
	}
	
	@RequestMapping(path = "addBand.do")
	public String addBand(HttpSession session) {
		return "addBand";
	}
	
	@RequestMapping(path="createNewBand.do")
	public String createNewBand(HttpSession session, Band band, Model model) {
		User user = (User) (session.getAttribute("loggedInUser"));
		model.addAttribute("user", user);
		model.addAttribute("band", band);
		band = dao.createBand(band);
		return "newBand";
	}
}
