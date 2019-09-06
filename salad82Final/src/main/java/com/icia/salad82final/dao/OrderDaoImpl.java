package com.icia.salad82final.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;


import com.icia.salad82final.bean.Cart;
import com.icia.salad82final.bean.PD;



public class OrderDaoImpl {

	 // 마이바티스 
	 @Inject
	 private SqlSession sql;
	 
	 // 매퍼
	 private static String namespace = "com.icia.salad82final.dao.mapper.order_mapper";
	
	 public void putTheCartList(Cart cart) throws Exception{
		
		sql.insert(namespace + ".putTheCartList", cart);
	}
	 

}
