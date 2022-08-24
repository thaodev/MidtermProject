package com.skilldistillery.jpabandmate.DAO;

import java.util.List;

import com.skilldistillery.jpabandmate.entities.Band;
import com.skilldistillery.jpabandmate.entities.BandMember;
import com.skilldistillery.jpabandmate.entities.BandMemberId;
import com.skilldistillery.jpabandmate.entities.Instrument;
import com.skilldistillery.jpabandmate.entities.Musician;

public interface MusicianDAO {
	Musician getMusicianById(Integer id);
	List<Musician> findAllMusicians();
	Musician createMusician(Musician musician);
	boolean deleteMusician(Integer id);
	Musician editMusician(Musician musician);
	List<Musician> findMusicianByKeyword(String keyword);
	List<Instrument> findAllInstruments();
	List<BandMember> findAllBandMembers();
	List<BandMemberId> findAllBandMemberIds();
	List<Band> findAllBands();
	Musician addInstruments(Musician musician, List<Instrument> instruments);
	
}
