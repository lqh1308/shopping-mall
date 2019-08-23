package com.lqh.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
@ToString(exclude = {"type", "weight", "created", "author", "updated", "last_modifier"})
public class Category implements Serializable {
	private Integer cgy_id;

	private Integer p_cgy_id;
	
	private String title;

	private int level;
	
	private String type;
	
	private Integer weight;
	
	private Date created;

	private String author;
	
	private Date updated;

	private String last_modifier;
}
