package com.skilldistillery.jpabandmate.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Table;

@Embeddable
@Table(name="followed_musician")
public class FollowedMusician implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Column(name="user_id")
	private int userId;
	
	@Column(name="musician_id")
	private int musicianId;

	public FollowedMusician() {
		super();
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getMusicianId() {
		return musicianId;
	}

	public void setMusicianId(int musicianId) {
		this.musicianId = musicianId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(musicianId, userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		FollowedMusician other = (FollowedMusician) obj;
		return musicianId == other.musicianId && userId == other.userId;
	}
//
//	@Override
//	public String toString() {
//		return "FollowedMusician [userId=" + userId + ", musicianId=" + musicianId + "]";
//	}
	
	
	
}
