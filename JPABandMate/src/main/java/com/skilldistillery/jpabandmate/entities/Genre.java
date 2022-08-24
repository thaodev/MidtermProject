package com.skilldistillery.jpabandmate.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Genre {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String description;
	
	@ManyToMany(mappedBy = "genres")
	private List<Band> bands;
	
	//CONSTRUCTOR
	public Genre() {
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
		Genre other = (Genre) obj;
		return id == other.id;
	}


	public List<Band> getBands() {
		return bands;
	}


	public void setBands(List<Band> bands) {
		this.bands = bands;
	}
	
	public void addBand(Band band) {
		if (bands == null) {bands = new ArrayList<>(); }
		if (! bands.contains(band)) {
			bands.add(band);
			band.addGenre(this);
		}
	}
	
	public void removeBand(Band band) {
		if ( bands != null && bands.contains(band) ) {
			bands.remove(band);
			band.removeGenre(this);
		}
	}

//	@Override
//	public String toString() {
//		return "Genre [id=" + id + ", name=" + name + ", description=" + description + "]";
//	}
	
}
