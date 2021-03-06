package com.icia.salad82final.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.icia.salad82final.bean.Admin;
import com.icia.salad82final.bean.Category;
import com.icia.salad82final.bean.Customer;
import com.icia.salad82final.bean.Order;
import com.icia.salad82final.bean.PD;
import com.icia.salad82final.bean.Seller;

public interface AdminDao {

	List<Seller> getSellerInfo(int pageNum);

	List<Customer> getCustomerInfo(int pageNum);

	int getInfoCount(@Param("viewName")String viewName);
				  //(@Param("이름")String viewName) 처럼 @Param 어노테이션을 쓰면 매퍼에서 지정한 이름을 쓸수있다 

	Seller getSellerInfoDetail(String s_id);

	List<HashMap<String, Object>> getSelledProdInfo(HashMap<String, Object> param);

	int getCountBySid(HashMap<String, Object> param);

	List<PD> getRegProdInfo(HashMap<String, Object> param);

	List<Integer> getIncomesBySeller(String s_id);

	Customer getCustomerInfoDetail(String s_id);

	List<Order> getPurcProdInfo(HashMap<String, Object> param);

	List<Integer> getCustomerTotals(String c_id);

	int getCustDetailTotalCount(String c_id);

	List<Category> getFirstIngrCat();
	
	List<Category> getSecondIngrCat();

	Category getIngrCount();

	boolean addFirstCategory(HashMap<String, String> param);
	boolean addSecondCategory(HashMap<String, Object> param);

	void deleteIngrCategory(HashMap<String, Object> param);

	List<PD> getAllProduct(Integer pNum);

	int allow(Integer p_code);	
	
	

	// 암호화 되지 않은 비밀번호 암호화
	/*
	 * int getCount(String table);
	 * 
	 * List<Admin> getIds(String table);
	 * 
	 * int pwdChange(HashMap<String, String> param);
	 */
}
