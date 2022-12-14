package com.skilldistillery.jpabandmate.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.jpabandmate.DAO.UserDAO;
import com.skilldistillery.jpabandmate.entities.User;

@Controller
public class PageController {
	
	private int noUsersPerPage = 15;
	@Autowired
	private UserDAO dao;
	@RequestMapping(path="showAllUserByPage.do")
	public String showUsersByPages(int startIndex, Model model) {
		List<User> allUsers = dao.findAllUsers();
		int numOfPages = 0;
		if(allUsers.size() % noUsersPerPage == 0) {
			numOfPages = allUsers.size() / noUsersPerPage;
		} else {
			numOfPages = allUsers.size() / noUsersPerPage + 1;
		}
		List<User> users = dao.findAllUsers(startIndex);
		model.addAttribute("users",users);
		model.addAttribute("numOfPages", numOfPages);
		model.addAttribute("currentIndex", startIndex);
		model.addAttribute("noUsersPerPage", noUsersPerPage);
		return "paginationTest";
	}
	@RequestMapping(path="showAllUserBy1stPage.do")
	public String showUsersByPages( Model model) {
		List<User> allUsers = dao.findAllUsers();
		int numOfPages = 0;
		if(allUsers.size() % noUsersPerPage == 0) {
			numOfPages = allUsers.size() / noUsersPerPage;
		} else {
			numOfPages = allUsers.size() / noUsersPerPage + 1;
		}
		
		List<User> users = dao.findAllUsers(0);
		model.addAttribute("users",users);
		model.addAttribute("numOfPages", numOfPages);
		model.addAttribute("currentIndex", 0);
		model.addAttribute("noUsersPerPage", noUsersPerPage);
		return "paginationTest";
	}

}
