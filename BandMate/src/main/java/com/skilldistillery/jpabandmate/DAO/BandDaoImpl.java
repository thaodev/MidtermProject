package com.skilldistillery.jpabandmate.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpabandmate.entities.Band;


@Service
@Transactional
public class BandDaoImpl implements BandDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Band createBand(Band band) {
		em.persist(band);
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
		jpql = "SELECT b FROM Band b WHERE b.name LIKE :kw";
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
	public Band editBand(Band band) {
		Band bandToEdit = em.find(Band.class, band.getId());
		if(bandToEdit != null) {
			bandToEdit.getName();
			bandToEdit.getDescription();
			bandToEdit.getYearFormed();
			bandToEdit.getBandImage();
			bandToEdit.getBandLogo();
			
			
		}
		return bandToEdit;
	}
	
	@Override
	public boolean deleteBand(int id) {
		Band bandToDelete = em.find(Band.class, id);
		if(bandToDelete != null) {
			em.remove(bandToDelete);
			return true;
		}
		return false;
	}
	

	
}
