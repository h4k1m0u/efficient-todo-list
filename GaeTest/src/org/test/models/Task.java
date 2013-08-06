package org.test.models;

import java.util.Date;

import com.googlecode.objectify.annotation.Cache;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@Entity
@Cache
public class Task {
	@Id String id;
	@Index Date createdOn;
	String name;
	String userId;
	
	@SuppressWarnings("unused")
	private Task(){}
	
	public Task(String name, String userId) {
		this.name = name;
		this.createdOn = new Date();
		this.userId = userId;
	}
}
