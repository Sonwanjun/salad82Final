package com.icia.salad82final.dao;

import com.icia.salad82final.bean.Customer;

public interface CustomerDao {

	boolean customerInsert(Customer ct);

	public Customer idCheck(String c_id) throws Exception;


}
