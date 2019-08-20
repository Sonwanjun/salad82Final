package com.icia.salad82final.dao;

import java.util.List;

import com.icia.salad82final.bean.Customer;
import com.icia.salad82final.bean.Seller;

public interface AdminDao {

	List<Seller> getSellerInfo(int pageNum);

	List<Customer> getCustomerInfo(int pageNum);

	int getInfoCount(String viewName);

}
