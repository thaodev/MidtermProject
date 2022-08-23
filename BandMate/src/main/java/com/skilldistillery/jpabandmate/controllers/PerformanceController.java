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
	
	@RequestMapping(path="eventPageAdmin.do")
	public String eventCrudForAdmin(Model model) {
		List<Performance> performances = dao.findAllPerformance();
		model.addAttribute("performances", performances);
		return "eventAdmin";
	}
	
	@RequestMapping(path="deletePerformance.do")
	public String deletePerformance(int performanceId, Model model) {
		dao.deletePerformance(performanceId);
		List<Performance> performance = dao.findAllPerformance();
		model.addAttribute("performances", performance);
		return "eventAdmin";
	}
	
	
	@RequestMapping(path="editPerformance.do")
	public String editPerformance(int performanceId, Model model) {
		Performance performance = dao.getPerformanceById(performanceId);
		System.out.println("*****************INSIDE EDIT PERFORMANCE***********");
		System.out.println(performance);
		model.addAttribute("performance", performance);
		return "editPerformance";
	}
	
	
	@RequestMapping(path="submitEditperformanceForm.do")
	public String submitEditPerformance(Performance performance, Model model) {
		performance = dao.editPerformance(performance);
		System.out.println("----------------INSIDE SUBMIT EDIT PERFORMANCE-----------------");
		System.out.println(performance);
		List<Performance> performances = dao.findAllPerformance();
		model.addAttribute("performances", performances);
		return "eventAdmin";
	}
	
	@RequestMapping(path="createPerformance.do")
	public String createPerformance(Model model) {
		return "createPerformance";
	}
	
	
	@RequestMapping(path="submitCreatePerformanceForm.do")
	public String submitPerformance(Performance performance, int bandId, int venueId, Model model) {
		performance = dao.createPerformance(performance, bandId, venueId);
		List<Performance> performances = dao.findAllPerformance();
		model.addAttribute("performances", performances);
		return "eventAdmin";
	}
}
