package com.icia.salad82final.bean;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("DIY")
@Getter @Setter
public class DIY {
	
	private int p_code;
	private int cf_code;
	private int cs_code;
}
