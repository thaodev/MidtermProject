package com.skilldistillery.jpabandmate.DAO;

import java.util.List;

import com.skilldistillery.jpabandmate.entities.Band;

public interface BandDAO {
	Band getBandById(int id);
	List<Band> findAllBands();
	Band createBand(Band band);
	boolean deleteBand(int id);
	Band editBand(Band band);
	List<Band> findBandByKeyword(String keyword);
}
