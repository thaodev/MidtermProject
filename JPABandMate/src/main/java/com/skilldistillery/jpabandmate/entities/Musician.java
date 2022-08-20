package com.skilldistillery.jpabandmate.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class Musician {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;
	
	private String phone;
	
	private String bio;
	
	private int vocals;
	
	@Column(name="band_member_image_url")
	private String bandMemberImage;

	@ManyToMany(mappedBy = "followedMusicians")
	private List<User> followers;
	
	@OneToMany(mappedBy="musician")
	private List<Instrument> instruments;
	
	//CONSTRUCTOR
	public Musician() {
		super();
	}
	
	
	//METHODS
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public int getVocals() {
		return vocals;
	}

	public void setVocals(int vocals) {
		this.vocals = vocals;
	}

	public String getBandMemberImage() {
		return bandMemberImage;
	}

	public void setBandMemberImage(String bandMemberImage) {
		this.bandMemberImage = bandMemberImage;
	}

	
	public List<User> getFollowers() {
		return followers;
	}


	public void setFollowers(List<User> followers) {
		this.followers = followers;
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
		Musician other = (Musician) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Musician [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", instrument="
				 + ", phone=" + phone + ", bio=" + bio + ", vocals=" + vocals + ", bandMemberImage="
				+ bandMemberImage + "]";
	}


	public List<Instrument> getInstruments() {
		return instruments;
	}


	public void setInstruments(List<Instrument> instruments) {
		this.instruments = instruments;
	}
	
	
	
}
