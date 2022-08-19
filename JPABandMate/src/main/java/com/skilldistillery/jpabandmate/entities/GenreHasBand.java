package com.skilldistillery.jpabandmate.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Table;

@Embeddable
@Table(name="genre_has_band")
public class GenreHasBand implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Column(name="genre_id")
	private int genreId;
	
	@Column(name="band_id")
	private int bandId;

	public GenreHasBand() {
		super();
	}

	public int getgenreId() {
		return genreId;
	}

	public void setgenreId(int genreId) {
		this.genreId = genreId;
	}

	public int getbandId() {
		return bandId;
	}

	public void setbandId(int bandId) {
		this.bandId = bandId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(bandId, genreId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		GenreHasBand other = (GenreHasBand) obj;
		return bandId == other.bandId && genreId == other.genreId;
	}

//	@Override
//	public String toString() {
//		return "GenreHasBand [genreId=" + genreId + ", bandId=" + bandId + "]";
//	}

	
	
	
}
