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
	public Band createBand(Band band, User user, int[] genreIds) {
		band.setManager(user);
		
		List<Genre> genres = new ArrayList<>();
		for (int id : genreIds) {
			Genre g = em.find(Genre.class, id);
			if (g != null) {
				genres.add(g);
			}
		}
		band.setGenres(genres);
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
		String jpql = "";
		System.out.println("---------IN BAND DAOIMPL------");
		System.out.println(bands);
		jpql = "SELECT b FROM Band b WHERE b.name LIKE :kw";
		bands = em.createQuery(jpql, Band.class).setParameter("kw", "%" + keyword + "%")
				.getResultList();
		System.out.println("---------IN BAND DAOIMPL------");
		System.out.println(bands);
		
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
	public Band editBand(Band band, int[] genreIds) {
		BandDaoImpl dao = new BandDaoImpl();
		Band bandToEdit = em.find(Band.class, band.getId());
		if(bandToEdit != null) {
			bandToEdit.setName(band.getName());
			bandToEdit.setDescription(band.getDescription());
			bandToEdit.setYearFormed(band.getYearFormed());
			bandToEdit.setBandImage(band.getBandImage());
			bandToEdit.setBandLogo(band.getBandLogo());

			List<Genre> genres = new ArrayList<>();
			for (int id : genreIds) {
				Genre g = em.find(Genre.class, id);
				if (g != null) {
					genres.add(g);
				}
			}
			bandToEdit.setGenres(genres);
				
			
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


	@Override
	public List<Genre> findAllGenres() {
		List<Genre> genres = null;
		String jpql = "SELECT g FROM Genre g ORDER BY g.name";
		genres = em.createQuery(jpql, Genre.class).getResultList();
		
		return genres;
	}

	
	

	
}
