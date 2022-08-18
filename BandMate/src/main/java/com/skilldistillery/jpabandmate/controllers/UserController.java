package com.skilldistillery.jpabandmate.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.jpabandmate.DAO.UserDAO;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO dao;

}
