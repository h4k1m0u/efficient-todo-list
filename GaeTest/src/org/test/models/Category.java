package org.test.models;

import static com.googlecode.objectify.ObjectifyService.ofy;

import com.googlecode.objectify.annotation.Cache;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@Entity
@Cache
@Index
public class Category {
	// fields
	@Id Long id;
	String name;
	
	@SuppressWarnings("unused")
	private Category(){}
	
	public Category(String name) {
		this.name = name;
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
	
	public static void createCategories() {
		// create all categories
		Category important = new Category("Important");
		Category reminder = new Category("Reminder");
		Category today = new Category("Today");
		Category life = new Category("Life");
		Category work = new Category("Work");
		
		ofy().save().entity(important).now();
		ofy().save().entity(reminder).now();
		ofy().save().entity(today).now();
		ofy().save().entity(life).now();
		ofy().save().entity(work).now();
	}
}
