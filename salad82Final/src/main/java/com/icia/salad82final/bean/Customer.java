package com.icia.salad82final.bean;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("customer")
@Getter @Setter
public class Customer {

	private String c_id;
	private String m_type;
	private String c_pwd;
	private String c_name;
	private String c_address;
	private String c_phone;
	private String c_email;
	private String c_date;
	
	private String ronum;
	
}
