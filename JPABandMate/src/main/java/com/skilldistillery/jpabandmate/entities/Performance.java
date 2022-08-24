package com.skilldistillery.jpabandmate.entities;

import java.beans.Transient;
import java.time.LocalDate;
import java.time.LocalTime;

import java.util.ArrayList;

import java.time.format.DateTimeFormatter;

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

@Entity
public class Performance {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="performance_date")
	private LocalDate performanceDate;
	
	@Column(name="ticket_price")
	private double ticketPrice;
	
	private String name;
	
	@Column(name="start_time")
	private LocalTime startTime;
	
	@Column(name="end_time")
	private LocalTime endTime;

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
		ticketSales = new ArrayList<>();
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

	@Transient
	public String getDateFormatted() {
		String date = "";
		if (performanceDate != null) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy");
		date = formatter.format(performanceDate);
		}
		return date;
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

	public LocalTime getStartTime() {
		return startTime;
	}

	public void setStartTime(LocalTime startTime) {
		this.startTime = startTime;
	}

	public LocalTime getEndTime() {
		return endTime;
	}

	public void setEndTime(LocalTime endTime) {
		this.endTime = endTime;
	}

	@Transient
	public String getEndTimeFull() {
		
		return endTime.format(DateTimeFormatter.ofPattern("HH:mm:ss"));
	}
	
	@Transient
	public String getStartTimeFull() {
		
		return startTime.format(DateTimeFormatter.ofPattern("HH:mm:ss"));
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
	
	public void addTicket(TicketSale ticket) {
		ticketSales.add(ticket);
	}

	@Override
	public String toString() {
		return "Performance [id=" + id + ", performanceDate=" + performanceDate + ", ticketPrice=" + ticketPrice
				+ ", name=" + name + ", venue name=" + venue.getName()  + ", startTime=" + startTime + ", endTime=" + endTime + "]";
	}

	
	
	
}
