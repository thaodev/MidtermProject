package com.skilldistillery.jpabandmate.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.jpabandmate.DAO.BandDAO;
import com.skilldistillery.jpabandmate.entities.Band;
import com.skilldistillery.jpabandmate.entities.BandMember;

@Controller
public class BandController {
	
	@Autowired
	private BandDAO dao;
	
	@RequestMapping(path="bandPage.do")
	public String band(Model model) {
		List<Band> bands = dao.findAllBands();
		List<BandMember> bandMembers = dao.findAllBandMembers();
		model.addAttribute("bands", bands);
		model.addAttribute("bandMembers", bandMembers);
		return "band";
	}
	
	@RequestMapping(path="bandByKeyword.do")
	public String bandByKeyword(Model model, String keyword) {
		List<Band> bands = dao.findBandByKeyword(keyword);
		model.addAttribute("bands", bands);
		return "band";
	}
}
