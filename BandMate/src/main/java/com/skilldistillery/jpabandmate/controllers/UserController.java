package com.skilldistillery.jpabandmate.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	@RequestMapping(path= "adminHome.do")
	public String adminHome(Model model) {
		return "adminHome";
	}
	
	
	@RequestMapping(path = "showUser.do")
	public String schedule(Model model) {
		List<User> users = dao.findAllUsers();
		
		model.addAttribute("users",users);
		
		return "showAllUsers";
	}
	
	/**
	 * CREATE
	 */
	// Sign Up
		@RequestMapping(path = "signUp.do")
		public String signUp() {
			return "signUp";
		}

		// Sign Up Form- CREATE User
		@RequestMapping(path = "addUser.do", method=RequestMethod.POST)
		public String addUser(User user, Model model, RedirectAttributes redir) {
			boolean isUserAdded = false;
			String message = "";

			try {
				User userAdded = dao.addUser(user);
				if (userAdded != null) {
					isUserAdded = true;

					//model.addAttribute("userAdded", userAdded);
					redir.addFlashAttribute("userAdded", userAdded);
					model.addAttribute("isUserAdded", isUserAdded);
				}
				message = "User is added successfully";
				model.addAttribute("message", message);
				redir.addFlashAttribute("message", message);
				return "redirect:showUser.do";
				
				
			} catch (DataIntegrityViolationException e) {
				System.out.println("cause" + e.getCause());
				message = "Unable to add user since the username already exits. Please try again!";
				model.addAttribute("message", message);
				e.printStackTrace();
				return "loginResult";
			}
			
		}

		@RequestMapping(path = "userAdded.do", method = RequestMethod.GET)
		public String userAdded(Model model) {
//			model.addAttribute("message", "User is added successfully");
			System.out.println("inside userAdded");
			return "loginResult";
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
	@RequestMapping(path = "updateUser.do", method=RequestMethod.POST)
	public String updateUser(User user, Model model) {
		System.out.println("inside updateUser");
		
		model.addAttribute("user",user);
		try {
			boolean isUpdatedSuccess = dao.updateUser(user);
			
			model.addAttribute("updateResult",isUpdatedSuccess);
			
			return "redirect:showUser.do";
			
		} catch (DataIntegrityViolationException e) {
			System.out.println("cause" + e.getCause());
			String errorMsg = "Unable to update since the username already exits. Please try again!";
			model.addAttribute("errorMsg", errorMsg);
			e.printStackTrace();
			return "updateUser";
		}
	}
//	@RequestMapping(path = "userUpdated.do", method=RequestMethod.GET)
//	public String userUpdated(Model model) {
//		List<User> users = dao.findAllUsers();
//		
//		model.addAttribute("users",users);
//		return "showAllUsers";
//	}
	
	/**
	 * SEARCH
	 */
	@RequestMapping(path = "searchUserByName.do" )
	public String getUserByName(Model model, String search) {
		List<User> users = dao.searchUserByName(search);
		System.out.println("inside getUserByName");
		model.addAttribute("users", users);
		return "showAllUsers" ;
	}
	
	/**
	 * VIEW 
	 * */
	@RequestMapping(path="viewProfile.do")
	public String viewProfile(HttpSession session, Model model) {
		 User user = (User) session.getAttribute("loggedInUser");
		 if (user == null) {
			 System.out.println("user is null");
		 }
		 model.addAttribute("user", user);
		 System.out.println("Inside view profile page");
		 return "viewProfile";
	}
	
	/**
	 * VIEW 
	 * */
	@RequestMapping(path="deleteUser")
	public String deleteUser(int id) {
		 dao.deleteUser(id);
		
		return "redirect:showUser.do";
		
	}
}
