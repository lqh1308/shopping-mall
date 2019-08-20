package com.lqh.entity;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class User {
	private Integer id;
	
	private String username;
	
	private String password;
	
	private String phone;
	
	private String email;
	
	private Date created;
	
	private Date updated;
	
	private String openId;
}
