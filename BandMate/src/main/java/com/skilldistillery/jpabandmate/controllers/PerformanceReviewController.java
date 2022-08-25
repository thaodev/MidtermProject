package com.skilldistillery.jpabandmate.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.jpabandmate.DAO.PerformanceReviewDAO;
import com.skilldistillery.jpabandmate.DAO.UserDAO;
import com.skilldistillery.jpabandmate.entities.PerformanceReview;
import com.skilldistillery.jpabandmate.entities.User;

@Controller
public class PerformanceReviewController {

	
	@Autowired
	private PerformanceReviewDAO dao;
	
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path="performanceReview.do")
	public String performanceReview(PerformanceReview review, Model model, HttpSession session) {
		
		PerformanceReview reviewToAdd = dao.addReview(review);
		User user = (User) session.getAttribute("loggedInUser");
		session.setAttribute("loggedInUser", userDao.findById(user.getId()));
//		model.addAttribute(reviewToAdd);
		return "redirect:eventPage.do?id="+review.getId().getPerformanceId();
	}
}
