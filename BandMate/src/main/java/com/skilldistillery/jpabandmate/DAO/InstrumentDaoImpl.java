package com.skilldistillery.jpabandmate.DAO;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpabandmate.entities.Instrument;
import com.skilldistillery.jpabandmate.entities.Musician;


@Service
@Transactional
public class InstrumentDaoImpl implements InstrumentDAO {
	
	@PersistenceContext
	private EntityManager em;
	

	
	@Override
	public Instrument getInstrumentById(int id) {
		return em.find(Instrument.class, id);
	}



	@Override
	public Instrument createInstrument(String instrumentName, Musician musician) {
		Instrument instrument = new Instrument();
		instrument.setMusician(musician);
		instrument.setName(instrumentName);
		em.persist(instrument);
		System.out.println("testing create instrument method");
		return instrument;
	}
	
	

	

	
}
