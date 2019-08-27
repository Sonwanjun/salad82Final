package com.icia.salad82final.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.icia.salad82final.bean.Customer;
import com.icia.salad82final.bean.PD;
import com.icia.salad82final.bean.Seller;

public interface AdminDao {

	List<Seller> getSellerInfo(int pageNum);

	List<Customer> getCustomerInfo(int pageNum);

	int getInfoCount(String viewName);

	Seller getSellerInfoDetail(String s_id);

	List<HashMap<String, Object>> getSelledProdInfo(HashMap<String, Object> param);

	int getCountBySid(HashMap<String, Object> param);

	List<PD> getRegProdInfo(HashMap<String, Object> param);

	List<Integer> getIncomesBySeller(String s_id);
	//TODO 확인용
}
