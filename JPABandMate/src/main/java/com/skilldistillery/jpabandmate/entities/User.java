package com.skilldistillery.jpabandmate.entities;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String username;

	private String password;

	private Boolean enabled;

	private String phone;

	private String email;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	private Boolean admin;

	@Column(name = "date_of_birth")
//	@DateTimeFormat(pattern = "MM-dd-yyyy")
	private LocalDate dob;

	@Column(name = "profile_image_url")
	private String profileImage;

	@OneToOne
	@JoinColumn(name = "address_id")
	private Address address;

	private String bio;

	@ManyToMany
	@JoinTable(name = "followed_musician", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "musician_id"))
	private List<Musician> followedMusicians;

	@ManyToMany
	@JoinTable(name = "followed_band", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "band_id"))
	private List<Band> bands;

	@OneToMany(mappedBy = "manager")
	private List<Band> managedBands;

	@OneToMany(mappedBy = "user")
	private List<TicketSale> ticketPurchases;

	@OneToMany(mappedBy = "user")
	private List<PerformanceComment> performanceComments;
	
	@OneToMany(mappedBy = "user")
	private List<PerformanceReview> performanceReviews;

	// CONSTRUCTOR
	public User() {
		super();
	}

	// METHODS

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public Boolean getAdmin() {
		return admin;
	}

	public void setAdmin(Boolean admin) {
		this.admin = admin;
	}

	public LocalDate getDob() {
		return dob;
	}
	
	@Transient
	public String getDobFormatted() {
		String birthday = "";
		if (dob != null) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy");
		birthday = formatter.format(dob);
		}
		return birthday;
	}
	
	public void setDob(LocalDate dob) {
		this.dob = dob;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public List<PerformanceReview> getPerformanceReviews() {
		return performanceReviews;
	}

	public void setPerformanceReviews(List<PerformanceReview> performanceReviews) {
		this.performanceReviews = performanceReviews;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public List<Musician> getFollowedMusicians() {
		return followedMusicians;
	}

	public void setFollowedMusicians(List<Musician> musicians) {
		this.followedMusicians = musicians;
	}

	public List<Band> getBands() {
		return bands;
	}

	public void setBands(List<Band> bands) {
		this.bands = bands;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}
	
	public boolean hasPerformanceReview(int id) {
		for (PerformanceReview review : performanceReviews) {
			if (review.getId().getPerformanceId() == id) {
				return true;
			}
			
		}
		return false;
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
		User other = (User) obj;
		return id == other.id;
	}

	public List<Band> getManagedBands() {
		return managedBands;
	}

	public void setManagedBands(List<Band> managedBands) {
		this.managedBands = managedBands;
	}

	public List<TicketSale> getTicketPurchases() {
		return ticketPurchases;
	}

	public void setTicketPurchases(List<TicketSale> ticketPurchases) {
		this.ticketPurchases = ticketPurchases;
	}

	public List<PerformanceComment> getPerformanceComments() {
		return performanceComments;
	}

	public void setPerformanceComments(List<PerformanceComment> performanceComments) {
		this.performanceComments = performanceComments;
	}

//	@Override
//	public String toString() {
//		return "User [id=" + id + ", username=" + username + ", password=" + password + ", enabled=" + enabled
//				+ ", role=" + role + "]";
//	}

}
