package com.skilldistillery.jpabandmate.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpabandmate.entities.Address;
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
		Venue VenueToDelete = em.find(Venue.class, id);
		if(VenueToDelete != null) {
			em.remove(VenueToDelete);
			return true;
		}
		return false;
	}
	
	@Override
	public Venue editVenue(Venue venue) {
		Venue VenueToEdit = em.find(Venue.class, venue.getId());
		if(VenueToEdit != null) {
			VenueToEdit.setName(venue.getName());
			VenueToEdit.setCapacity(venue.getCapacity());
			VenueToEdit.setAddress(venue.getAddress());
			VenueToEdit.setVenueImageUrl(venue.getVenueImageUrl());
			VenueToEdit.setDescription(venue.getDescription());
			
//			Address updatedAddress = em.find(Address.class, user.getAddress().getId());
//			if (updatedAddress != null) {
//				updatedAddress.setStreet(updatedUser.getAddress().getStreet());
//				updatedAddress.setCity(updatedUser.getAddress().getCity());
//				updatedAddress.setState(updatedUser.getAddress().getState());
//				updatedAddress.setZipCode(updatedUser.getAddress().getZipCode());
//			}
//			if (updatedUser != null) {
//				isUpdated = true;
//			}
//
//			return isUpdated;
		}
		return VenueToEdit;
	}
	
	
	
}
