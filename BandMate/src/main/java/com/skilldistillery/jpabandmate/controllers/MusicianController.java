package com.skilldistillery.jpabandmate.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.jpabandmate.DAO.BandDAO;
import com.skilldistillery.jpabandmate.DAO.InstrumentDAO;
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
	
	@Autowired
	private InstrumentDAO instrumentDao;

	@Autowired
	private BandDAO bandDao;
	
	@RequestMapping(path="musicianListPage.do")
	public String bandList(HttpSession session, Model model) {
		List<Musician> musicians = dao.findAllMusicians();
		List<BandMember> bandMembers = dao.findAllBandMembers();
		List<Band> bands = dao.findAllBands();
		User user = (User) session.getAttribute("loggedInUser");
		boolean managerCheck = bandDao.checkBandManager(user);
		model.addAttribute("musicians", musicians);
		model.addAttribute("managerCheck", managerCheck);
		model.addAttribute("bandMembers", bandMembers);
		model.addAttribute("bands", bands);
		return "musicianList";
	}
	
	@RequestMapping(path="musicianByKeyword.do")
	public String musicianByKeyword(HttpSession session, Model model, String search) {
		List<Musician> musicians = dao.findMusicianByKeyword(search);
		List<Band> bands = dao.findAllBands();
		List<BandMember> bandMembers = dao.findAllBandMembers();
		User user = (User) session.getAttribute("loggedInUser");
		if (user != null) {
			boolean managerCheck = bandDao.checkBandManager(user);
			System.out.println("manager check" + managerCheck);
			model.addAttribute("managerCheck", managerCheck);
		}
		model.addAttribute("bands", bands);
		model.addAttribute("bandMembers", bandMembers);
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
	public String createNewMusician(Musician musician, String instrumentName,  Model model) {
		musician = dao.createMusician(musician);
		Instrument instrument = instrumentDao.createInstrument(instrumentName, musician);
		musician.addInstrument(instrument);
		System.out.println(instrumentName);
		model.addAttribute("musician", musician);
		System.out.println("====INSIDE CREATE MUSICIAN====");
		System.out.println(musician);
		return "redirect:musicianListPage.do";
	}
	
//	@RequestMapping(path="createNewInstrument.do")
//	public String CreateNewInstrument(Musician musician, Model model) {
//		List<Instrument> instruments = new ArrayList<>();
//		model.addAttribute("instruments", instruments);
//		musician = dao.addInstruments(musician, instruments);
//		System.out.println("====INSIDE CREATE INSTRUMENT====");
//		System.out.println(musician);
//		return "redirect:submitCreateNewInstrument.do";
//	}
	
	
	@RequestMapping(path="getInstrumentName.do")
	public String getInstrumentName(Integer musicianId, Model model) {
		Musician musician = dao.getMusicianById(musicianId);
		model.addAttribute("musician", musician);
		
		return "addInstrument";
		
	}
	
	@RequestMapping(path="submitCreateNewInstrument.do")
	public String submitCreateNewInstrument(String instrumentName, Model model, Musician musician) {
//		Musician musician = dao.getMusicianById(musicianId);
//		Instrument instrument = instrumentDao.createInstrument(instrument, musician);
//		List<Instrument> instruments = new ArrayList<>();
//		model.addAttribute("musician", musician);
//		model.addAttribute("instruments", instruments);
//		musician = dao.addInstruments(musician, instruments);
//		System.out.println("====INSIDE SUBMIT INSTRUMENT====");
//		System.out.println(musician);
		System.out.println(model.getAttribute("musician"));
		return "addInstrument";
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
	
	@RequestMapping(path="deleteMusician.do")
	public String deleteMusician(Integer musicianId, Model model) {
		
		dao.deleteMusician(musicianId);
		
		List<Musician> musicians = dao.findAllMusicians();
		model.addAttribute("musiciains", musicians);
		return "redirect:musicianListPage.do";
	}
	
	@RequestMapping(path="addMusicianToBand.do")
	public String addMusicianToBand(Integer musicianId, Model model) {
		Musician musician = dao.getMusicianById(musicianId);
		System.out.println(musician);
		model.addAttribute("musician", musician);
		return "addMusicianToBand";
	}
	
	@RequestMapping(path="submitAddMusicianToBand.do")
	public String submitAddMusicianToBand(Integer musicianId, Integer bandId, String stageName, Model model) {
		System.out.println("-------ADD MUSICIAN TO BAND--------");
		System.out.println(musicianId);
		System.out.println(bandId);
		
		dao.createBandMember(musicianId, bandId, stageName);
		
		return "redirect:musicianListPage.do";
	}
	
	@RequestMapping(path="removeFromBand.do")
	public String removeFromBand(Integer musicianId, Model model) {
		Musician musician = dao.getMusicianById(musicianId);
		System.out.println(musician);
		model.addAttribute("musician", musician);
		return "removeFromBand";
	}
	
	@RequestMapping(path="submitRemoveFromBand.do")
	public String submitRemoveFromBand(Integer musicianId, Integer bandId, String stageName, Model model) {
		System.out.println("-------REMOVE FROM BAND--------");
		System.out.println(musicianId);
		System.out.println(bandId);
		dao.removeMusicianFromBand(bandId, musicianId);
		
		return "redirect:musicianListPage.do";
	}
}
