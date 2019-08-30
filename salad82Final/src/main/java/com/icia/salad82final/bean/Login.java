package com.icia.salad82final.bean;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("Login")
@Getter @Setter
public class Login {
	
	private String m_type;
	private String id;
	private String pwd;
	private String name;
	private String email;
}
