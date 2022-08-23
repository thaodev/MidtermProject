package com.skilldistillery.jpabandmate.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.jpabandmate.DAO.MusicianDAO;
import com.skilldistillery.jpabandmate.entities.Instrument;
import com.skilldistillery.jpabandmate.entities.Musician;
import com.skilldistillery.jpabandmate.entities.User;

@Controller
public class MusicianController {
	
	@Autowired
	private MusicianDAO dao;
	
	@RequestMapping(path="musicianListPage.do")
	public String bandList(Model model) {
		List<Musician> musicians = dao.findAllMusicians();
		model.addAttribute("musicians", musicians);
		return "musicianList";
	}
	
	@RequestMapping(path="musicianByKeyword.do")
	public String musicianByKeyword(Model model, String keyword) {
		List<Musician> musicians = dao.findMusicianByKeyword(keyword);
		model.addAttribute("musicians", musicians);
		return "musicianList";
	}
	
	@RequestMapping(path="musicianPage.do")
	public String musician(Model model, Integer id) {
		Musician musician = dao.getMusicianById(id);
		List<Instrument> instruments = dao.findAllInstruments();
		model.addAttribute("musician", musician);
		model.addAttribute("instruments", instruments);
		return "musician";
	}
	
	@RequestMapping(path = "addMusician.do")
	public String addMusician(HttpSession session) {
		return "addMusician";
	}
	
	@RequestMapping(path="createNewMusician.do")
	public String createNewMusician(HttpSession session, Musician musician, Model model) {
		User user = (User) (session.getAttribute("loggedInUser"));
		model.addAttribute("user", user);
		model.addAttribute("musician", musician);
		musician = dao.createMusician(musician);
		return "newMusician";
	}
}
