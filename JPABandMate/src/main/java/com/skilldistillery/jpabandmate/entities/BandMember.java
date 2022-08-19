package com.skilldistillery.jpabandmate.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Table;

@Embeddable
@Table(name="band_member")
public class BandMember implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Column(name="musician_id")
	private int musicianId;
	
	@Column(name="band_id")
	private int bandId;
	
	@Column(name="stage_name")
	private String stageName;
	
	private String role;
	

	public BandMember() {
		super();
	}

	
	public int getmusicianId() {
		return musicianId;
	}

	public void setmusicianId(int musicianId) {
		this.musicianId = musicianId;
	}

	public int getbandId() {
		return bandId;
	}

	public void setbandId(int bandId) {
		this.bandId = bandId;
	}


	public String getStageName() {
		return stageName;
	}


	public void setStageName(String stageName) {
		this.stageName = stageName;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
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
		BandMember other = (BandMember) obj;
		return bandId == other.bandId && musicianId == other.musicianId;
	}


//	@Override
//	public String toString() {
//		return "BandMember [musicianId=" + musicianId + ", bandId=" + bandId + ", stageName=" + stageName + ", role="
//				+ role + "]";
//	}



	
	
	
}
