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

class PerformanceCommentTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private PerformanceComment performanceComment;

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
		performanceComment = em.find(PerformanceComment.class, 1);
		
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		performanceComment = null;
	}

	@Test
	void test_PerformanceComment_entity_mapping() {
		assertNotNull(performanceComment);
		assertEquals("This concert ruled, man!", performanceComment.getComment());
	}

	@Test
	void test_PerformanceComment_to_User_mapping() {
		assertNotNull(performanceComment);
		assertEquals("Sally", performanceComment.getUser().getFirstName());
	}

	@Test
	void test_PerformanceComment_to_Performance_mapping() {
		assertNotNull(performanceComment);
		assertEquals("An Adaption", performanceComment.getPerformance().getName());

	}

	@Test
	void test_PerformanceComment_to_PerformanceComment_mapping() {
		assertNotNull(performanceComment);
		assertTrue(performanceComment.getReplies().size() > 0);
		assertEquals("No way, bro... Concert was traaash.", performanceComment.getReplies().get(0).getComment());
	}

}
