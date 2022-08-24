package com.skilldistillery.jpabandmate.controllers;

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
	public String bandList(Model model) {
		List<Band> bands = dao.findAllBands();
		List<BandMember> bandMembers = dao.findAllBandMembers();
		model.addAttribute("bands", bands);
		model.addAttribute("bandMembers", bandMembers);
		return "bandList";
	}
	
	@RequestMapping(path="bandByKeyword.do")
	public String bandByKeyword(Model model, String keyword) {
		List<Band> bands = dao.findBandByKeyword(keyword);
		model.addAttribute("bands", bands);
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
	public String addBand(HttpSession session) {
		return "addBand";
	}
	
	@RequestMapping(path="createNewBand.do")
	public String createNewBand(HttpSession session, Band band, Integer genreId, Model model) {
		User user = (User) (session.getAttribute("loggedInUser"));
		model.addAttribute("user", user);
		model.addAttribute("band", band);
		Genre genre = genreDao.getGenreById(genreId);
		model.addAttribute("genre", genre);
		band = dao.createBand(band, user, genre);
		System.out.println("Testing create new band - controller");
		return "redirect:bandListPage.do";
	}
	
	@RequestMapping(path="editBand.do")
	public String editBand(Integer bandId, Integer genreId, Model model) {
		Band band = dao.getBandById(bandId);
		System.out.println(band);
		List<BandMember> bandMembers = dao.findAllBandMembers();
		model.addAttribute("band", band);
		model.addAttribute("bandMembers", bandMembers);
		return "editBand";
	}
	
	
	@RequestMapping(path="submitEditBand.do")
	public String submitEditBand(Band band, Integer genreId, Model model) {
		Genre genre = genreDao.getGenreById(genreId);
		model.addAttribute("genre", genre);
		band = dao.editBand(band, genre);
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
