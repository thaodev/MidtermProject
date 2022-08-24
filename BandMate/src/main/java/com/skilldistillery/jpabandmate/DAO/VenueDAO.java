package com.skilldistillery.jpabandmate.DAO;

import java.util.List;

import com.skilldistillery.jpabandmate.entities.Venue;

public interface VenueDAO {
	
	Venue getVenueById(int id);
	List<Venue> findAllVenue();
	Venue createVenue(Venue venue);
	boolean deleteVenue(int id);
	Venue editVenue(Venue venue);
}
