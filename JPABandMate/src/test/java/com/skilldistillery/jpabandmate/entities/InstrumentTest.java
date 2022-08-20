package com.skilldistillery.jpabandmate.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class InstrumentTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Instrument instrument;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPABandMate");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		instrument = em.find(Instrument.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		instrument = null;
	}

	@Test
	void test_Instrument_entity_mapping() {
		assertNotNull(instrument);
		assertEquals("guitar", instrument.getName());
	}
	
	@Test
	void test_Instrument_to_Musician_mapping() {
		assertNotNull(instrument);
		assertEquals("Billy", instrument.getMusician().getFirstName());
		
	}

}
