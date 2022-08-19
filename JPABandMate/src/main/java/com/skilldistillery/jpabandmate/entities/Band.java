package com.skilldistillery.jpabandmate.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Band {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String description;
	
	@Column(name="year_formed")
	private String yearFormed;
	
	@Column(name="band_image_url")
	private String bandImage;
	
	@Column(name="band_logo_url")
	private String bandLogo;

	
	
	//CONSTRUCTOR
	public Band() {
		super();
	}

	
	//METHODS
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getYearFormed() {
		return yearFormed;
	}

	public void setYearFormed(String yearFormed) {
		this.yearFormed = yearFormed;
	}

	public String getBandImage() {
		return bandImage;
	}

	public void setBandImage(String bandImage) {
		this.bandImage = bandImage;
	}

	public String getBandLogo() {
		return bandLogo;
	}

	public void setBandLogo(String bandLogo) {
		this.bandLogo = bandLogo;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Band other = (Band) obj;
		return id == other.id;
	}
	
	

//	@Override
//	public String toString() {
//		return "Band [id=" + id + ", name=" + name + ", description=" + description + ", yearFormed=" + yearFormed
//				+ ", bandImage=" + bandImage + ", bandLogo=" + bandLogo + "]";
//	}
	
	
}
