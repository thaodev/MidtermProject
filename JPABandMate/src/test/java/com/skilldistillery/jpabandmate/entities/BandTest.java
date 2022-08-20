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

class BandTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Band band;
	
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
		band = em.find(Band.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		band = null;
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(band);
		assertEquals("Hammer of Rock", band.getName());
	}

}
