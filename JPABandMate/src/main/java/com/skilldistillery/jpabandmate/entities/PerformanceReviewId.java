package com.skilldistillery.jpabandmate.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class PerformanceReviewId implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Column(name="user_id")
	private int userId;
	
	@Column(name="performance_id")
	private int performanceId;
	
	
	//CONSTRUCTOR
	public PerformanceReviewId() {
	}

	
	public PerformanceReviewId(int userId, int performanceId) {
		this.userId = userId;
		this.performanceId = performanceId;
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
		PerformanceReviewId other = (PerformanceReviewId) obj;
		return performanceId == other.performanceId && userId == other.userId;
	}

	
	
//	@Override
//	public String toString() {
//		return "PerformanceReview [userId=" + userId + ", performanceId=" + performanceId + ", rating=" + rating
//				+ ", ratingComment=" + ratingComment + ", reviewDate=" + reviewDate + "]";
//	}
	
	
	
}
