package com.icia.salad82final.bean;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("cart")
@Getter @Setter
public class Cart {
	
	private int ct_num;
	private String c_id;
	private int p_code;
	private int ct_amount;
	private String ct_demand;
	
}
