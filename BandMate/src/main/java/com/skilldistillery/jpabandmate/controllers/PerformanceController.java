package com.skilldistillery.jpabandmate.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.jpabandmate.DAO.UserDAO;

@Controller
public class PerformanceController {
	
	@Autowired
	private UserDAO dao;
	
	@RequestMapping(path= {"/","home.do"})
	public String home(Model model) {
		model.addAttribute("SMOKETEST", dao.findById(1));
		return "home";
	}
}
