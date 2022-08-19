package com.skilldistillery.jpabandmate.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
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

}
