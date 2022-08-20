package com.skilldistillery.jpabandmate.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "ticket_sale")
public class TicketSale {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "ticket_price")
	private double ticketPrice;

	@Column(name = "sale_date")
	@CreationTimestamp
	private LocalDateTime saleDate;
	
	@ManyToOne
	@JoinColumn(name="performance_id")
	private Performance performance;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;

	// CONSTRUCTOR
	public int getId() {
		return id;
	}

	// METHODS
	public void setId(int id) {
		this.id = id;
	}

	public double getTicketPrice() {
		return ticketPrice;
	}

	public void setTicketPrice(double ticketPrice) {
		this.ticketPrice = ticketPrice;
	}

	public LocalDateTime getSaleDate() {
		return saleDate;
	}

	public void setSaleDate(LocalDateTime saleDate) {
		this.saleDate = saleDate;
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
		TicketSale other = (TicketSale) obj;
		return id == other.id;
	}

	public Performance getPerformance() {
		return performance;
	}

	public void setPerformance(Performance performance) {
		this.performance = performance;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

//	@Override
//	public String toString() {
//		return "TicketSale [id=" + id + ", ticketPrice=" + ticketPrice + ", saleDate=" + saleDate + "]";
//	}

}
