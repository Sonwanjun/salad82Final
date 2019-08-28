package com.icia.salad82final.bean;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("order")
@Getter @Setter
public class Order { //특정 구매자의 구매 정보를 가져오기 위한 빈
	
	private String o_date;
	private int o_num;
	private String p_name;
	private int od_amount;
	private int price; //한 주문 안의 단일 품목에 대한 구매액
	private int o_total;

}
