package com.skilldistillery.jpabandmate.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Table;


@Embeddable
@Table(name="followed_band")
public class FollowedBand implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Column(name="user_id")
	private int userId;
	
	@Column(name="band_id")
	private int bandId;
	
	
	//CONSTRUCTOR
	public FollowedBand() {
		super();
	}

	
	//METHODS
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}


	public int getBandId() {
		return bandId;
	}


	public void setBandId(int bandId) {
		this.bandId = bandId;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public int hashCode() {
		return Objects.hash(bandId, userId);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		FollowedBand other = (FollowedBand) obj;
		return bandId == other.bandId && userId == other.userId;
	}


//	@Override
//	public String toString() {
//		return "FollowedBand [userId=" + userId + ", bandId=" + bandId + "]";
//	}

	
	
}
