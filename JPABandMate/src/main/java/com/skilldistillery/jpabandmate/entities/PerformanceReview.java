package com.skilldistillery.jpabandmate.entities;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import org.hibernate.annotations.CreationTimestamp;

@Embeddable
public class PerformanceReview implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Column(name="user_id")
	private int userId;
	
	@Column(name="performance_id")
	private int performanceId;
	
	private int rating;
	
	@Column(name="rating_comment")
	private String ratingComment;
	
	@Column(name="review_date")
	@CreationTimestamp
	private LocalDateTime reviewDate;

	
	//CONSTRUCTOR
	public PerformanceReview() {
		super();
	}

	
	//METHODS
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getPerformanceId() {
		return performanceId;
	}

	public void setPerformanceId(int performanceId) {
		this.performanceId = performanceId;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public int hashCode() {
		return Objects.hash(performanceId, userId);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PerformanceReview other = (PerformanceReview) obj;
		return performanceId == other.performanceId && userId == other.userId;
	}

	
	
//	@Override
//	public String toString() {
//		return "PerformanceReview [userId=" + userId + ", performanceId=" + performanceId + ", rating=" + rating
//				+ ", ratingComment=" + ratingComment + ", reviewDate=" + reviewDate + "]";
//	}
	
	
	
}
