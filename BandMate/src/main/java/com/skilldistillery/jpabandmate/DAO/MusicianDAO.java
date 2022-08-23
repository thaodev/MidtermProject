package com.skilldistillery.jpabandmate.DAO;

import java.util.List;

import com.skilldistillery.jpabandmate.entities.Instrument;
import com.skilldistillery.jpabandmate.entities.Musician;

public interface MusicianDAO {
	Musician getMusicianById(int id);
	List<Musician> findAllMusicians();
	Musician createMusician(Musician musician);
	boolean deleteMusician(int id);
	Musician editMusician(Musician musician);
	List<Musician> findMusicianByKeyword(String keyword);
	List<Instrument> findAllInstruments();
	
}
