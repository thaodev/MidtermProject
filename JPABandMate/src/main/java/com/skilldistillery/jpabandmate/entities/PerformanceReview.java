package com.skilldistillery.jpabandmate.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name="performance_review")
public class PerformanceReview {
	
	@EmbeddedId
	private PerformanceReviewId id;
	
	private int rating;
	
	@Column(name="rating_comment")
	private String ratingComment;
	
	@Column(name="review_date")
	private LocalDateTime reviewDate;
	
	@ManyToOne
	@JoinColumn(name="performance_id")
	@MapsId(value="performanceId")
	private Performance performance;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	@MapsId(value="userId")
	private User user;
	
	public PerformanceReview() {
	}

	public PerformanceReviewId getId() {
		return id;
	}

	public void setId(PerformanceReviewId id) {
		this.id = id;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getRatingComment() {
		return ratingComment;
	}

	public void setRatingComment(String ratingComment) {
		this.ratingComment = ratingComment;
	}

	public LocalDateTime getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(LocalDateTime reviewDate) {
		this.reviewDate = reviewDate;
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

}
