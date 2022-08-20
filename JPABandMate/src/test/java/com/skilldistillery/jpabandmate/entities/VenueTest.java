package com.skilldistillery.jpabandmate.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class VenueTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Venue venue;
	
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
		venue = em.find(Venue.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		venue = null;
	}

	@Test
	void test_Venue_entity_mapping() {
		assertNotNull(venue);
		assertEquals(200, venue.getCapacity());
	}
	
	@Test
	void test_Venue_to_Performance_mapping() {
		assertNotNull(venue);
		assertTrue(venue.getPerformances().size() > 0);
		
	}
	
	@Test
	void test_Venue_to_Address_mapping() {
		assertNotNull(venue);
		assertEquals("San Francisco", venue.getAddress().getCity());
		
	}

}
