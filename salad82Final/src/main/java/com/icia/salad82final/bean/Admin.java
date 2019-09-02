package com.icia.salad82final.bean;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("admin")
@Getter @Setter
public class Admin {
	
	private String a_id;
	private String m_type;
	private String a_pwd;
	private String a_name;
	private String a_email;

}
