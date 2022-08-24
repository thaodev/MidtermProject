package com.skilldistillery.jpabandmate.controllers;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.jpabandmate.DAO.BandDAO;
import com.skilldistillery.jpabandmate.DAO.GenreDAO;
import com.skilldistillery.jpabandmate.entities.Band;
import com.skilldistillery.jpabandmate.entities.BandMember;
import com.skilldistillery.jpabandmate.entities.Genre;
import com.skilldistillery.jpabandmate.entities.User;

@Controller
public class BandController {
	
	@Autowired
	private BandDAO dao;
	
	@Autowired
	private GenreDAO genreDao;
	
	@RequestMapping(path="bandListPage.do")
	public String bandList(Model model, HttpSession session) {
		List<Band> bands = dao.findAllBands();
		List<BandMember> bandMembers = dao.findAllBandMembers();
		model.addAttribute("bands", bands);
		model.addAttribute("bandMembers", bandMembers);
		return "bandList";
	}
	
	@RequestMapping(path="bandByKeyword.do")
	public String bandByKeyword(Model model, String search) {
		List<Band> bands = dao.findBandByKeyword(search);
		List<BandMember> bandMembers = dao.findAllBandMembers();
		model.addAttribute("bands", bands);
		model.addAttribute("bandMembers", bandMembers);
		System.out.println("---------IN BAND CONTROLLER------");
		System.out.println(bands);
		return "bandList";
	}
	
	@RequestMapping(path="bandPage.do")
	public String band(Model model, Integer id) {
		Band band = dao.getBandById(id);
		List<BandMember> bandMembers = dao.findAllBandMembers();
		model.addAttribute("band", band);
		model.addAttribute("bandMembers", bandMembers);
		return "band";
	}
	
	@RequestMapping(path = "addBand.do")
	public String addBand(HttpSession session, Model model) {
		List<Genre> genres = dao.findAllGenres();
		model.addAttribute("genres", genres);
		return "addBand";
	}
	
	@RequestMapping(path="createNewBand.do")
	public String createNewBand(HttpSession session, Band band, int[] genreIds, Model model, Integer yearFormed) {
		User user = (User) (session.getAttribute("loggedInUser"));
		band.setYearFormed((yearFormed));
		System.out.println("+++++++++++++++++++++++");
		System.out.println(band);
		System.out.println(yearFormed);
		System.out.println("+++++++++++++++++++++++");
		model.addAttribute("user", user);
		model.addAttribute("band", band);
		band = dao.createBand(band, user, genreIds);
		System.out.println("Testing create new band - controller");
		return "redirect:bandListPage.do";
	}
	
	@RequestMapping(path="editBand.do")
	public String editBand(Integer bandId, Integer genreId, Model model) {
		Band band = dao.getBandById(bandId);
		List<Genre> genres = dao.findAllGenres();
		System.out.println(band);
		List<BandMember> bandMembers = dao.findAllBandMembers();
		model.addAttribute("band", band);
		model.addAttribute("genres", genres);
		model.addAttribute("bandMembers", bandMembers);
		return "editBand";
	}
	
	
	@RequestMapping(path="submitEditBand.do")
	public String submitEditBand(Band band, int[] genreIds, Model model) {
		band = dao.editBand(band, genreIds);
		System.out.println(band);
		List<Band> bands = dao.findAllBands();
		List<BandMember> bandMembers = dao.findAllBandMembers();
		model.addAttribute("bands", bands);
		model.addAttribute("bandMembers", bandMembers);
		return "redirect:bandListPage.do";
	}
	
	@RequestMapping(path="deleteBand.do")
	public String deleteBand(Integer bandId, Model model) {
		dao.deleteBand(bandId);
		List<Band> bands = dao.findAllBands();
		model.addAttribute("bands", bands);
		return "redirect:bandListPage.do";
	}
}
