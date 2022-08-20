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

class TicketSaleTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private TicketSale ticketSale;
	
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
		ticketSale = em.find(TicketSale.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		ticketSale = null;
	}

	@Test
	void test_TicketSale_entity_mapping() {
		assertNotNull(ticketSale);
		assertEquals(1, ticketSale.getId());
	}
	
	@Test
	void test_TicketSale_to_Performance_mapping() {
		assertNotNull(ticketSale);
		assertEquals("An Adaption", ticketSale.getPerformance().getName());
		assertEquals("The Lamb Commander", ticketSale.getPerformance().getBand().getName());
		
	}
	
	@Test
	void test_TicketSale_to_User_mapping() {
		assertNotNull(ticketSale);
		assertEquals("bandmateuser", ticketSale.getUser().getUsername());
		
	}

}
