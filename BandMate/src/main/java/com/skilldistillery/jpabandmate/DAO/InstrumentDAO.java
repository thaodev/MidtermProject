package com.skilldistillery.jpabandmate.DAO;

import com.skilldistillery.jpabandmate.entities.Instrument;
import com.skilldistillery.jpabandmate.entities.Musician;

public interface InstrumentDAO {
	Instrument getInstrumentById(int id);
	Instrument createInstrument(String instrumentName, Musician musician);
}
