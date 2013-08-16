package org.test.models;

import java.util.Date;

import com.googlecode.objectify.Ref;
import com.googlecode.objectify.annotation.Cache;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;
import com.googlecode.objectify.annotation.Load;

@Entity
@Cache
@Index
public class Task {
	// fields
	@Id Long id;
	String name;
	Date createdOn;
	Date deadline;
	
	// foreign keys
	String userId;
	@Load Ref<Category> category;

	@SuppressWarnings("unused")
	private Task(){}
	
	public Task(String name, String userId, Date createdOn, Date deadline, Category category) {
		this.name = name;
		this.createdOn = createdOn;
		this.deadline = deadline;
		this.userId = userId;
		setCategory(category);
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Date getCreatedOn() {
		return createdOn;
	}
	
	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}
	
	public Date getDeadline() {
		return deadline;
	}
	
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public Category getCategory() {
		return category.get();
	}
	
	public void setCategory(Category category) {
		this.category = Ref.create(category);
	}
}
