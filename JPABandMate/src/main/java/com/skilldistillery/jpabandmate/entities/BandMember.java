package com.skilldistillery.jpabandmate.entities;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="band_member")
public class BandMember {
	
	@EmbeddedId
	private BandMemberId id;
	
	@Column(name="stage_name")
	private String stageName;
	
	private String role;
	

	public BandMember() {
		super();
	}

	public BandMemberId getId() {
		return id;
	}

	public void setId(BandMemberId id) {
		this.id = id;
	}

	public String getStageName() {
		return stageName;
	}

	public void setStageName(String stageName) {
		this.stageName = stageName;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	
	

}
