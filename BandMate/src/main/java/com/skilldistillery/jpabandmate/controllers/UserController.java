package com.skilldistillery.jpabandmate.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.jpabandmate.DAO.UserDAO;
import com.skilldistillery.jpabandmate.entities.User;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO dao;
	
	@RequestMapping(path= {"/","home.do"})
	public String home(Model model) {
		model.addAttribute("SMOKETEST", dao.findById(1));
		return "home";
	}
	
	
	@RequestMapping(path = "showUser.do")
	public String schedule(Model model) {
		List<User> users = dao.findAllUsers();
		
		model.addAttribute("users",users);
		
		return "showAllUsers";
	}
	
	/**
	 * UPDATE
	 */
	@RequestMapping(path = "updateUser", method=RequestMethod.GET)
	public String showFormForUpdate(int id, Model model) {
		System.out.println("inside updateUser");
		
		User user = dao.findById(id);
		
		model.addAttribute("user",user);
		
		return "updateUser";
	}
//	@RequestMapping(path = "updateUser.do", method=RequestMethod.POST)
//	public String updateuser(User user, Model model) {
//		System.out.println("inside updateService");
//		
//		boolean isUpdatedSuccess = dao.updateUser(user);
//		
//		model.addAttribute("user",user);
//		model.addAttribute("updateResult",isUpdatedSuccess);
//		
//		return "redirect:userUpdated.do";
//	}
//	@RequestMapping(path = "userUpdated.do", method=RequestMethod.GET)
//	public String userUpdated(Model model) {
//		List<User> users = dao.findAll();
//		model.addAttribute("users",users);
//		return "servicesDetails";
//	}
	
}
