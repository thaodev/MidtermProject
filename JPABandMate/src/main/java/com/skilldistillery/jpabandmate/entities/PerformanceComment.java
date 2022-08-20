package com.skilldistillery.jpabandmate.entities;

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
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "performance_comment")
public class PerformanceComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String comment;

	@Column(name = "comment_date")
	@CreationTimestamp
	private LocalDateTime commentDate;

	@ManyToOne
	@JoinColumn(name = "reply_to_id")
	private PerformanceComment reply;

	@OneToMany(mappedBy = "reply")
	private List<PerformanceComment> replies;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@ManyToOne
	@JoinColumn(name = "performance_id")
	private Performance performance;

	// CONSTRUCTOR
	public PerformanceComment() {
		super();
	}

	// METHODS

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public LocalDateTime getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(LocalDateTime commentDate) {
		this.commentDate = commentDate;
	}

	public PerformanceComment getReply() {
		return reply;
	}

	public void setReply(PerformanceComment reply) {
		this.reply = reply;
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
		PerformanceComment other = (PerformanceComment) obj;
		return id == other.id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Performance getPerformance() {
		return performance;
	}

	public void setPerformance(Performance performance) {
		this.performance = performance;
	}

	public List<PerformanceComment> getReplies() {
		return replies;
	}

	public void setReplies(List<PerformanceComment> replies) {
		this.replies = replies;
	}

//	@Override
//	public String toString() {
//		return "PerformanceComment [id=" + id + ", comment=" + comment + ", commentDate=" + commentDate + ", reply="
//				+ reply + "]";
//	}

}
