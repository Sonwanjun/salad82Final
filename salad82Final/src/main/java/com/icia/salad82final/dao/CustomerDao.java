package com.icia.salad82final.dao;


import java.util.Map;

import com.icia.salad82final.bean.Customer;

public interface CustomerDao {

	boolean customerInsert(Customer ct);

	public Customer idCheck(String c_id) throws Exception;

	int hashMapTest(Map<String, String> hMap);

	Map<String, String> hashMapTest2(String c_id);

	String getSecurityPwd(String c_id);

	Customer getCustomerInfo(String c_id);

}
