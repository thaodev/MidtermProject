package com.skilldistillery.jpabandmate.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.jpabandmate.DAO.PerformanceReviewDAO;

@Controller
public class PerformanceReviewController {

	
	@Autowired
	private PerformanceReviewDAO dao;
	
	
}
