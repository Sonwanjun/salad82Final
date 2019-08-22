package com.icia.salad82final.bean;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("product")
@Getter @Setter
public class PD {

	private int p_code;
	private String p_type;
	private String p_name;
	private String s_id;
	private int  p_price;
	private Date p_date;
	private int p_selled;
	private int p_remain;
	private String  p_contents;
}

