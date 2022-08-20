package com.skilldistillery.jpabandmate.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Venue {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private int capacity;
	
	@Column(name="venue_image_url")
	private String venueImageUrl;

	private String description;
	
	@OneToMany(mappedBy="venue")
	private List<Performance> performances;
	
	@OneToOne
	@JoinColumn(name="address_id")
	private Address address;
	
	
	//CONSTRUCTOR
	public Venue() {
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

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public String getVenueImageUrl() {
		return venueImageUrl;
	}

	public void setVenueImageUrl(String venueImageUrl) {
		this.venueImageUrl = venueImageUrl;
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
		Venue other = (Venue) obj;
		return id == other.id;
	}

	public List<Performance> getPerformances() {
		return performances;
	}

	public void setPerformances(List<Performance> performances) {
		this.performances = performances;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

//	@Override
//	public String toString() {
//		return "Venue [id=" + id + ", name=" + name + ", capacity=" + capacity + ", venueImageUrl=" + venueImageUrl
//				+ ", description=" + description + "]";
//	}
	
	
	
}
