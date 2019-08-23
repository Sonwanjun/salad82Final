package com.icia.salad82final.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.icia.salad82final.bean.Customer;

public class CustomerDaoImpl {

	 // 마이바티스 
	 @Inject
	 private SqlSession sql;
	 
	 // 매퍼
	 private static String namespace = "com.icia.salad82final.dao.mapper.customer_mapper";
	
	
	
	public Customer idCheck(String c_id) throws Exception
	{
		return sql.selectOne(namespace+".idCheck",c_id);
	}
}
