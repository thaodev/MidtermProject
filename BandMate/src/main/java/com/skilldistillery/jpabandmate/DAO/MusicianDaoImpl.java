package com.skilldistillery.jpabandmate.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpabandmate.entities.Band;
import com.skilldistillery.jpabandmate.entities.BandMember;
import com.skilldistillery.jpabandmate.entities.BandMemberId;
import com.skilldistillery.jpabandmate.entities.Instrument;
import com.skilldistillery.jpabandmate.entities.Musician;


@Service
@Transactional
public class MusicianDaoImpl implements MusicianDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Musician createMusician(Musician musician) {
		em.persist(musician);
		return musician;
	}

	
	@Override
	public Musician getMusicianById(Integer id) {
		return em.find(Musician.class, id);
	}
	
	@Override
	public List<Musician> findMusicianByKeyword(String keyword) {
		List<Musician> musicians = new ArrayList<>();
		String jpql = "SELECT m FROM Musician m WHERE m.firstName LIKE :kw";
		musicians = em.createQuery(jpql, Musician.class).setParameter("kw", "%" + keyword + "%")
				.getResultList();
		
		return musicians;
	}
	
	@Override
	public List<Musician> findAllMusicians(){
		List<Musician> musicians = null;
		String jpql = "SELECT m FROM Musician m";
		musicians = em.createQuery(jpql, Musician.class).getResultList();
		if(musicians != null ) {
			System.out.println(musicians);
			return musicians;
		} else {
			return null;
		}
	}
	
	
	@Override
	public Musician editMusician(Musician musician) {
		Musician musicianToEdit = em.find(Musician.class, musician.getId());
		if(musicianToEdit != null) {
			musicianToEdit.setFirstName(musician.getFirstName());
			musicianToEdit.setLastName(musician.getLastName());
			musicianToEdit.setBio(musician.getBio());
			musicianToEdit.setBandMemberImage(musician.getBandMemberImage());
			musicianToEdit.setInstruments(musician.getInstruments());
			musicianToEdit.setVocals(musician.getVocals());
			
			
		}
		return musicianToEdit;
	}
	
	@Override
	public boolean deleteMusician(int id) {
		Musician musicianToDelete = em.find(Musician.class, id);
		if(musicianToDelete != null) {
			em.remove(musicianToDelete);
			return true;
		}
		return false;
	}

	@Override
	public List<Instrument> findAllInstruments() {
		List<Instrument> instruments = null;
		String jpql = "SELECT i FROM Instrument i";
		instruments = em.createQuery(jpql, Instrument.class).getResultList();
		if (instruments != null) {
			System.out.println(instruments);
			return instruments;
		} else {
			return null;
		}
	}
	
	@Override
	public List<Band> findAllBands(){
		List<Band> bands = null;
		String jpql = "SELECT b FROM Band b";
		bands = em.createQuery(jpql, Band.class).getResultList();
		if(bands != null ) {
			System.out.println(bands);
			return bands;
		} else {
			return null;
		}
	}
	
	@Override
	public List<BandMember> findAllBandMembers() {
		List<BandMember> bandMembers = null;
		String jpql = "SELECT bm FROM BandMember bm";
		bandMembers = em.createQuery(jpql, BandMember.class).getResultList();
		if (bandMembers != null) {
			System.out.println(bandMembers);
			return bandMembers;
		} else {
			return null;
		}
	}
	
	@Override
	public List<BandMemberId> findAllBandMemberIds() {
		List<BandMemberId> bandMemberIds = null;
		String jpql = "SELECT bmi FROM BandMemberId bmi";
		bandMemberIds = em.createQuery(jpql, BandMemberId.class).getResultList();
		if (bandMemberIds != null) {
			System.out.println(bandMemberIds);
			return bandMemberIds;
		} else {
			return null;
		}
	}
	
}
