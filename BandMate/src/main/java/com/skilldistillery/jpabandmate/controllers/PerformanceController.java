package com.skilldistillery.jpabandmate.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.jpabandmate.DAO.PerformanceDAO;
import com.skilldistillery.jpabandmate.entities.Performance;

@Controller
public class PerformanceController {
	
	@Autowired
	private PerformanceDAO dao;
	
	@RequestMapping(path="eventPage.do")
	public String event(Model model) {
		List<Performance> performances = dao.findAllPerformance();
		model.addAttribute("performances", performances);
		return "event";
	}
	
	@RequestMapping(path="eventByKeyword.do")
	public String eventsByKeyword(Model model, String keyword) {
		List<Performance> performances = dao.findPerformanceByKeyword(keyword);
		model.addAttribute("performances", performances);
		return "event";
	}
}
