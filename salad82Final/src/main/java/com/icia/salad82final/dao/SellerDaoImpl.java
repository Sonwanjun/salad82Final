package com.icia.salad82final.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.icia.salad82final.bean.PD;

public class SellerDaoImpl {

	 // 마이바티스 
	 @Inject
	 private SqlSession sql;
	 
	// 매퍼
	 private static String namespace = "com.icia.salad82final.dao.mapper.seller_mapper";
	
	
	public void productCreate(PD pd) throws Exception{
		
		sql.insert(namespace + ".productCreate", pd);
	}
}
