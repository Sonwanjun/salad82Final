package com.icia.salad82final.bean;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("pd")
@Getter @Setter
public class PD {

	private int p_code;
	private String p_type;
	private String p_name;
	private String s_id;
	private int p_price;
	private String p_date;
	private int p_selled;
	private int p_remain;
	private String p_contents;
	private String p_permission;
	
	private String pi_name; //사진 등록중,,
	
}

