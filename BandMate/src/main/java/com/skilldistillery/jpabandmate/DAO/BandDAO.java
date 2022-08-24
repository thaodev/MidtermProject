package com.skilldistillery.jpabandmate.DAO;

import java.util.List;

import com.skilldistillery.jpabandmate.entities.Band;
import com.skilldistillery.jpabandmate.entities.BandMember;
import com.skilldistillery.jpabandmate.entities.BandMemberId;
import com.skilldistillery.jpabandmate.entities.Genre;
import com.skilldistillery.jpabandmate.entities.User;

public interface BandDAO {
	Band getBandById(int id);
	List<Band> findAllBands();
	Band createBand(Band band, User user, Genre genre);
	boolean deleteBand(Integer id);
	Band editBand(Band band, Genre genre);
	List<Band> findBandByKeyword(String keyword);
	List<BandMember> findAllBandMembers();
	List<BandMemberId> findAllBandMemberIds();
}
