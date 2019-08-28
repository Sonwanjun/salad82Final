package com.icia.salad82final.bean;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("seller")
@Getter @Setter
public class Seller {
	
	private String s_id;
	private String m_type;
	private String s_name;
	private String s_pwd;
	private String s_num;
	private String s_address;
	private String s_phone;
	private String s_email;
	private String s_date;
	
	private String ronum;
	
}
