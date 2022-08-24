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
import com.skilldistillery.jpabandmate.entities.Genre;
import com.skilldistillery.jpabandmate.entities.User;


@Service
@Transactional
public class BandDaoImpl implements BandDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Band createBand(Band band, User user, Genre genre) {
		band.setManager(user);
		band.addGenre(genre);
		em.persist(band);
		System.out.println("testing create band method");
		return band;
	}

	
	@Override
	public Band getBandById(int id) {
		return em.find(Band.class, id);
	}
	
	@Override
	public List<Band> findBandByKeyword(String keyword) {
		List<Band> bands = new ArrayList<>();
		String jpql = "SELECT b FROM Band b WHERE b.name LIKE :kw";
		bands = em.createQuery(jpql, Band.class).setParameter("kw", "%" + keyword + "%")
				.getResultList();
		
		return bands;
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
	
	@Override
	public Band editBand(Band band, Genre genre) {
		Band bandToEdit = em.find(Band.class, band.getId());
		if(bandToEdit != null) {
			bandToEdit.setName(band.getName());
			bandToEdit.setDescription(band.getDescription());
			bandToEdit.setYearFormed(band.getYearFormed());
			bandToEdit.setBandImage(band.getBandImage());
			bandToEdit.setBandLogo(band.getBandLogo());
			bandToEdit.addGenre(genre);
			
			
		}
		return bandToEdit;
	}
	
	@Override
	public boolean deleteBand(Integer id) {
		Band bandToDelete = em.find(Band.class, id);
		if(bandToDelete != null) {
			em.remove(bandToDelete);
			return true;
		}
		return false;
	}


	

	
}
