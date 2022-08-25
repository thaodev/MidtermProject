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
	public BandMember createBandMember(Integer musicianId, Integer bandId, String stageName) {
		BandMemberId bmi = new BandMemberId();
		BandMember bm = new BandMember();
		bmi.setBandId(bandId);
		bmi.setMusicianId(musicianId);
		bm.setId(bmi);
		bm.setStageName(stageName);
//		bm.setStageName(em.find(Musician.class, musicianId).getFirstName() + " " + em.find(Musician.class, musicianId).getLastName());
		em.persist(bm);
		System.out.println("testing create instrument method");
		return bm;
	}
	
	public Musician addInstruments(Musician musician, List<Instrument> instruments) {
		musician.setInstruments(instruments);
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
			
//			BandMember bm = (em.find(BandMember.class, (em.find(BandMemberId.class, musicianToEdit.getId()))));
//			bm.setStageName(musicianToEdit.getFirstName() + " " + musicianToEdit.getLastName());
		}
		return musicianToEdit;
	}
	
	@Override
	public boolean deleteMusician(Integer id) {
		Musician musicianToDelete = em.find(Musician.class, id);
		List<BandMember> bms = findAllBandMembers();
		if(musicianToDelete != null) {
			
			for (Instrument instrument : musicianToDelete.getInstruments()) {
				em.remove(instrument);
			}
			
			for (BandMember bm : bms) {
				if (bm.getId().getMusicianId() == musicianToDelete.getId()) {
					em.remove(bm);
				}
			}
			em.remove(musicianToDelete);
			return true;
		}
		return false;
	}
	
	@Override
	public boolean removeMusicianFromBand(Integer bandId, Integer id) {
		Musician musicianToRemove = em.find(Musician.class, id);
		System.out.println("======= INSIDE REMOVE MUSICIAN FROM BAND IN DAOIMPL ========");
		System.out.println(bandId);
		System.out.println(id);
		if(musicianToRemove != null) {
			for (BandMember bm : findAllBandMembers()) {
				if ((bm.getId().getMusicianId() == id) && (bm.getId().getBandId() == bandId)) {
					System.out.println("==============" + bm + "==================");
					em.remove(bm);
				}
			}
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
			return bandMembers;
	}
	
	@Override
	public List<BandMemberId> findAllBandMemberIds() {
		List<BandMemberId> bandMemberIds = null;
		String jpql = "SELECT bm FROM BandMember bm";
		bandMemberIds = em.createQuery(jpql, BandMemberId.class).getResultList();
			System.out.println("ALL BAND MEMBER IDS=======" + bandMemberIds);
			return bandMemberIds;
		}
	
	
}
