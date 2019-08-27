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
	private Object p_date; //TODO 날짜를 object로 받아서 뿌려주면 좀더 간결하게 나옴
	private int p_selled;
	private int p_remain;
	private String p_contents;
	private String p_permission;
	
}

