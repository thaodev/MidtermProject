package com.skilldistillery.jpabandmate.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Table;

@Embeddable
@Table(name="band_member")
public class BandMemberId implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Column(name="musician_id")
	private int musicianId;
	
	@Column(name="band_id")
	private int bandId;
	


	public BandMemberId() {
		super();
	}

	
	public int getMusicianId() {
		return musicianId;
	}

	public void setMusicianId(int musicianId) {
		this.musicianId = musicianId;
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
		return Objects.hash(bandId, musicianId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BandMemberId other = (BandMemberId) obj;
		return bandId == other.bandId && musicianId == other.musicianId;
	}


//	@Override
//	public String toString() {
//		return "BandMember [musicianId=" + musicianId + ", bandId=" + bandId + ", stageName=" + stageName + ", role="
//				+ role + "]";
//	}



	
	
	
}
