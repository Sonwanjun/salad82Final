package com.icia.salad82final.bean;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("board")
@Getter @Setter

public class Board {
	
	private String b_num;
	private String c_id;
	private String b_contents;
	private String b_date;
	private String b_imgname;
	private String b_imgpath;
	private String b_views;

}
