package com.icia.salad82final.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.icia.salad82final.bean.Customer;
import com.icia.salad82final.bean.PD;
import com.icia.salad82final.bean.Seller;


public interface SellerDao {

	boolean sellerInsert(Seller st);

	List<Seller> getsMyPage(int sNum);

	int productCreate(PD pd) throws Exception;
}
