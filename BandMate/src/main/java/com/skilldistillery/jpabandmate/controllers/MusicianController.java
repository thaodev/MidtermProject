package com.skilldistillery.jpabandmate.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.jpabandmate.DAO.MusicianDAO;
import com.skilldistillery.jpabandmate.entities.Band;
import com.skilldistillery.jpabandmate.entities.BandMember;
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
		List<BandMember> bandMembers = dao.findAllBandMembers();
		List<Band> bands = dao.findAllBands();
		model.addAttribute("musicians", musicians);
		model.addAttribute("bandMembers", bandMembers);
		model.addAttribute("bands", bands);
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
		List<BandMember> bandMembers = dao.findAllBandMembers();
		List<Band> bands = dao.findAllBands();
		model.addAttribute("musician", musician);
		model.addAttribute("instruments", instruments);
		model.addAttribute("bandMembers", bandMembers);
		model.addAttribute("bands", bands);
		return "musician";
	}
	
	@RequestMapping(path = "addMusician.do")
	public String addMusician(HttpSession session) {
		return "addMusician";
	}
	
	@RequestMapping(path="createNewMusician.do")
	public String createNewMusician(Musician musician, Model model) {
		model.addAttribute("musician", musician);
		musician = dao.createMusician(musician);
		System.out.println("====INSIDE CREATE MUSICIAN====");
		System.out.println(musician);
		return "redirect:musicianListPage.do";
	}
	
	@RequestMapping(path="editMusician.do")
	public String editMusician(Integer musicianId, Model model) {
		Musician musician = dao.getMusicianById(musicianId);
		System.out.println(musician);
		List<Instrument> instruments = dao.findAllInstruments();
		model.addAttribute("musician", musician);
		model.addAttribute("instruments", instruments);
		return "editMusician";
	}
	
	
	@RequestMapping(path="submitEditMusician.do")
	public String submitEditMusician(Musician musician, Model model) {
		musician = dao.editMusician(musician);
		System.out.println(musician);
		List<Musician> musicians = dao.findAllMusicians();
		List<Instrument> instruments = dao.findAllInstruments();
		model.addAttribute("musicians", musicians);
		model.addAttribute("instruments", instruments);
		return "redirect:musicianListPage.do";
	}
}
