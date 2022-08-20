package com.skilldistillery.jpabandmate.entities;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class Performance {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="performance_date")
	@CreationTimestamp
	private LocalDate performanceDate;
	
	@Column(name="ticket_price")
	private double ticketPrice;
	
	private String name;
	
	@Column(name="start_time")
	@CreationTimestamp
	private LocalDateTime startTime;
	
	@Column(name="end_time")
	private LocalDateTime endTime;

	@ManyToOne
	@JoinColumn(name="band_id")
	private Band band;
	
	@ManyToOne
	@JoinColumn(name="venue_id")
	private Venue venue;
	
	@OneToMany(mappedBy="performance")
	private List<TicketSale> ticketSales;
	
	@OneToMany(mappedBy="performance")
	private List<PerformanceComment> performanceComments;
	
	
	//CONSTRUCTOR
	public Performance() {
		super();
	}

	//METHODS

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDate getPerformanceDate() {
		return performanceDate;
	}

	public void setPerformanceDate(LocalDate performanceDate) {
		this.performanceDate = performanceDate;
	}

	public double getTicketPrice() {
		return ticketPrice;
	}

	public void setTicketPrice(double ticketPrice) {
		this.ticketPrice = ticketPrice;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public LocalDateTime getStartTime() {
		return startTime;
	}

	public void setStartTime(LocalDateTime startTime) {
		this.startTime = startTime;
	}

	public LocalDateTime getEndTime() {
		return endTime;
	}

	public void setEndTime(LocalDateTime endTime) {
		this.endTime = endTime;
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
		Performance other = (Performance) obj;
		return id == other.id;
	}

	public Band getBand() {
		return band;
	}

	public void setBand(Band band) {
		this.band = band;
	}

	public Venue getVenue() {
		return venue;
	}

	public void setVenue(Venue venue) {
		this.venue = venue;
	}

	public List<TicketSale> getTicketSales() {
		return ticketSales;
	}

	public void setTicketSales(List<TicketSale> ticketSales) {
		this.ticketSales = ticketSales;
	}

	public List<PerformanceComment> getPerformanceComments() {
		return performanceComments;
	}

	public void setPerformanceComments(List<PerformanceComment> performanceComments) {
		this.performanceComments = performanceComments;
	}

//	@Override
//	public String toString() {
//		return "Performance [id=" + id + ", performanceDate=" + performanceDate + ", ticketPrice=" + ticketPrice
//				+ ", name=" + name + ", startTime=" + startTime + ", endTime=" + endTime + "]";
//	}
	
	
	
}
