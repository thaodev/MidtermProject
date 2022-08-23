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

class BandMemberTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private BandMember bm;
	
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
		BandMemberId bid = new BandMemberId();
		bid.setBandId(1);;
		bid.setMusicianId(1);
		bm = em.find(BandMember.class, bid);
		
	}

	@AfterEach
	void tearDown() throws Exception {
	}

	@Test
	void BandMember_mapping() {
		assertNotNull(bm);
		assertEquals("Rocky Rockstar", bm.getStageName());
	}

}
