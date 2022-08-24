package com.skilldistillery.jpabandmate.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpabandmate.entities.Address;
import com.skilldistillery.jpabandmate.entities.Performance;
import com.skilldistillery.jpabandmate.entities.Venue;

@Service
@Transactional
public class VenueDaoImpl implements VenueDAO {

	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Venue getVenueById(int id) {
		return em.find(Venue.class, id);
	}
	
	@Override
	public List<Venue> findAllVenue(){
		List<Venue> venues = null;
		String jpql = "SELECT v FROM Venue v";
		venues = em.createQuery(jpql, Venue.class).getResultList();
		if(venues != null ) {
			System.out.println(venues);
			return venues;
		} else {
			return null;
		}
	}
	
	
	@Override
	public Venue createVenue(Venue venue) {
		if (venue.getAddress() != null) {
			em.persist(venue.getAddress());
		}
		Address address = em.find(Address.class, venue.getAddress().getId());
		if(address != null) {
			venue.setAddress(address);
		}
		em.persist(venue);
		return venue;
	}
	
	@Override
	public boolean deleteVenue(int id) {
		Venue venueToDelete = em.find(Venue.class, id);
		if(venueToDelete != null) {
			for(Performance performance : venueToDelete.getPerformances()) {
				em.remove(performance);
			}
			venueToDelete.setPerformances(null);
			em.remove(venueToDelete);
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public Venue editVenue(Venue venue) {
		Venue venueToEdit = em.find(Venue.class, venue.getId());
		if(venueToEdit != null) {
			venueToEdit.setName(venue.getName());
			venueToEdit.setCapacity(venue.getCapacity());
			Address address = em.find(Address.class, venue.getAddress().getId());
			address.setStreet(venue.getAddress().getStreet());
			address.setCity(venue.getAddress().getCity());
			address.setState(venue.getAddress().getState());
			address.setZipCode(venue.getAddress().getZipCode());
			venueToEdit.setAddress(address);
			venueToEdit.setVenueImageUrl(venue.getVenueImageUrl());
			venueToEdit.setDescription(venue.getDescription());
			em.persist(venueToEdit);
				
		}
		return venueToEdit;
	}

	
}
