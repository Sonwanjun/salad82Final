package com.icia.salad82final.bean;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("notice")
@Getter @Setter
public class Notice {
	
	private String n_num;
	private String n_title;
	private String n_contents;
	private String n_date;

	
}
