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

class PerformanceTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Performance performance;

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
		performance = em.find(Performance.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		performance = null;
	}

	@Test
	void test_Performance_entity_mapping() {
		assertNotNull(performance);
		assertEquals("An Adaption", performance.getName());
	}

	@Test
	void test_Performance_to_band_mapping() {
		assertNotNull(performance);
		assertEquals("The Lamb Commander", performance.getBand().getName());

	}

	@Test
	void test_Performance_to_Venue_mapping() {
		assertNotNull(performance);
		assertEquals(200, performance.getVenue().getCapacity());

	}

	@Test
	void test_Performance_to_TicketSale_mapping() {
		assertNotNull(performance);
		assertTrue(performance.getTicketSales().size() > 0);

	}
	
	@Test
	void test_Performance_to_PerformanceComment_mapping() {
		assertNotNull(performance);
		assertTrue(performance.getPerformanceComments().size() > 0);
		
	}

}
