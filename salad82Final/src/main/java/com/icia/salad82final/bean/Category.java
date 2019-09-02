package com.icia.salad82final.bean;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("category")
@Getter @Setter
public class Category {

	private int cf_code;
	private String cf_name;
	private int cs_code;
	private String cs_name;
	
	private int cf_count;
	private int cs_count;
	
}
