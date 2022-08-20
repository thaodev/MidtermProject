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

class UserTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

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
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(user);
		assertEquals("admin", user.getUsername());
	}

	@Test
	void test_User_to_Band_manager_mapping() {
		user = em.find(User.class, 3);
		assertNotNull(user);
		assertTrue(user.getManagedBands().size() > 0);

	}
	
	@Test
	void test_User_to_TicketSale_mapping() {
		user = em.find(User.class, 2);
		assertNotNull(user);
		assertTrue(user.getTicketPurchases().size() > 0);
		
	}
	
	@Test
	void test_User_to_PerformanceComment_mapping() {
		user = em.find(User.class, 2);
		assertNotNull(user);
		assertTrue(user.getPerformanceComments().size() > 0);
		
	}

}
